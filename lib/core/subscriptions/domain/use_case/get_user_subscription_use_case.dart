import 'package:dartz/dartz.dart';
import 'package:denwee/core/subscriptions/domain/entity/premium_packages.dart';
import 'package:denwee/core/subscriptions/domain/entity/user_subscription.dart';
import 'package:denwee/core/subscriptions/domain/failure/subscriptions_failure.dart';
import 'package:denwee/core/subscriptions/domain/repo/subscriptions_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetUserSubscriptionUseCase {
  final SubscriptionsRepo _subscriptionsRepo;

  const GetUserSubscriptionUseCase(this._subscriptionsRepo);

  static const retryDelay = Duration(milliseconds: 1000);

  /// Waits until backend returns a successful response and **NON-null** subscription.
  ///
  /// Used right after purchase when RevenueCat webhook may not be processed yet.
  /// 
  /// If [targetPackageType] is provided, the function will poll until backend will return exactly [targetPackageType]
  Future<Either<SubscriptionsFailure, Option<UserSubscription>>> untilSubscription({PremiumPackageType? targetPackageType}) {
    return _retryFetch(stopWhen: (result) => result.fold(
        (_) => false,
        (maybeSubscription) => maybeSubscription.fold(() => false, (subscription) {
          if (targetPackageType != null) {
            return subscription.packageType == targetPackageType;
          }
          return true;
        }),
      ),
      maxAttempts: 4,
    );
  }

  /// Waits until backend returns ANY successful response,
  /// even if the subscription is **null**.
  ///
  /// Used on app startup to determine subscription state.
  Future<Either<SubscriptionsFailure, Option<UserSubscription>>> untilSuccess() {
    return _retryFetch(
      stopWhen: (result) => result.isRight(),
      maxAttempts: 2,
    );
  }

  /// Retry based on loop exit condition.
  /// [maxAttempts] is how many times subscription will be checked
  Future<Either<SubscriptionsFailure, Option<UserSubscription>>> _retryFetch({
    required bool Function(Either<SubscriptionsFailure, Option<UserSubscription>>) stopWhen,
    required int maxAttempts,
  }) async {
    late Either<SubscriptionsFailure, Option<UserSubscription>> result;

    for (var attempt = 0; attempt < maxAttempts; attempt++) {
      result = await _subscriptionsRepo.getSubscriptionRemote();

      if (stopWhen(result)) {
        final maybeSubscription = result.fold(
          (_) => null,
          (opt) => opt.toNullable(),
        );

        if (maybeSubscription != null) {
          await _subscriptionsRepo.storeSubscriptionLocal(maybeSubscription);
        }
        
        return result;
      }

      await Future<void>.delayed(retryDelay);
    }

    return result;
  }
}
