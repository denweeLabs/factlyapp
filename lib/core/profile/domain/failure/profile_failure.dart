import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:denwee/di/api/error_codes/generic_error_codes.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum ProfileFailure {
  internalServer(apiCodes: [GenericErrorCodes.internalServer]),
  connectionTimeout(apiCodes: [GenericErrorCodes.connectionTimeout]),
  insufficientPermissions(),
  unexpected();

  final List<String>? apiCodes;
  const ProfileFailure({this.apiCodes});

  static ProfileFailure fromAppException(AppException error) {
    return error.map<ProfileFailure>(
      authorization: (_) => ProfileFailure.insufficientPermissions,
      connection: (_) => ProfileFailure.connectionTimeout,
      generic: (x) =>
          ProfileFailure.values
              .firstWhereOrNull((e) => e.apiCodes?.contains(x.code) ?? false) ??
          ProfileFailure.unexpected,
    );
  }
}

extension ProfileFailureX on ProfileFailure {
  bool get isInsufficientPermissions =>
      this == ProfileFailure.insufficientPermissions;

  String errorMessage(BuildContext context) {
    switch (this) {
      case ProfileFailure.internalServer: return context.tr(LocaleKeys.error_message_update_profile_internal_server);
      case ProfileFailure.connectionTimeout: return context.tr(LocaleKeys.error_message_update_profile_connection_timeout);
      default: return context.tr(LocaleKeys.error_message_update_profile_unexpected);
    }
  }
}
