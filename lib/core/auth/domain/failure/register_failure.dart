import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:denwee/di/api/error_codes/generic_error_codes.dart';
import 'package:denwee/di/api/error_codes/member_error_codes.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

enum RegisterFailure {
  invalidEmail(apiCodes: [RegisterErrorCodes.invalidEmail]),
  weakPassword(apiCodes: [RegisterErrorCodes.weakPassword]),
  userAlreadyExists(apiCodes: [RegisterErrorCodes.userAlreadyExists]),
  // emailNotConfirmed(apiCodes: [RegisterErrorCodes.emailNotConfirmed]),
  disabled(apiCodes: [RegisterErrorCodes.disabled]),
  internalServer(apiCodes: [GenericErrorCodes.internalServer]),
  connectionTimeout(apiCodes: [GenericErrorCodes.connectionTimeout]),
  unexpected();

  final List<String>? apiCodes;
  const RegisterFailure({this.apiCodes});

  static RegisterFailure fromAppException(AppException error) {
    return error.map<RegisterFailure>(
      authorization: (_) => RegisterFailure.unexpected,
      connection: (_) => RegisterFailure.connectionTimeout,
      generic: (x) =>
          RegisterFailure.values
              .firstWhereOrNull((e) => e.apiCodes?.contains(x.code) ?? false) ??
          RegisterFailure.unexpected,
    );
  }
}

extension RegisterFailureX on RegisterFailure {
  String errorMessage(BuildContext context) {
    switch (this) {
      case RegisterFailure.invalidEmail: return context.tr(LocaleKeys.error_message_register_invalid_email);
      case RegisterFailure.weakPassword: return context.tr(LocaleKeys.error_message_register_weak_password);
      case RegisterFailure.userAlreadyExists: return context.tr(LocaleKeys.error_message_register_user_already_exists);
      case RegisterFailure.disabled: return context.tr(LocaleKeys.error_message_register_disabled);
      case RegisterFailure.internalServer: return context.tr(LocaleKeys.error_message_register_internal_server);
      case RegisterFailure.connectionTimeout: return context.tr(LocaleKeys.error_message_register_connection_timeout);
      default: return context.tr(LocaleKeys.error_message_register_unexpected);
    }
  }
}
