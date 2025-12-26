import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_preferences.freezed.dart';

@freezed
abstract class ThemePreferences with _$ThemePreferences {
  const factory ThemePreferences({
    required ThemeMode mode,
    required UniqueId colorationId,
  }) = _ThemePreferences;

  factory ThemePreferences.initial() {
    return ThemePreferences(
      mode: AppConstants.config.defaultThemeMode,
      colorationId: AppConstants.config.defaultThemeColorationId,
    );
  }
}
