import 'package:denwee/core/analytics/domain/entity/paywall_source.dart';
import 'package:denwee/core/subscriptions/domain/entity/premium_packages.dart';

abstract class AnalyticsRepo {
  Future<void> logFactUnlockedViaAd();
  Future<void> logFactUnlockedViaStar();
  Future<void> logIosAdTrackingAllowed();
  Future<void> logLogin();
  Future<void> logSignUp();
  Future<void> logSubscriptionRestore();
  Future<void> logSubscriptionPurchase(PremiumPackage package);
  Future<void> logBackgroundPurchase();
  Future<void> logBackgroundApply();

  Future<void> logPaywallShown(PaywallSource? source);
  Future<void> logNotificationPermission({required bool isGranted});
  Future<void> logPushOpened();
  Future<void> logPushReceivedForeground();
  Future<void> logFactArchived();
  Future<void> logFactUnarchived();
}
