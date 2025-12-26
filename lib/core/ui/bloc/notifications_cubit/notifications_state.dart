part of 'notifications_cubit.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(None()) Option<PushNotification> notification,
  }) = _NotificationsState;

  factory NotificationsState.initial() => const NotificationsState();
}
