import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'misc_preferences.freezed.dart';

@freezed
abstract class MiscPreferences with _$MiscPreferences {
  const factory MiscPreferences({
    required bool isHapticsEnabled,
  }) = _MiscPreferences;

  factory MiscPreferences.initial() {
    return MiscPreferences(
      isHapticsEnabled: AppConstants.config.defaultHapticsEnabled,
    );
  }
}
