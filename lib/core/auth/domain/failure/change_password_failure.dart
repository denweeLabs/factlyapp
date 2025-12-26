import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:denwee/di/api/error_codes/generic_error_codes.dart';
import 'package:denwee/di/api/error_codes/member_error_codes.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

enum ChangePasswordFailure {
  weakPassword(apiCodes: [ChangePasswordErrorCodes.weakPassword]),
  invalidCredentials(apiCodes: [ChangePasswordErrorCodes.invalidCredentials]),
  internalServer(apiCodes: [GenericErrorCodes.internalServer]),
  connectionTimeout(apiCodes: [GenericErrorCodes.connectionTimeout]),
  tooManyRequests(apiCodes: [GenericErrorCodes.tooManyRequests]),
  unexpected();

  final List<String>? apiCodes;
  const ChangePasswordFailure({this.apiCodes});

  static ChangePasswordFailure fromAppException(AppException error) {
    return error.map<ChangePasswordFailure>(
      authorization: (_) => ChangePasswordFailure.invalidCredentials,
      connection: (_) => ChangePasswordFailure.connectionTimeout,
      generic: (x) =>
          ChangePasswordFailure.values
              .firstWhereOrNull((e) => e.apiCodes?.contains(x.code) ?? false) ??
          ChangePasswordFailure.unexpected,
    );
  }
}

extension ChangePasswordFailureX on ChangePasswordFailure {
  String errorMessage(BuildContext context) {
    switch (this) {
      case ChangePasswordFailure.weakPassword: return context.tr(LocaleKeys.error_message_change_password_weak_password);
      case ChangePasswordFailure.invalidCredentials: return context.tr(LocaleKeys.error_message_change_password_invalid_credentials);
      case ChangePasswordFailure.internalServer: return context.tr(LocaleKeys.error_message_change_password_internal_server);
      case ChangePasswordFailure.connectionTimeout: return context.tr(LocaleKeys.error_message_change_password_connection_timeout);
      case ChangePasswordFailure.tooManyRequests: return context.tr(LocaleKeys.error_message_common_too_many_requests);
      default: return context.tr(LocaleKeys.error_message_change_password_unexpected);
    }
  }
}
