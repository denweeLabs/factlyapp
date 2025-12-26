import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:denwee/di/api/error_codes/generic_error_codes.dart';
import 'package:denwee/di/api/error_codes/member_error_codes.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

enum LoginFailure {
  invalidEmail(apiCodes: [LoginErrorCodes.invalidEmail]),
  weakPassword(apiCodes: [LoginErrorCodes.weakPassword]),
  userNotFound(apiCodes: [LoginErrorCodes.userNotFound]),
  // emailNotConfirmed(apiCodes: [LoginErrorCodes.emailNotConfirmed]),
  userBanned(apiCodes: [LoginErrorCodes.userBanned]),
  internalServer(apiCodes: [GenericErrorCodes.internalServer]),
  connectionTimeout(apiCodes: [GenericErrorCodes.connectionTimeout]),
  unexpected();

  final List<String>? apiCodes;
  const LoginFailure({this.apiCodes});

  static LoginFailure fromAppException(AppException error) {
    return error.map<LoginFailure>(
      authorization: (_) => LoginFailure.userNotFound,
      connection: (_) => LoginFailure.connectionTimeout,
      generic: (x) =>
          LoginFailure.values
              .firstWhereOrNull((e) => e.apiCodes?.contains(x.code) ?? false) ??
          LoginFailure.unexpected,
    );
  }
}

extension LoginFailureX on LoginFailure {
  String errorMessage(BuildContext context) {
    switch (this) {
      case LoginFailure.invalidEmail: return context.tr(LocaleKeys.error_message_login_invalid_email);
      case LoginFailure.weakPassword: return context.tr(LocaleKeys.error_message_login_weak_password);
      case LoginFailure.userNotFound: return context.tr(LocaleKeys.error_message_login_user_not_found);
      case LoginFailure.userBanned: return context.tr(LocaleKeys.error_message_login_user_banned);
      case LoginFailure.internalServer: return context.tr(LocaleKeys.error_message_login_internal_server);
      case LoginFailure.connectionTimeout: return context.tr(LocaleKeys.error_message_login_connection_timeout);
      default: return context.tr(LocaleKeys.error_message_login_unexpected);
    }
  }
}
