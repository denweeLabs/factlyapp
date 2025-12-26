import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:denwee/core/ads/domain/entity/app_ad_failure.dart';
import 'package:denwee/core/ads/domain/repo/ads_repo.dart';
import 'package:denwee/core/ads/domain/repo/app_ad.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/db/daos/ad_views_dao.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AdsRepo)
class AdsRepoImpl implements AdsRepo {
  AdsRepoImpl(this._adViewsDao);

  final AdViewsDao _adViewsDao;

  Option<RewardedAd> factExplanationAd = const None();
  Option<InterstitialAd> addToArchiveAd = const None();

  @override
  Future<Either<AppAdFailure, RewardedAd>> loadFactExplanationAd({bool logError = true}) async {
    return _loadAd<RewardedAd>(
      logError: logError,
      currentAd: factExplanationAd,
      adLoader: AppAd.factExplanation.load,
      location: AppAdLocation.factExplanation,
      onSuccess: (ad) => factExplanationAd = Some(ad),
      disposeAd: (ad) async {
        await ad.dispose();
        factExplanationAd = const None();
      },
    );
  }

  @override
  Future<Either<AppAdFailure, InterstitialAd>> loadAddToArchiveAd({bool logError = true}) async {
    return _loadAd<InterstitialAd>(
      logError: logError,
      currentAd: addToArchiveAd,
      adLoader: AppAd.addToArchive.load,
      location: AppAdLocation.addToArchive,
      onSuccess: (ad) => addToArchiveAd = Some(ad),
      disposeAd: (ad) async {
        await ad.dispose();
        addToArchiveAd = const None();
      },
    );
  }

  @override
  Future<Either<AppAdFailure, Unit>> showFactExplanationAd(RewardedAd ad, {
    required String profileId,
    required String factId,
  }) async {
    return _showAd<RewardedAd>(
      ad: ad,
      location: AppAdLocation.factExplanation,
      preloadNextAd: loadFactExplanationAd,
      showProvider: () => AppAd.factExplanation.show(
        ssv: ServerSideVerificationOptions(userId: profileId, customData: factId),
        ad: ad,
      ),
    );
  }

  @override
  Future<Either<AppAdFailure, Unit>> showAddToArchiveAd(InterstitialAd ad) async {
    return _showAd<InterstitialAd>(
      ad: ad,
      location: AppAdLocation.addToArchive,
      preloadNextAd: loadAddToArchiveAd,
      showProvider: () => AppAd.addToArchive.show(ad: ad),
    );
  }

  @override
  FutureOr<Either<AppAdFailure, RewardedAd>> getOrLoadFactExplanationAd() {
    return factExplanationAd.fold(loadFactExplanationAd, (ad) => right(ad));
  }

  @override
  FutureOr<Either<AppAdFailure, InterstitialAd>> getOrLoadAddToArchiveAd() {
    return addToArchiveAd.fold(loadAddToArchiveAd, (ad) => right(ad));
  }

  @override
  Future<Either<AppAdFailure, Unit>> addAdvertismentViewed(UniqueId profileId) async {
    try {
      await _adViewsDao.addUserView(profileId.value);
      return right(unit);
    } catch (error) {
      debugPrint('addAdvertismentViewed error: $error');
      return left(AppAdFailure.unexpected(error.toString()));
    }
  }

  @override
  Future<Either<AppAdFailure, int>> getAdvertismentViewsCount(
    UniqueId profileId, {
    required DateTime start,
    required DateTime end,
  }) async {
    try {
      final count = await _adViewsDao.userViewsCount(profileId.value, start, end);
      return right(count);
    } catch (error) {
      debugPrint('getAdvertismentViewsCount error: $error');
      return left(AppAdFailure.unexpected(error.toString()));
    }
  }

  @override
  Future<Either<AppAdFailure, int>> getTotalAdvertismentViewsCount(UniqueId profileId) async {
    try {
      final count = await _adViewsDao.totalUserViewsCount(profileId.value);
      return right(count);
    } catch (error) {
      debugPrint('getTotalAdvertismentViewsCount error: $error');
      return left(AppAdFailure.unexpected(error.toString()));
    }
  }

  Future<Either<AppAdFailure, T>> _loadAd<T>({
    required Option<T> currentAd,
    required Future<Either<AppAdFailure, dynamic>> Function() adLoader,
    required void Function(T ad) onSuccess,
    required Future<void> Function(T ad) disposeAd,
    required AppAdLocation location,
    bool logError = true,
  }) async {
    final ad = currentAd.toNullable();
    if (ad != null) {
      await disposeAd(ad);
    }
    final result = await adLoader();
    return result.fold(
      (failure) {
        if (logError) _logAdFailure(location, failure.logMessage);
        return left(failure);
      },
      (ad) {
        onSuccess(ad);
        return right(ad);
      },
    );
  }

  Future<Either<AppAdFailure, Unit>> _showAd<T>({
    required T ad,
    required AppAdLocation location,
    required Future<Either<AppAdFailure, dynamic>> Function() showProvider,
    required Future<Either<AppAdFailure, T>> Function() preloadNextAd,
  }) async {
    final failureOrSuccess = await showProvider();
    preloadNextAd();  // preload next ad in advance
    return failureOrSuccess.fold(
      (failure) {
        _logAdFailure(location, failure.logMessage);
        return left(failure);
      },
      (success) {
        return right(unit);
      },
    );
  }

  void _logAdFailure(AppAdLocation location, String message) {
    debugPrint('AdsRepo _logAdFailure: $message');
    FirebaseCrashlytics.instance.recordError('${location.name}: $message', null, fatal: false);
  }
}
