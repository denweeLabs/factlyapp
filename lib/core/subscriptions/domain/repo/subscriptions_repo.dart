import 'package:dartz/dartz.dart';
import 'package:denwee/core/subscriptions/domain/entity/premium_packages.dart';
import 'package:denwee/core/subscriptions/domain/entity/premium_product_ids.dart';
import 'package:denwee/core/subscriptions/domain/entity/user_subscription.dart';
import 'package:denwee/core/subscriptions/domain/failure/subscriptions_failure.dart';

abstract class SubscriptionsRepo {
  PremiumProductIds get productIds;
  Future<String> get currentUserId;
  Future<bool> get isCurrentUserIdValid;
  Future<Either<SubscriptionsFailure, Unit>> init();
  Future<Either<SubscriptionsFailure, PremiumPackages>> getPackages();
  Future<Either<SubscriptionsFailure, Unit>> purchase(PremiumPackage package);
  Future<Either<SubscriptionsFailure, Unit>> login();
  Future<Either<SubscriptionsFailure, Unit>> logout();
  Future<Either<SubscriptionsFailure, Unit>> restore();

  Option<UserSubscription> getSubscriptionLocal();
  Future<Unit> storeSubscriptionLocal(UserSubscription subscription);
  Future<Unit> deleteSubscriptionLocal();
  Future<Either<SubscriptionsFailure, Option<UserSubscription>>> getSubscriptionRemote();
}
