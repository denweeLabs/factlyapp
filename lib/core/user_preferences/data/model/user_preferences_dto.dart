import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/ui/constants/app/user_interests.dart';
import 'package:denwee/core/user_preferences/domain/entity/misc_preferences.dart';
import 'package:denwee/core/user_preferences/domain/entity/notifications_preferences.dart';
import 'package:denwee/core/user_preferences/domain/entity/theme_preferences.dart';
import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';
import 'package:utils/utils.dart';

part 'user_preferences_dto.g.dart';

@JsonSerializable()
@Immutable()
class UserPreferencesDto {
  @JsonKey(name: 'interest_ids') final List<int> interests;
  @JsonKey(name: 'notification_time') final String notificationTime;
  @JsonKey(name: 'notifications_enabled') final bool notificationsEnabled;
  @JsonKey(name: 'language_code') final String languageCode;
  @JsonKey(name: 'theme_mode') final String themeMode;
  @JsonKey(name: 'theme_coloration_id') final int themeColorationId;
  @JsonKey(name: 'haptics_enabled') final bool isHapticsEnabled;

  const UserPreferencesDto({
    required this.interests,
    required this.notificationTime,
    required this.notificationsEnabled,
    required this.languageCode,
    required this.themeMode,
    required this.themeColorationId,
    required this.isHapticsEnabled,
  });

  factory UserPreferencesDto.fromDomain(UserPreferences preferences) {
    return UserPreferencesDto(
      interests: preferences.interests
          .map((interest) => interest.id.value)
          .toList(),
      notificationTime: hhMmToString(preferences.notifications.time),
      notificationsEnabled: preferences.notifications.isEnabled,
      languageCode: preferences.language.languageCode,
      themeMode: preferences.theme.mode.name,
      themeColorationId: preferences.theme.colorationId.value,
      isHapticsEnabled: preferences.misc.isHapticsEnabled,
    );
  }

  UserPreferences toDomain() {
    return UserPreferences(
      interests: interests.toDomain(),
      language: Locale(languageCode),
      notifications: NotificationsPreferences(
        time: hhMmFromString(notificationTime),
        isEnabled: notificationsEnabled,
      ),
      theme: ThemePreferences(
        mode: ThemeMode.values.firstWhereOrNull((e) => e.name == themeMode) ?? ThemeMode.system,
        colorationId: UniqueId.fromValue(themeColorationId),
      ),
      misc: MiscPreferences(
        isHapticsEnabled: isHapticsEnabled,
      ),
    );
  }

  factory UserPreferencesDto.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserPreferencesDtoToJson(this);
}

extension ListOfUserInterestsX on List<int> {
  List<UserInterest> toDomain() {
    return map((interestId) => UserInterests.list
        .firstWhere((x) => x.id.value == interestId)).toList();
  }
}
