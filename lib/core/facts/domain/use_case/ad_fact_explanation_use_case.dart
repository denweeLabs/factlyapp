import 'package:denwee/core/ads/domain/repo/ads_repo.dart';
import 'package:denwee/core/ads/domain/use_case/show_fact_explanation_ad_use_case.dart';
import 'package:denwee/core/facts/domain/entity/fact_explanation.dart';
import 'package:denwee/core/facts/domain/failure/facts_failure.dart';
import 'package:denwee/core/facts/domain/repo/fact_explanations_repo.dart';
import 'package:denwee/core/facts/domain/use_case/fact_explanation_util_use_case.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:dartz/dartz.dart';
import 'package:denwee/core/statistics/domain/repo/analytics_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@LazySingleton()
class AdFactExplanationUseCase {
  final FactExplanationsRepo _factExplanationsRepo;
  final FactExplanationUtilUseCase _factExplanationUtilUseCase;
  final ShowFactExplanationAdUseCase _showFactExplanationAdUseCase;
  final AnalyticsRepo _analyticsRepo;
  final AdsRepo _adsRepo;

  const AdFactExplanationUseCase(
    this._factExplanationsRepo,
    this._factExplanationUtilUseCase,
    this._showFactExplanationAdUseCase,
    this._analyticsRepo,
    this._adsRepo,
  );

  Future<Either<FactsFailure, FactExplanation>> execute({
    required UniqueId factId,
    required UniqueId profileId,
  }) async {
    /// 1. Check reward status
    final rewardStatus = (await _factExplanationsRepo.getFactExplanationRewardStatusRemote(factId)).getEntries();
    if (rewardStatus.$1 != null) return left(rewardStatus.$1!);

    /// 2. If reward has already been obtained
    if (rewardStatus.$2 == true) {
      final explanation = (await _factExplanationUtilUseCase.retryFetch(factId)).getEntries();
      if (explanation.$1 != null) return left(explanation.$1!);
      if (explanation.$2 != null) return right(explanation.$2!);
    }

    /// 3. Retrieve ad
    final loadedAd = (await _adsRepo.getOrLoadFactExplanationAd()).getEntries();
    if (loadedAd.$1 != null) return left(FactsFailure.fromAdFailure(loadedAd.$1!));

    /// 4. Show ad
    final shownAd = (await _showFactExplanationAdUseCase.execute(
      ad: loadedAd.$2!,
      profileId: profileId,
      factId: factId,
    )).getEntries();
    if (shownAd.$1 != null) return left(FactsFailure.fromAdFailure(shownAd.$1!));

    /// 5. Add delay to establish server-side ad verification
    await Future<void>.delayed(const Duration(milliseconds: 1000));

    /// 6. Fetch fact explanation with retry to ensure the reward is claimed
    final explanation = (await _factExplanationUtilUseCase.retryFetch(factId)).getEntries();
    if (explanation.$1 != null) return left(explanation.$1!);

    /// 7. Cache fetched explanation
    _factExplanationsRepo.storeFactExplanationLocal(explanation.$2!);

    /// 8. Log success event to analytics
    _analyticsRepo.logFactUnlockedViaAd();

    /// 9. Success
    return right(explanation.$2!);
  }
}
