import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:email_validator/email_validator.dart';

enum EmailValidationError { empty, invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure([super.value = '']) : super.pure();
  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    final trimValue = value.trim();

    if (trimValue.isEmpty) {
      return EmailValidationError.empty;
    } else if (!EmailValidator.validate(trimValue, true)) {
      return EmailValidationError.invalid;
    }
    return null;
  }
}

extension EmailValidationErrorX on EmailValidationError {
  String? errorName(BuildContext context) {
    switch (this) {
      case EmailValidationError.empty:
        return context.tr(LocaleKeys.validation_email_empty);
      case EmailValidationError.invalid:
        return context.tr(LocaleKeys.validation_email_invalid);
    }
  }
}
