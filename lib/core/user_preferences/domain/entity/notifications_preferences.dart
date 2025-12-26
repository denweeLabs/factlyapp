import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_preferences.freezed.dart';

@freezed
abstract class NotificationsPreferences with _$NotificationsPreferences {
  const factory NotificationsPreferences({
    required DateTime time,
    required bool isEnabled,
  }) = _NotificationsPreferences;

  factory NotificationsPreferences.initial() {
    final notificationTimes = [...AppConstants.config.defaultNotificationTimes]
      ..shuffle();

    return NotificationsPreferences(
      time: notificationTimes.first,
      isEnabled: AppConstants.config.defaultNotificationsEnabled,
    );
  }
}
