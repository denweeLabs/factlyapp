part of 'select_notification_time_cubit.dart';

@freezed
abstract class SelectNotificationTimeState with _$SelectNotificationTimeState {
  const SelectNotificationTimeState._();
  const factory SelectNotificationTimeState({required DateTime time}) =
      _SelectNotificationTimeState;

  factory SelectNotificationTimeState.initial() {
    final notificationTimes = [...AppConstants.config.defaultNotificationTimes]
      ..shuffle();
    return SelectNotificationTimeState(time: notificationTimes.first);
  }

  NotificationsPreferences get notificationPreferences =>
      NotificationsPreferences(
        time: time,
        isEnabled: AppConstants.config.defaultNotificationsEnabled,
      );
}
