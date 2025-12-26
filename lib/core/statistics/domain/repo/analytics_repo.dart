abstract class AnalyticsRepo {
  Future<void> logFactUnlockedViaAd();
  Future<void> logFactUnlockedViaStar();
  Future<void> logIosAdTrackingAllowed();
  Future<void> logLogin();
  Future<void> logSignUp();
}
