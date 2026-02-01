import 'package:denwee/pages/background_edit/background_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_style.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'background_edit_state.dart';
part 'background_edit_cubit.freezed.dart';

@Injectable()
class BackgroundEditCubit extends Cubit<BackgroundEditState> {
  BackgroundEditCubit(@factoryParam this.initialStyle)
    : super(BackgroundEditState.fromBackgroundStyle(initialStyle));

  static const int minTextSize = 14;
  static const int maxTextSize = 30;

  int _sliderToTextSize(double value) {
    return (minTextSize + value * (maxTextSize - minTextSize)).round().clamp(
      minTextSize,
      maxTextSize,
    );
  }

  double get sliderValue {
    switch (state.mode) {
      case BackgroundEditMode.background:
        return state.backgroundFade;
      case BackgroundEditMode.text:
        return BackgroundEditState.textSizeToSlider(state.textSize);
    }
  }

  Color get colorPickerValue {
    switch (state.mode) {
      case BackgroundEditMode.background:
        return state.backgroundFadeColor;
      case BackgroundEditMode.text:
        return state.textColor;
    }
  }

  late final BackgroundStyle initialStyle;

  void changeMode(BackgroundEditMode mode) {
    emit(state.copyWith(mode: mode));
  }

  void changeColorPickerValue(Color color) {
    switch (state.mode) {
      case BackgroundEditMode.background:
        emitCheckState(state.copyWith(backgroundFadeColor: color));
        break;

      case BackgroundEditMode.text:
        emitCheckState(state.copyWith(textColor: color));
        break;
    }
  }

  void changeSliderValue(double value) {
    switch (state.mode) {
      case BackgroundEditMode.background:
        emitCheckState(state.copyWith(backgroundFade: value));
        break;

      case BackgroundEditMode.text:
        emitCheckState(state.copyWith(textSize: _sliderToTextSize(value)));
        break;
    }
  }

  void onSuccessBackgroundApply(bool isPurchasedViaStars) {
    emit(state.copyWith(
      hasChanges: false, 
      showPurchaseAnimation: isPurchasedViaStars,
    ));
  }

  void emitCheckState(BackgroundEditState newState) {
    final hasChanges = newState.backgroundStyle != initialStyle;
    emit(newState.copyWith(hasChanges: hasChanges));
  }
}
