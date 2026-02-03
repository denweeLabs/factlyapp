import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:denwee/di/api/error_codes/generic_error_codes.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum BackgroundFailure {
  internalServer(apiCodes: [GenericErrorCodes.internalServer]),
  connectionTimeout(apiCodes: [GenericErrorCodes.connectionTimeout]),
  insufficientPermissions(),
  unexpected();

  final List<String>? apiCodes;
  const BackgroundFailure({this.apiCodes});

  static BackgroundFailure fromAppException(AppException error) {
    return error.map<BackgroundFailure>(
      authorization: (_) => BackgroundFailure.insufficientPermissions,
      connection: (_) => BackgroundFailure.connectionTimeout,
      generic: (x) => BackgroundFailure.values
              .firstWhereOrNull((e) => e.apiCodes?.contains(x.code) ?? false) ??
          BackgroundFailure.unexpected,
    );
  }
}

extension BackgroundFailureX on BackgroundFailure {
  bool get isInsufficientPermissions =>
      this == BackgroundFailure.insufficientPermissions;

  String errorMessage(BuildContext context) {
    switch (this) {
      case BackgroundFailure.internalServer: return context.tr(LocaleKeys.error_message_common_internal_server);
      case BackgroundFailure.connectionTimeout: return context.tr(LocaleKeys.error_message_common_connection_timeout);
      default: return context.tr(LocaleKeys.error_message_common_unexpected);
    }
  }
}
