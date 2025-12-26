import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:denwee/di/api/error_codes/generic_error_codes.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

enum CommonApiFailure {
  internalServer(apiCodes: [GenericErrorCodes.internalServer]),
  connectionTimeout(apiCodes: [GenericErrorCodes.connectionTimeout]),
  tooManyRequests(apiCodes: [GenericErrorCodes.tooManyRequests]),
  authorization(),
  unexpected();

  final List<String>? apiCodes;
  const CommonApiFailure({this.apiCodes});

  static CommonApiFailure fromAppException(AppException error) {
    return error.map<CommonApiFailure>(
      authorization: (_) => CommonApiFailure.authorization,
      connection: (_) => CommonApiFailure.connectionTimeout,
      generic: (x) =>
          CommonApiFailure.values
              .firstWhereOrNull((e) => e.apiCodes?.contains(x.code) ?? false) ??
          CommonApiFailure.unexpected,
    );
  }
}

extension CommonApiFailureX on CommonApiFailure {
  String errorMessage(BuildContext context) {
    switch (this) {
      case CommonApiFailure.internalServer: return context.tr(LocaleKeys.error_message_common_internal_server);
      case CommonApiFailure.connectionTimeout: return context.tr(LocaleKeys.error_message_common_connection_timeout);
      case CommonApiFailure.authorization: return context.tr(LocaleKeys.error_message_common_authorization);
      case CommonApiFailure.tooManyRequests: return context.tr(LocaleKeys.error_message_common_too_many_requests);
      default: return context.tr(LocaleKeys.error_message_common_unexpected);
    }
  }
}
