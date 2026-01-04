import 'package:denwee/core/subscriptions/domain/entity/premium_packages.dart';
import 'package:denwee/core/ui/constants/formatters/common_formatters.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/di/env.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:utils/utils.dart';

part 'user_subscription.freezed.dart';

@freezed
abstract class UserSubscription with _$UserSubscription {
  const UserSubscription._();
  const factory UserSubscription({
    required PremiumPackageType packageType,
    required DateTime expiresAt,
  }) = _UserSubscription;

  String expiryText(BuildContext context) {
    var expiryText = subscription_short_expiry_date.format(expiresAt);

    // exact time enabled on dev for testing
    if (getIt<String>(instanceName: 'ENV') == Env.dev &&
        expiresAt.day == currentDay().day) {
      expiryText += ' • ${HH_mm.format(expiresAt)}';
    }

    return '${context.tr(LocaleKeys.subscription_paywall_expiry)}: $expiryText';    
  }

  String expirationLongDateText(BuildContext context) {
    var expiryText = subscription_long_expiry_date.format(expiresAt);

    // exact time enabled on dev for testing
    if (getIt<String>(instanceName: 'ENV') == Env.dev &&
        expiresAt.day == currentDay().day) {
      expiryText += ' • ${HH_mm.format(expiresAt)}';
    }

    return expiryText;
  }

  bool isNotExpired() {
    final now = DateTime.now().toUtc();
    return now.isBefore(expiresAt.toUtc());
  }
}
