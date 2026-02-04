import 'package:denwee/core/notifications/data/model/push_notifications_subscribe_body_dto.dart';

abstract class PushNotificationsRemoteSource {
  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<void> subscribe(PushNotificationsSubscribeBodyDto dto);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<void> unsubscribe(String token);
}