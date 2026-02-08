import 'package:denwee/core/subscriptions/domain/entity/premium_packages.dart';

abstract class AnalyticsRepo {
  Future<void> logFactUnlockedViaAd();
  Future<void> logFactUnlockedViaStar();
  Future<void> logIosAdTrackingAllowed();
  Future<void> logLogin();
  Future<void> logSignUp();
  Future<void> logSubscriptionRestore();
  Future<void> logSubscriptionPurchase(PremiumPackage package);
}
