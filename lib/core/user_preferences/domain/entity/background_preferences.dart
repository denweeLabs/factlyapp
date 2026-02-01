import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'background_preferences.freezed.dart';

@freezed
abstract class BackgroundPreferences with _$BackgroundPreferences {
  const factory BackgroundPreferences({
    required UniqueId selectedBackgroundId,
  }) = _BackgroundPreferences;

  factory BackgroundPreferences.initial() {
    return BackgroundPreferences(
      selectedBackgroundId: AppConstants.config.defaultBackgroundId,
    );
  }
}
