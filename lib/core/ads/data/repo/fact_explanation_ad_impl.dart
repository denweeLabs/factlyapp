import 'dart:async';

import 'package:denwee/core/ads/data/utils/ads_util.dart';
import 'package:denwee/core/ads/domain/entity/app_ad_failure.dart';
import 'package:denwee/core/ads/domain/repo/app_ad.dart';
import 'package:denwee/core/ui/constants/app/ads_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FactExplanationAd implements AppAd {
  @override
  AppAdLocation get type => AppAdLocation.factExplanation;

  @override
  Future<Either<AppAdFailure, RewardedAd>> load() {
    final completer = Completer<Either<AppAdFailure, RewardedAd>>();

    void secureComplete(Either<AppAdFailure, RewardedAd> result) {
      if (completer.isCompleted) return;
      completer.complete(result);
    }

    try {
      RewardedAd.load(
        request: const AdRequest(),
        adUnitId: AdsConstants.factExplanationAdUnitId,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) => secureComplete(right(ad)),
          onAdFailedToLoad: (error) {
            final failure = AdsUtil.processLoadingError(error);
            secureComplete(left(failure));
          },
        ),
      );
    } catch (error) {
      debugPrint('FactExplanationAd load error: $error');
      secureComplete(left(AppAdFailure.unexpected(error.toString())));
    }

    return completer.future;
  }

  @override
  Future<Either<AppAdFailure, RewardedAd>> show({
    dynamic ad,
    ServerSideVerificationOptions? ssv,
  }) async {
    /// always provide [RewardedAd]
    if (ad is! RewardedAd) throw 'Ad object type is not supported';

    final completer = Completer<Either<AppAdFailure, RewardedAd>>();

    void secureComplete(Either<AppAdFailure, RewardedAd> result) {
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
      );

      if (ssv != null) {
        await ad.setServerSideOptions(ssv);
      }

      ad.show(onUserEarnedReward: (_, __) {
        secureComplete(right(ad));
      });
    } catch (error) {
      debugPrint('FactExplanationAd show error: $error');
      secureComplete(left(AppAdFailure.unexpected(error.toString())));
    }

    return completer.future;
  }
}
