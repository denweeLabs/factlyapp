import 'package:dartz/dartz.dart';
import 'package:denwee/core/ads/domain/entity/app_ad_failure.dart';
import 'package:denwee/core/ads/domain/repo/ads_repo.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ShowFactExplanationAdUseCase {
  final AdsRepo _adsRepo;

  const ShowFactExplanationAdUseCase(this._adsRepo);

  Future<Either<AppAdFailure, Unit>> execute({
    required RewardedAd ad,
    required UniqueId profileId,
    required UniqueId factId,
  }) async {
    final failureOrSuccess = await _adsRepo.showFactExplanationAd(
      ad,
      profileId: profileId.stringValue,
      factId: factId.stringValue,
    );
    // if success -> increase ad view counter
    failureOrSuccess.fold(
      (_) {},
      (_) => _adsRepo.addAdvertismentViewed(profileId),
    );
    return failureOrSuccess;
  }
}
