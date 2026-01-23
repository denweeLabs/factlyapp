import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:denwee/core/auth/domain/repo/user_identity_repo.dart';
import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:denwee/core/subscriptions/data/model/user_subscription_dto.dart';
import 'package:denwee/core/subscriptions/data/source/local/subscriptions_local_source.dart';
import 'package:denwee/core/subscriptions/data/source/remote/subscriptions_remote_source.dart';
import 'package:denwee/core/subscriptions/domain/entity/premium_packages.dart';
import 'package:denwee/core/subscriptions/domain/entity/premium_product_ids.dart';
import 'package:denwee/core/subscriptions/domain/entity/user_subscription.dart';
import 'package:denwee/core/subscriptions/domain/failure/subscriptions_failure.dart';
import 'package:denwee/core/subscriptions/domain/repo/subscriptions_repo.dart';
import 'package:denwee/core/ui/constants/formatters/input_formatters.dart';
import 'package:denwee/di/env.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// Supported platforms
enum SubscriptionsPlatform { ios, android, test }

/// Primary repository for subscriptions handling by using RevenueCat [https://www.revenuecat.com]
/// 
/// Check how [SubscriptionOfferingsCubit] uses this repo
/// to fetch and display [PremiumPaywallPage]
@LazySingleton(as: SubscriptionsRepo)
class SubscriptionsRepoImpl implements SubscriptionsRepo {
  final SubscriptionsLocalSource _localSource;
  final SubscriptionsRemoteSource _remoteSource;
  final UserIdentityRepo _userIdentityRepo;
  final String _environment;

  const SubscriptionsRepoImpl(
    this._localSource,
    this._remoteSource,
    this._userIdentityRepo,
    @ENV this._environment,
  );

  bool get isDevEnvironment {
    return _environment == Env.dev;
  }

  /// RevenueCat API keys (safe to expose)
  /// For testing environments always use testApiKey (Test Store key in RevenueCat)
  static const _testApiKey = 'test_eSjMnjtclpkvGuEydMYeRweXAMt';
  static const _appleApiKey = 'appl_IXswkzlIllkxAAiCnxBfYpMRwoR';
  static const _googleApiKey = 'goog_niFJHsPcWIWljjdubNkQbwjECPk';
  String get _publicApiKey {
    if (isDevEnvironment) return _testApiKey;
    if (Platform.isIOS) return _appleApiKey;
    if (Platform.isAndroid) return _googleApiKey;
    throw UnsupportedError('Platform is not supported');
  }

  /// Subscription products identifiers.
  /// Specify all ids per platform as shown in "Product catalog"->"Products" in RevenueCat
  static const _entitlementId = 'premium';
  static const _productIds = <SubscriptionsPlatform, PremiumProductIds>{
    SubscriptionsPlatform.ios: PremiumProductIds(
      monthly: 'denwee_factlyapp_premium_month',
      yearly: 'denwee_factlyapp_premium_year',
    ),
    SubscriptionsPlatform.android: PremiumProductIds(
      monthly: 'denwee_factlyapp_premium_month',
      yearly: 'denwee_factlyapp_premium_year',
    ),
    SubscriptionsPlatform.test: PremiumProductIds(
      monthly: 'denwee_factlyapp_premium_month',
      yearly: 'denwee_factlyapp_premium_year',
    ),
  };

  /// All RevenueCat's auto-generated ids contain "anonymous" word inside
  static const anonIdKeyword = 'anonymous';

  @override
  PremiumProductIds get productIds {
    if (isDevEnvironment) return _productIds[SubscriptionsPlatform.test]!;
    if (Platform.isIOS) return _productIds[SubscriptionsPlatform.ios]!;
    if (Platform.isAndroid) return _productIds[SubscriptionsPlatform.android]!;
    throw UnsupportedError('Platform is not supported');
  }

  @override
  Future<String> get currentUserId {
    return Purchases.appUserID;
  }

  /// All RevenueCat auto-generated IDs contain "anonymous" keyword.
  /// A valid user ID must:
  /// 1. NOT be anonymous
  /// 2. Match any UUID format (backend-generated)
  @override
  Future<bool> get isCurrentUserIdValid async {
    final id = await currentUserId;
    final isAnonId = id.toLowerCase().contains(anonIdKeyword);
    final isUuid = anyUUIDRegExp.hasMatch(id);
    return !isAnonId && isUuid;
  }

