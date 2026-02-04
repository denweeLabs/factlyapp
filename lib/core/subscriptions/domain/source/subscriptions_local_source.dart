import 'package:denwee/core/subscriptions/data/model/user_subscription_dto.dart';

abstract class SubscriptionsLocalSource {
  ///
  /// Get user subscription
  UserSubscriptionDto? get();

  ///
  /// Store user subscription
  Future<void> store(UserSubscriptionDto dto);
  
  ///
  /// Delete user subscription
  Future<void> delete();
}
