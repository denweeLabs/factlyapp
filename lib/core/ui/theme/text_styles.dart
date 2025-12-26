import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle _styleWrapper({
  double? height,
  double? fontSize,
  double? letterSpacing,
  FontWeight? fontWeight,
  String? fontFamily,
}) => TextStyle(
      height: height,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );

TextStyle get h0 {
  return _styleWrapper(
    fontSize: 32.sp,
    letterSpacing: -0.3,
    fontFamily: AppConstants.style.textStyle.primaryFontFamily,
    fontWeight: FontWeight.w800,
  );
}

TextStyle get h1 {
  return _styleWrapper(
    fontSize: 24.sp,
    letterSpacing: -0.2,
    fontFamily: AppConstants.style.textStyle.primaryFontFamily,
    fontWeight: FontWeight.w700,
  );
}

TextStyle get h2 {
  return _styleWrapper(
    fontSize: 22.sp,
    letterSpacing: -0.6,
    fontFamily: AppConstants.style.textStyle.primaryFontFamily,
    fontWeight: FontWeight.w700,
  );
}

TextStyle get h3 {
  return _styleWrapper(
    fontSize: 20.sp,
    letterSpacing: -0.2,
    fontFamily: AppConstants.style.textStyle.primaryFontFamily,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get h4 {
  return _styleWrapper(
    fontSize: 18.sp,
    letterSpacing: -0.1,
    fontFamily: AppConstants.style.textStyle.primaryFontFamily,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get h5 {
  return _styleWrapper(
    fontSize: 16.sp,
    letterSpacing: -0.1,
    fontFamily: AppConstants.style.textStyle.primaryFontFamily,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get h6 {
  return _styleWrapper(
    fontSize: 14.sp,
    letterSpacing: 0.0,
    fontFamily: AppConstants.style.textStyle.primaryFontFamily,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get bodyL {
  return _styleWrapper(
    fontSize: 16.sp,
    letterSpacing: -0.1,
    fontFamily: AppConstants.style.textStyle.primaryFontFamily,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get bodyM {
  return _styleWrapper(
    fontSize: 14.sp,
    letterSpacing: -0.2,
    fontFamily: AppConstants.style.textStyle.primaryFontFamily,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get bodyS {
  return _styleWrapper(
    fontSize: 12.sp,
    letterSpacing: -0.1,
    fontFamily: AppConstants.style.textStyle.primaryFontFamily,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get solidButton {
  return _styleWrapper(
    height: 0.0,
    fontSize: 14.sp,
    letterSpacing: 0.2,
    fontWeight: FontWeight.w900,
    fontFamily: getIt<UserPreferencesCubit>().state.whenLanguage(
      en: () => AppConstants.style.textStyle.secondaryFontFamiliy,
      ru: () => AppConstants.style.textStyle.primaryFontFamily,
    ),
  );
}

TextStyle get textButton {
  return _styleWrapper(
    height: 0.0,
    fontSize: 14.sp,
    fontWeight: FontWeight.w900,
    letterSpacing: 0.9,
    fontFamily: getIt<UserPreferencesCubit>().state.whenLanguage(
      en: () => AppConstants.style.textStyle.secondaryFontFamiliy,
      ru: () => AppConstants.style.textStyle.primaryFontFamily,
    ),
  );
}

TextStyle get textFieldHint {
  return _styleWrapper(
    fontSize: 16.sp,
    letterSpacing: 0.1,
    fontFamily: AppConstants.style.textStyle.primaryFontFamily,
    fontWeight: FontWeight.w500,
  );
}

TextStyle get textField {
  return _styleWrapper(
    fontSize: 16.sp,
    letterSpacing: 0.0,
    fontFamily: AppConstants.style.textStyle.primaryFontFamily,
    fontWeight: FontWeight.w500,
  );
}

TextStyle get markdown {
  return _styleWrapper(
    fontSize: 16.sp,
    letterSpacing: -0.4,
    height: 1.5,
    fontWeight: FontWeight.w600,
    fontFamily: getIt<UserPreferencesCubit>().state.whenLanguage(
      en: () => AppConstants.style.textStyle.secondaryFontFamiliy,
      ru: () => AppConstants.style.textStyle.primaryFontFamily,
    ),
  );
}

TextStyle get markdownDetailed {
  return _styleWrapper(
    height: 1.65,
    fontSize: 16.sp,
    letterSpacing: -0.3,
    fontWeight: FontWeight.w600,
    fontFamily: getIt<UserPreferencesCubit>().state.whenLanguage(
      en: () => AppConstants.style.textStyle.secondaryFontFamiliy,
      ru: () => AppConstants.style.textStyle.primaryFontFamily,
    ),
  );
}

TextStyle get factHeaderTitle {
  return _styleWrapper(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: getIt<UserPreferencesCubit>().state.whenLanguage(
      en: () => -0.3,
      ru: () => 0.0,
    ),
    fontFamily: getIt<UserPreferencesCubit>().state.whenLanguage(
      en: () => AppConstants.style.textStyle.secondaryFontFamiliy,
      ru: () => AppConstants.style.textStyle.primaryFontFamily,
    ),
  );
}