  @override
  Future<Either<SubscriptionsFailure, Unit>> init() async {
    try {
      final config = PurchasesConfiguration(_publicApiKey);
      await Purchases.configure(config);
      return right(unit);
    } on PlatformException catch (error) {
      final failure = SubscriptionsFailure.fromPurchasesError(
        PurchasesErrorHelper.getErrorCode(error),
      );
      return left(failure);
    } catch (error) {
      return left(SubscriptionsFailure.unexpected);
    }
  }

  @override
  Future<Either<SubscriptionsFailure, PremiumPackages>> getPackages() async {
    try {
      final offerings = await Purchases.getOfferings();
      try {
        final packages = PremiumPackages.fromOfferings(offerings);
        return right(packages);
      } catch (_) {
        return left(SubscriptionsFailure.packagesMissing);
      }
    } on PlatformException catch (error) {
      final failure = SubscriptionsFailure.fromPurchasesError(
        PurchasesErrorHelper.getErrorCode(error),
      );
      return left(failure);
    } catch (error) {
      return left(SubscriptionsFailure.unexpected);
    }
  }

  @override
  Future<Either<SubscriptionsFailure, Unit>> purchase(PremiumPackage package) async {
    try {
      if (!(await isCurrentUserIdValid)) await login();  // login in case ID is not valid
      if (!(await isCurrentUserIdValid)) {
        return left(SubscriptionsFailure.configuration); // ID still not valid so return an error
      }
      final params = PurchaseParams.package(package.data);
      final result = await Purchases.purchase(params);
      if (result.customerInfo.entitlements.active.containsKey(_entitlementId)) {
        return right(unit);
      }
      return left(SubscriptionsFailure.purchaseCancelled);
    } on PlatformException catch (error) {
      final failure = SubscriptionsFailure.fromPurchasesError(
        PurchasesErrorHelper.getErrorCode(error),
      );
      return left(failure);
    } catch (error) {
      return left(SubscriptionsFailure.unexpected);
    }
  }

  @override
  Future<Either<SubscriptionsFailure, Unit>> login() async {
    final failureOrSuccess = await _userIdentityRepo.getUserIdRemote();
    final userId = failureOrSuccess.toOption().toNullable();
    if (userId == null) {
      return left(SubscriptionsFailure.configuration);
    }
    try {
      await Purchases.logIn(userId);
      return right(unit);
    } on PlatformException catch (error) {
      final failure = SubscriptionsFailure.fromPurchasesError(
        PurchasesErrorHelper.getErrorCode(error),
      );
      return left(failure);
    } catch (error) {
      return left(SubscriptionsFailure.unexpected);
    }
  }

  @override
  Future<Either<SubscriptionsFailure, Unit>> logout() async {
    try {
      await Purchases.logOut();
      return right(unit);
    } on PlatformException catch (error) {
      final failure = SubscriptionsFailure.fromPurchasesError(
        PurchasesErrorHelper.getErrorCode(error),
      );
      return left(failure);
    } catch (error) {
      return left(SubscriptionsFailure.unexpected);
    }
  }

  @override
  Future<Either<SubscriptionsFailure, Unit>> restore() async {
    try {
      if (!(await isCurrentUserIdValid)) await login();  // login in case ID is not valid
      if (!(await isCurrentUserIdValid)) {
        return left(SubscriptionsFailure.configuration); // ID still not valid so return an error
      }
      final result = await Purchases.restorePurchases();
      if (result.entitlements.active.containsKey(_entitlementId)) {
        return right(unit);
      }
      return left(SubscriptionsFailure.subscriptionNotFound);
    } on PlatformException catch (error) {
      final failure = SubscriptionsFailure.fromPurchasesError(
        PurchasesErrorHelper.getErrorCode(error),
      );
      return left(failure);
    } catch (error) {
      return left(SubscriptionsFailure.unexpected);
    }
  }
  
  @override
  Option<UserSubscription> getSubscriptionLocal() {
    final data = _localSource.get();
    return optionOf(data?.toDomain());
  }

  @override
  Future<Unit> storeSubscriptionLocal(UserSubscription subscription) async {
    final dto = UserSubscriptionDto.fromDomain(subscription);
    await _localSource.store(dto);
    return unit;
  }
  
  @override
  Future<Unit> deleteSubscriptionLocal() async {
    await _localSource.delete();
    return unit;
  }

  @override
  Future<Either<SubscriptionsFailure, Option<UserSubscription>>> getSubscriptionRemote() async {
    try {
      final subscription = await _remoteSource.getSubscription();
      return right(optionOf(subscription?.toDomain()));
    } on AppException catch (error) {
      final failure = SubscriptionsFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(SubscriptionsFailure.unexpected);
    }
  }
}
