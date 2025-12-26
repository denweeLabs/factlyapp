import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

enum PasswordValidationError { empty, tooShort, tooLong }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([super.value = '']) : super.pure();
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    final trimValue = value.trim();
    if (trimValue.isEmpty) {
      return PasswordValidationError.empty;
    }
    if (trimValue.length < AppConstants.config.passwordMinLength) {
      return PasswordValidationError.tooShort;
    }
    if (trimValue.length > AppConstants.config.passwordMaxLength) {
      return PasswordValidationError.tooLong;
    }
    return null;
  }
}

extension PasswordValidationErrorX on PasswordValidationError {
  String? errorName(BuildContext context) {
    switch (this) {
      case PasswordValidationError.empty:
        return context.tr(LocaleKeys.validation_password_empty);
      case PasswordValidationError.tooShort:
        return context.tr(LocaleKeys.validation_password_short);
      case PasswordValidationError.tooLong:
        return context.tr(LocaleKeys.validation_password_long);
    }
  }
}
