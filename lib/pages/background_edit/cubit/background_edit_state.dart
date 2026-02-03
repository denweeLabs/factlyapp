part of 'background_edit_cubit.dart';

@freezed
abstract class BackgroundEditState with _$BackgroundEditState {
  const BackgroundEditState._();
  const factory BackgroundEditState({
    required String textFont,
    required int textSize,
    required Color textColor,
    required double backgroundFade,
    required Color backgroundFadeColor,
    required BackgroundEditMode mode,
    @Default(false) bool hasChanges,
    @Default(false) bool showPurchaseAnimation,
  }) = _BackgroundEditState;

  factory BackgroundEditState.fromBackgroundStyle(BackgroundStyle style) =>
      BackgroundEditState(
        mode: BackgroundEditMode.text,
        textFont: style.textFont,
        textSize: style.textSize,
        textColor: style.textColor,
        backgroundFade: style.backgroundFade,
        backgroundFadeColor: style.backgroundFadeColor,
      );

  static double textSizeToSlider(int size) {
    return (size - BackgroundEditCubit.minTextSize) /
        (BackgroundEditCubit.maxTextSize - BackgroundEditCubit.minTextSize);
  }

  BackgroundStyle get backgroundStyle => BackgroundStyle(
    textFont: textFont,
    textSize: textSize,
    textColor: textColor,
    backgroundFade: backgroundFade,
    backgroundFadeColor: backgroundFadeColor,
  );
}
