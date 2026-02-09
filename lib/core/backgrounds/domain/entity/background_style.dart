import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'background_style.freezed.dart';

@freezed
abstract class BackgroundStyle with _$BackgroundStyle {
  const BackgroundStyle._();
  const factory BackgroundStyle({
    required String textFont,
    required int textSize,
    required Color textColor,
    required double backgroundFade,
    required Color backgroundFadeColor,
  }) = _BackgroundCategory;

  TextStyle get asTextStyle => factShortContent.copyWith(
    fontSize: textSize.sp,
    fontFamily: textFont,
    color: textColor,
  );

  Brightness get brightness {
    final hsv = HSVColor.fromColor(backgroundFadeColor);
    final isLight = hsv.value >= 0.5 && hsv.saturation <= 0.45 && backgroundFade > 0.5;
    return isLight ? Brightness.light : Brightness.dark;
  }
}
