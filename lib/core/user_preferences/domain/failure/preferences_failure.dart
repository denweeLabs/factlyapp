import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:denwee/di/api/error_codes/generic_error_codes.dart';
import 'package:collection/collection.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum PreferencesFailure {
  internalServer(apiCodes: [GenericErrorCodes.internalServer]),
  connectionTimeout(apiCodes: [GenericErrorCodes.connectionTimeout]),
  insufficientPermissions(),
  unexpected();

  final List<String>? apiCodes;
  const PreferencesFailure({this.apiCodes});

  static PreferencesFailure fromAppException(AppException error) {
    return error.map<PreferencesFailure>(
      authorization: (_) => PreferencesFailure.insufficientPermissions,
      connection: (_) => PreferencesFailure.connectionTimeout,
      generic: (x) =>
          PreferencesFailure.values
              .firstWhereOrNull((e) => e.apiCodes?.contains(x.code) ?? false) ??
          PreferencesFailure.unexpected,
    );
  }
}

extension PreferencesFailureX on PreferencesFailure {
  bool get isInsufficientPermissions =>
      this == PreferencesFailure.insufficientPermissions;

  String errorMessage(BuildContext context) {
    switch (this) {
      case PreferencesFailure.internalServer: return context.tr(LocaleKeys.error_message_update_profile_internal_server);
      case PreferencesFailure.connectionTimeout: return context.tr(LocaleKeys.error_message_update_profile_connection_timeout);
      default: return context.tr(LocaleKeys.error_message_update_profile_unexpected);
    }
  }
}