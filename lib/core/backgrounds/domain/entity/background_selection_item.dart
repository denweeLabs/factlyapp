import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'background_selection_item.freezed.dart';

@freezed
class BackgroundSelectionItem with _$BackgroundSelectionItem {
  const BackgroundSelectionItem._();
  const factory BackgroundSelectionItem.defaultBackground() = Default;
  const factory BackgroundSelectionItem.availableBackground(AvailableBackground background) = Available;

  bool get isDefault => maybeWhen(defaultBackground: () => true, orElse: () => false);

  bool isSelected(UniqueId selectedId) => when(
      defaultBackground: () => selectedId == AppConstants.config.defaultBackgroundId,
      availableBackground: (background) => background.id == selectedId,
    );

  AvailableBackground? get background => maybeWhen(
    availableBackground: (background) => background,
    orElse: () => null,
  );
}