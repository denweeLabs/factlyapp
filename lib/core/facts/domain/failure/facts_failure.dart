import 'package:denwee/core/ads/domain/entity/app_ad_failure.dart';
import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:denwee/di/api/error_codes/facts_error_codes.dart';
import 'package:denwee/di/api/error_codes/generic_error_codes.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

enum FactsFailure {
  internalServer(apiCodes: [GenericErrorCodes.internalServer]),
  connectionTimeout(apiCodes: [GenericErrorCodes.connectionTimeout]),
  explanationRewardMissing(apiCodes: [FactsErrorCodes.rewardMissing]),
  explanationInsufficientStars(apiCodes: [FactsErrorCodes.insufficientStars]),
  archiveLimitReached(apiCodes: [FactsErrorCodes.limitReached]),
  noAdAvailable(),
  insufficientPermissions(),
  unexpected();

  final List<String>? apiCodes;
  const FactsFailure({this.apiCodes});

  static FactsFailure fromAppException(AppException error) {
    return error.map<FactsFailure>(
      authorization: (_) => FactsFailure.insufficientPermissions,
      connection: (_) => FactsFailure.connectionTimeout,
      generic: (x) => FactsFailure.values
              .firstWhereOrNull((e) => e.apiCodes?.contains(x.code) ?? false) ??
          FactsFailure.unexpected,
    );
  }

  static FactsFailure fromAdFailure(AppAdFailure failure) {
    return failure.map(
      closed: (_) => FactsFailure.explanationRewardMissing,
      connection: (_) => FactsFailure.connectionTimeout,
      noAdAvailable: (_) => FactsFailure.noAdAvailable,
      failedToLoad: (_) => FactsFailure.internalServer,
      failedToShow: (_) => FactsFailure.explanationRewardMissing,
      unexpected: (_) => FactsFailure.unexpected,
    );
  }
}

extension FactsFailureX on FactsFailure {
  bool get isInsufficientPermissions =>
      this == FactsFailure.insufficientPermissions;
  
  String? errorTitle(BuildContext context) {
    switch (this) {
      case FactsFailure.noAdAvailable: return context.tr(LocaleKeys.error_message_facts_no_ad_for_explanation_title);
      default: return null;
    }
  }
  
  String errorMessage(BuildContext context) {
    switch (this) {
      case FactsFailure.explanationRewardMissing: return context.tr(LocaleKeys.error_message_facts_explanation_reward_missing);
      case FactsFailure.explanationInsufficientStars: return context.tr(LocaleKeys.error_message_facts_explanation_insufficient_stars);
      case FactsFailure.archiveLimitReached: return context.tr(LocaleKeys.error_message_facts_archive_limit_reached);
      case FactsFailure.internalServer: return context.tr(LocaleKeys.error_message_facts_internal_server);
      case FactsFailure.connectionTimeout: return context.tr(LocaleKeys.error_message_facts_connection_timeout);
      case FactsFailure.noAdAvailable: return context.tr(LocaleKeys.error_message_facts_no_ad_for_explanation_subtitle);
      default: return context.tr(LocaleKeys.error_message_facts_unexpected);
    }
  }
}
