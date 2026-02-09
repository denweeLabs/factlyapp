import 'package:denwee/core/network/data/model/app_exception.dart';
import 'package:denwee/core/network/domain/entity/generic_error_codes.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum StatisticsFailure {
  internalServer(apiCodes: [GenericErrorCodes.internalServer]),
  connectionTimeout(apiCodes: [GenericErrorCodes.connectionTimeout]),
  insufficientPermissions(),
  unexpected();

  final List<String>? apiCodes;
  const StatisticsFailure({this.apiCodes});

  static StatisticsFailure fromAppException(AppException error) {
    return error.map<StatisticsFailure>(
      authorization: (_) => StatisticsFailure.insufficientPermissions,
      connection: (_) => StatisticsFailure.connectionTimeout,
      generic: (x) =>
          StatisticsFailure.values
              .firstWhereOrNull((e) => e.apiCodes?.contains(x.code) ?? false) ??
          StatisticsFailure.unexpected,
    );
  }
}

extension StatisticsX on StatisticsFailure {
  bool get isInsufficientPermissions =>
      this == StatisticsFailure.insufficientPermissions;

  String errorMessage(BuildContext context) {
    switch (this) {
      case StatisticsFailure.internalServer: return context.tr(LocaleKeys.error_message_update_profile_internal_server);
      case StatisticsFailure.connectionTimeout: return context.tr(LocaleKeys.error_message_update_profile_connection_timeout);
      default: return context.tr(LocaleKeys.error_message_update_profile_unexpected);
    }
  }
}
