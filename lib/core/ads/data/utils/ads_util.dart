import 'package:denwee/core/ads/domain/entity/app_ad_failure.dart';
import 'package:denwee/core/ui/constants/app/ads_constants.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsUtil {
  static AppAdFailure processLoadingError(LoadAdError error) {
    switch (error.code) {
      // Connection issue
      case AdsConstants.networkErrorCode:
      case AdsConstants.timeoutErrorCode:
        return AppAdFailure.connection(error.message);

      // No ads to show
      case AdsConstants.noFillErrorCode:
        return AppAdFailure.noAdAvailable(error.message);
    }

    // Error message check 1
    if (error.message.toLowerCase().contains(
      AdsConstants.noAdErrorMessage1.toLowerCase(),
    )) {
      return AppAdFailure.noAdAvailable(error.message);
    }

    // Error message check 2
    if (error.message.toLowerCase().contains(
      AdsConstants.noAdErrorMessage2.toLowerCase(),
    )) {
      return AppAdFailure.noAdAvailable(error.message);
    }

    // Any other error
    return AppAdFailure.failedToLoad(error.message);
  }
}
