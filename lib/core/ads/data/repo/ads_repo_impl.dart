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

class _AdSlot<T> {
  T? ad;
  DateTime? loadedAt;
  Future<Either<AppAdFailure, T>>? pendingRequest;

  bool isFresh(Duration maxAge) {
    final ad = this.ad;
    final loadedAt = this.loadedAt;
    if (ad == null || loadedAt == null) return false;
    return DateTime.now().difference(loadedAt) < maxAge;
  }

  void store(T ad) {
    this.ad = ad;
    loadedAt = DateTime.now();
  }

  void clear() {
    ad = null;
    loadedAt = null;
  }
}

@LazySingleton(as: AdsRepo)
class AdsRepoImpl implements AdsRepo {
  AdsRepoImpl(this._adViewsDao);

  final AdViewsDao _adViewsDao;

  static const adFreshness = Duration(minutes: 50);

  final _factExplanationSlot = _AdSlot<RewardedAd>();
  final _addToArchiveSlot = _AdSlot<InterstitialAd>();

  @override
  Future<Either<AppAdFailure, RewardedAd>> loadFactExplanationAd({bool logError = true}) {
    return _loadAd<RewardedAd>(
      slot: _factExplanationSlot,
      logError: logError,
      adLoader: AppAd.factExplanation.load,
      location: AppAdLocation.factExplanation,
    );
  }

  @override
  Future<Either<AppAdFailure, InterstitialAd>> loadAddToArchiveAd({bool logError = true}) {
    return _loadAd<InterstitialAd>(
      slot: _addToArchiveSlot,
      logError: logError,
      adLoader: AppAd.addToArchive.load,
      location: AppAdLocation.addToArchive,
    );
  }

  @override
  FutureOr<Either<AppAdFailure, RewardedAd>> getOrLoadFactExplanationAd({bool logError = true}) {
    final ad = _factExplanationSlot.ad;
    if (ad != null && _factExplanationSlot.isFresh(adFreshness)) return right(ad);
    return loadFactExplanationAd(logError: logError);
  }

  @override
  FutureOr<Either<AppAdFailure, InterstitialAd>> getOrLoadAddToArchiveAd({bool logError = true}) {
    final ad = _addToArchiveSlot.ad;
    if (ad != null && _addToArchiveSlot.isFresh(adFreshness)) return right(ad);
    return loadAddToArchiveAd(logError: logError);
  }

  @override
  Future<Either<AppAdFailure, Unit>> showFactExplanationAd(RewardedAd ad, {
    required String profileId,
    required String factId,
  }) async {
    return _showAd<RewardedAd>(
      ad: ad,
      slot: _factExplanationSlot,
      location: AppAdLocation.factExplanation,
      preloadNextAd: () => loadFactExplanationAd(logError: false),
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
      slot: _addToArchiveSlot,
      location: AppAdLocation.addToArchive,
      showProvider: () => AppAd.addToArchive.show(ad: ad),
    );
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
    required _AdSlot<T> slot,
    required Future<Either<AppAdFailure, dynamic>> Function() adLoader,
    required AppAdLocation location,
    bool logError = true,
  }) {
    final pendingRequest = slot.pendingRequest;
    if (pendingRequest != null) return pendingRequest;

    final request = _performLoad<T>(
      slot: slot,
      adLoader: adLoader,
      location: location,
      logError: logError,
    );
    slot.pendingRequest = request;
    return request;
  }

  Future<Either<AppAdFailure, T>> _performLoad<T>({
    required _AdSlot<T> slot,
    required Future<Either<AppAdFailure, dynamic>> Function() adLoader,
    required AppAdLocation location,
    required bool logError,
  }) async {
    try {
      final staleAd = slot.ad;
      if (staleAd != null) {
        slot.clear();
        await _disposeAd(staleAd);
      }

      final result = await adLoader();

      return result.fold(
        (failure) {
          if (logError) _logAdFailure(location, failure.logMessage);
          return left(failure);
        },
        (ad) {
          final typedAd = ad as T;
          slot.store(typedAd);
          return right(typedAd);
        },
      );
    } finally {
      slot.pendingRequest = null;
    }
  }

  Future<Either<AppAdFailure, Unit>> _showAd<T>({
    required T ad,
    required _AdSlot<T> slot,
    required AppAdLocation location,
    required Future<Either<AppAdFailure, dynamic>> Function() showProvider,
    Future<Either<AppAdFailure, T>> Function()? preloadNextAd,
  }) async {
    final failureOrSuccess = await showProvider();

    if (identical(slot.ad, ad)) slot.clear();

    preloadNextAd?.call();

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

  Future<void> _disposeAd(Object ad) async {
    if (ad is RewardedAd) return ad.dispose();
    if (ad is InterstitialAd) return ad.dispose();
  }

  void _logAdFailure(AppAdLocation location, String message) {
    debugPrint('AdsRepo _logAdFailure: $message');
    FirebaseCrashlytics.instance.recordError('${location.name}: $message', null, fatal: false);
  }
}
