import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:denwee/core/ads/domain/entity/app_ad_failure.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

abstract class AdsRepo {
  // =========================
  // Load ads
  // =========================
  Future<Either<AppAdFailure, RewardedAd>> loadFactExplanationAd({bool logError = true});
  Future<Either<AppAdFailure, InterstitialAd>> loadAddToArchiveAd({bool logError = true});

  // =========================
  // Get ad if preloaded or load
  // =========================
  FutureOr<Either<AppAdFailure, RewardedAd>> getOrLoadFactExplanationAd();
  FutureOr<Either<AppAdFailure, InterstitialAd>> getOrLoadAddToArchiveAd();

  // =========================
  // Show ads
  // =========================
  Future<Either<AppAdFailure, Unit>> showFactExplanationAd(
    RewardedAd ad, {
    required String profileId,
    required String factId,
  });
  Future<Either<AppAdFailure, Unit>> showAddToArchiveAd(
    InterstitialAd ad,
  );

  // =========================
  // Track ad views
  // =========================
  Future<Either<AppAdFailure, Unit>> addAdvertismentViewed(
    UniqueId profileId,
  );
  Future<Either<AppAdFailure, int>> getAdvertismentViewsCount(
    UniqueId profileId, {
    required DateTime start,
    required DateTime end,
  });
  Future<Either<AppAdFailure, int>> getTotalAdvertismentViewsCount(
    UniqueId profileId,
  );
}
