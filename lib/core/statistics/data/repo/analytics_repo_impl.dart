import 'dart:convert';

import 'package:denwee/core/statistics/domain/repo/analytics_repo.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

enum AnalyticsEvent {
  factUnlockViaAd,
  factUnlockViaStar,
  iosAdTrackingAllow,
  login,
  signUp,
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

  Future<void> _logEvent(String name, {Map<String, Object>? params}) {
    final paramsPrint = params != null ? ': ${jsonEncode(params)}' : '';
    debugPrint('Analytics logEvent ($name)$paramsPrint');
    return _analytics.logEvent(name: name, parameters: params);
  }
}
