import 'package:denwee/core/network/data/exceptions/connection_exception.dart';
import 'package:denwee/core/subscriptions/data/model/user_subscription_dto.dart';

abstract class SubscriptionsRemoteSource {
  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<UserSubscriptionDto?> getSubscription();
}
