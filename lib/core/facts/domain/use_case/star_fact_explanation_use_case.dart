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
class StarFactExplanationUseCase {
  final FactExplanationsRepo _factExplanationsRepo;
  final FactExplanationUtilUseCase _factExplanationUtilUseCase;
  final AnalyticsRepo _analyticsRepo;

  const StarFactExplanationUseCase(
    this._factExplanationsRepo,
    this._factExplanationUtilUseCase,
    this._analyticsRepo,
  );

  Future<Either<FactsFailure, FactExplanation>> execute({
    required UniqueId factId,
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

    /// 3. Fetch fact explanation with retry with [useCoins] flag set to [true]
    final explanation = (await _factExplanationUtilUseCase.retryFetch(factId, useStars: true)).getEntries();
    if (explanation.$1 != null) return left(explanation.$1!);

    /// 4. Cache fetched explanation
    _factExplanationsRepo.storeFactExplanationLocal(explanation.$2!);

    /// 5. Log success event to analytics
    _analyticsRepo.logFactUnlockedViaStar();

    /// 6. Success
    return right(explanation.$2!);
  }
}
