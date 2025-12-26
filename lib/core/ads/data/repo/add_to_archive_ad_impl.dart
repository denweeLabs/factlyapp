import 'dart:async';

import 'package:denwee/core/ads/data/utils/ads_util.dart';
import 'package:denwee/core/ads/domain/entity/app_ad_failure.dart';
import 'package:denwee/core/ads/domain/repo/app_ad.dart';
import 'package:denwee/core/ui/constants/app/ads_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AddToArchiveAd implements AppAd {
  @override
  AppAdLocation get type => AppAdLocation.addToArchive;

  @override
  Future<Either<AppAdFailure, InterstitialAd>> load() {
    final completer = Completer<Either<AppAdFailure, InterstitialAd>>();

    void secureComplete(Either<AppAdFailure, InterstitialAd> result) {
      if (completer.isCompleted) return;
      completer.complete(result);
    }

    try {
      InterstitialAd.load(
        request: const AdRequest(),
        adUnitId: AdsConstants.addToArchiveAdUnitId,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) => secureComplete(right(ad)),
          onAdFailedToLoad: (error) {
            final failure = AdsUtil.processLoadingError(error);
            secureComplete(left(failure));
          },
        ),
      );
    } catch (error) {
      debugPrint('AddToArchiveAd load error: $error');
      secureComplete(left(AppAdFailure.failedToLoad(error.toString())));
    }

    return completer.future;
  }

  @override
  Future<Either<AppAdFailure, InterstitialAd>> show({
    dynamic ad,
    ServerSideVerificationOptions? ssv,
  }) async {
    /// always provide [InterstitialAd]
    if (ad is! InterstitialAd) throw 'Ad object type is not supported';

    final completer = Completer<Either<AppAdFailure, InterstitialAd>>();

    void secureComplete(Either<AppAdFailure, InterstitialAd> result) {
      if (completer.isCompleted) return;
      completer.complete(result);
    }

    try {
      ad.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          secureComplete(left(const AppAdFailure.closed()));
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          secureComplete(left(AppAdFailure.failedToShow(error.toString())));
        },
        onAdWillDismissFullScreenContent: (ad) {
          ad.dispose();
          secureComplete(left(const AppAdFailure.closed()));
        },
        onAdShowedFullScreenContent: (ad) {
          secureComplete(right(ad));
        },
      );

      ad.show();
    } catch (error) {
      debugPrint('AddToArchiveAd show error: $error');
      secureComplete(left(AppAdFailure.failedToShow(error.toString())));
    }

    return completer.future;
  }
}
