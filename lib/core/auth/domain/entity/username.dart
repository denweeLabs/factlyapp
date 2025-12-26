import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

enum UsernameValidationError { empty, tooShort, tooLong }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure([super.value = '']) : super.pure();
  const Username.dirty([super.value = '']) : super.dirty();

  @override
  UsernameValidationError? validator(String value) {
    final trimValue = value.trim();

    if (trimValue.isEmpty) {
      return UsernameValidationError.empty;
    } 
    if (trimValue.length < AppConstants.config.usernameMinLength) {
      return UsernameValidationError.tooShort;
    }
    if (trimValue.length > AppConstants.config.usernameMaxLength) {
      return UsernameValidationError.tooLong;
    }

    return null;
  }
}

extension UsernameValidationErrorX on UsernameValidationError {
  String? errorName(BuildContext context) {
    switch (this) {
      case UsernameValidationError.empty:
        return context.tr(LocaleKeys.validation_username_empty);
      case UsernameValidationError.tooShort:
        return context.tr(LocaleKeys.validation_username_short);
      case UsernameValidationError.tooLong:
        return context.tr(LocaleKeys.validation_username_long);
    }
  }
}
