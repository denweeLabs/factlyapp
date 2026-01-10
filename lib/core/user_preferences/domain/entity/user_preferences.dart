import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/constants/app/user_interests.dart';
import 'package:denwee/core/user_preferences/domain/entity/misc_preferences.dart';
import 'package:denwee/core/user_preferences/domain/entity/notifications_preferences.dart';
import 'package:denwee/core/user_preferences/domain/entity/theme_preferences.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preferences.freezed.dart';

@freezed
abstract class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    required List<UserInterest> interests,
    required Locale language,
    required NotificationsPreferences notifications,
    required ThemePreferences theme,
    required MiscPreferences misc,
  }) = _UserPreferences;

  factory UserPreferences.initial() {
    return UserPreferences(
      interests: const <UserInterest>[],
      language: AppConstants.config.fallbackLocale,
      notifications: NotificationsPreferences.initial(),
      theme: ThemePreferences.initial(),
      misc: MiscPreferences.initial(),
    );
  }

  factory UserPreferences.fromOnboarding({
    required List<UserInterest> selectedInterests,
    required ThemePreferences selectedTheme,
    required Locale selectedLocale,
  }) {
    return UserPreferences(
      interests: selectedInterests,
      notifications: NotificationsPreferences.initial(),
      language: selectedLocale,
      theme: selectedTheme,
      misc: MiscPreferences.initial(),
    );
  }
}

extension UserPreferencesX on UserPreferences {
  UserPreferences normalized() {
    final orderMap = UserInterestsOrderX.orderIndex;

    final orderedInterests = [...interests]
      ..sort((a, b) {
        final aIndex = orderMap[a.id.value] ?? 9999;
        final bIndex = orderMap[b.id.value] ?? 9999;
        return aIndex.compareTo(bIndex);
      });

    return copyWith(interests: orderedInterests);
  }
}