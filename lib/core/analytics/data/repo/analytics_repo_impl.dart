import 'dart:convert';

import 'package:denwee/core/analytics/domain/entity/paywall_source.dart';
import 'package:denwee/core/analytics/domain/repo/analytics_repo.dart';
import 'package:denwee/core/subscriptions/domain/entity/premium_packages.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

enum AnalyticsEvent {
  factUnlockViaAd,
  factUnlockViaStar,
  iosAdTrackingAllow,
  login,
  signUp,
  subscriptionPurchase,
  subscriptionRestore,
  backgroundPurchase,
  backgroundApply,
  paywallShown,
  notificationPermissionGranted,
  notificationPermissionDenied,
  pushOpened,
  pushReceivedForeground,
  factArchived,
  factUnarchived,
}

extension AnalyticsEventX on AnalyticsEvent {
  String get eventName {
    switch (this) {
      case AnalyticsEvent.factUnlockViaAd:
        return 'fact_explanation_unlocked_via_ad';
      case AnalyticsEvent.factUnlockViaStar:
        return 'fact_explanation_unlocked_via_star';
      case AnalyticsEvent.iosAdTrackingAllow:
        return 'ios_ad_tracking_allowed';
      case AnalyticsEvent.login:
        return 'login';
      case AnalyticsEvent.signUp:
        return 'sign_up';
      case AnalyticsEvent.subscriptionPurchase:
        return 'purchase';
      case AnalyticsEvent.subscriptionRestore:
        return 'subscription_restore';
      case AnalyticsEvent.backgroundPurchase:
        return 'background_purchase';
      case AnalyticsEvent.backgroundApply:
        return 'background_apply';
      case AnalyticsEvent.paywallShown:
        return 'paywall_shown';
      case AnalyticsEvent.notificationPermissionGranted:
        return 'notification_permission_granted';
      case AnalyticsEvent.notificationPermissionDenied:
        return 'notification_permission_denied';
      case AnalyticsEvent.pushOpened:
        return 'push_opened';
      case AnalyticsEvent.pushReceivedForeground:
        return 'push_received_foreground';
      case AnalyticsEvent.factArchived:
        return 'fact_archived';
      case AnalyticsEvent.factUnarchived:
        return 'fact_unarchived';
    }
  }
}

@LazySingleton(as: AnalyticsRepo)
class AnalyticsRepoImpl implements AnalyticsRepo {
  final FirebaseAnalytics _analytics;

  const AnalyticsRepoImpl(this._analytics);

  @override
  Future<void> logFactUnlockedViaAd() {
    return _logEvent(AnalyticsEvent.factUnlockViaAd.eventName);
  }

  @override
  Future<void> logFactUnlockedViaStar() {
    return _logEvent(AnalyticsEvent.factUnlockViaStar.eventName);
  }

  @override
  Future<void> logIosAdTrackingAllowed() {
    return _logEvent(AnalyticsEvent.iosAdTrackingAllow.eventName);
  }

  @override
  Future<void> logLogin() {
    return _logEvent(AnalyticsEvent.login.eventName);
  }

  @override
  Future<void> logSignUp() {
    return _logEvent(AnalyticsEvent.signUp.eventName);
  }

  @override
  Future<void> logSubscriptionRestore() {
    return _logEvent(AnalyticsEvent.subscriptionRestore.eventName);
  }

  @override
  Future<void> logBackgroundPurchase() {
    return _logEvent(AnalyticsEvent.backgroundPurchase.eventName);
  }

  @override
  Future<void> logBackgroundApply() {
    return _logEvent(AnalyticsEvent.backgroundApply.eventName);
  }

  @override
  Future<void> logSubscriptionPurchase(PremiumPackage package) async {
    debugPrint(
      'Analytics logEvent (${AnalyticsEvent.subscriptionPurchase.eventName}): ${package.type.packageId}/${package.data.storeProduct.price}${package.data.storeProduct.currencyCode}',
    );
    await _analytics.logPurchase(
      value: package.data.storeProduct.price,
      currency: package.data.storeProduct.currencyCode,
      items: [
        AnalyticsEventItem(
          itemId: package.type.packageId,
          itemName: package.type.metaTitle,
          itemCategory: 'subscription',
        ),
      ],
    );
  }

  @override
  Future<void> logPaywallShown(PaywallSource? source) {
    final base = AnalyticsEvent.paywallShown.eventName;
    return _logEvent(source == null ? base : '${base}_${source.eventSuffix}');
  }

  @override
  Future<void> logNotificationPermission({required bool isGranted}) {
    final event = isGranted
        ? AnalyticsEvent.notificationPermissionGranted
        : AnalyticsEvent.notificationPermissionDenied;
    return _logEvent(event.eventName);
  }

  @override
  Future<void> logPushOpened() {
    return _logEvent(AnalyticsEvent.pushOpened.eventName);
  }

  @override
  Future<void> logPushReceivedForeground() {
    return _logEvent(AnalyticsEvent.pushReceivedForeground.eventName);
  }

  @override
  Future<void> logFactArchived() {
    return _logEvent(AnalyticsEvent.factArchived.eventName);
  }

  @override
  Future<void> logFactUnarchived() {
    return _logEvent(AnalyticsEvent.factUnarchived.eventName);
  }

  Future<void> _logEvent(String name, {Map<String, Object>? params}) {
    final paramsPrint = params != null ? ': ${jsonEncode(params)}' : '';
    debugPrint('Analytics logEvent ($name)$paramsPrint');
    return _analytics.logEvent(name: name, parameters: params);
  }
}
