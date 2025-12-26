import 'package:denwee/core/ads/data/repo/add_to_archive_ad_impl.dart';
import 'package:denwee/core/ads/data/repo/fact_explanation_ad_impl.dart';
import 'package:denwee/core/ads/domain/entity/app_ad_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

enum AppAdLocation {
  factExplanation,
  addToArchive,
}

abstract class AppAd {
  static final factExplanation = AppAd._(AppAdLocation.factExplanation);
  static final addToArchive = AppAd._(AppAdLocation.addToArchive);

  const AppAd();

  factory AppAd._(AppAdLocation type) {
    switch (type) {
      case AppAdLocation.factExplanation:
        return FactExplanationAd();
      case AppAdLocation.addToArchive:
        return AddToArchiveAd();
    }
  }

  AppAdLocation get type;
  Future<Either<AppAdFailure, dynamic>> load();
  Future<Either<AppAdFailure, dynamic>> show({
    required dynamic ad,
    ServerSideVerificationOptions? ssv,
  });
}