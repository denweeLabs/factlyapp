import 'package:dartz/dartz.dart';
import 'package:denwee/core/ads/domain/entity/app_ad_failure.dart';
import 'package:denwee/core/ads/domain/repo/ads_repo.dart';
import 'package:denwee/core/misc/data/storage/common_storage.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/presentation/bloc/profile/profile_cubit.dart';
import 'package:denwee/presentation/bloc/subscriptions/user_subscription_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@LazySingleton()
class ShowAddToArchiveAdUseCase {
  final AdsRepo _adsRepo;
  final CommonStorage _commonStorage;
  final UserSubscriptionCubit _userSubscriptionCubit;
  final ProfileCubit _profileCubit;

  const ShowAddToArchiveAdUseCase(
    this._adsRepo,
    this._commonStorage,
    this._userSubscriptionCubit,
    this._profileCubit,
  );

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

  Future<void> executeIfEligible() async {
    /// 1. Do not show any ads if user has subscription
    /// 
    if (_userSubscriptionCubit.state.isSubscribed) return;

    /// 2. Check how many times user has added facts to archive
    /// 
    final currentCounter = await _commonStorage.increaseAddToArchiveCounter();

    /// 3. Wait untill the counter
    /// 
    if (currentCounter < AppConstants.config.showArchiveAdOnCountOf) return;

    /// 4. Reset the counter
    /// 
    await _commonStorage.resetAddToArchiveCounter();

    /// 5. Do not show an ad if probability has not passed
    /// 
    if (!pseudoProbabilityOf(AppConstants.config.showArchiveAdProbabilityPercent)) {
      return;
    }

    /// 6. Load and show the ad if probability has passed
    final (_, ad) = (await _adsRepo.getOrLoadAddToArchiveAd()).getEntries();
    if (ad != null) {
      final profileId = _profileCubit.state.profile.toNullable()!.id;
      await execute(ad: ad, profileId: profileId);
    }
  }
}
