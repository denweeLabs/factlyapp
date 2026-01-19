import 'dart:convert';

import 'package:denwee/core/statistics/domain/repo/analytics_repo.dart';
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

  Future<void> _logEvent(String name, {Map<String, Object>? params}) {
    final paramsPrint = params != null ? ': ${jsonEncode(params)}' : '';
    debugPrint('Analytics logEvent ($name)$paramsPrint');
    return _analytics.logEvent(name: name, parameters: params);
  }
}
