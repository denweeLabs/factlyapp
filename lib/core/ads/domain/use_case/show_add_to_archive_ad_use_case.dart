import 'package:dartz/dartz.dart';
import 'package:denwee/core/ads/domain/entity/app_ad_failure.dart';
import 'package:denwee/core/ads/domain/repo/ads_repo.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ShowAddToArchiveAdUseCase {
  final AdsRepo _adsRepo;

  const ShowAddToArchiveAdUseCase(this._adsRepo);

  Future<Either<AppAdFailure, Unit>> execute({
    required InterstitialAd ad,
    required UniqueId profileId,
  }) async {
    final failureOrSuccess = await _adsRepo.showAddToArchiveAd(ad);
    // if success -> increase ad view counter
    failureOrSuccess.fold(
      (_) {},
      (_) => _adsRepo.addAdvertismentViewed(profileId),
    );
    return failureOrSuccess;
  }
}
