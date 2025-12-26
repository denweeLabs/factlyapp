import 'package:denwee/core/facts/domain/entity/fact_explanation.dart';
import 'package:denwee/core/facts/domain/failure/facts_failure.dart';
import 'package:denwee/core/facts/domain/repo/fact_explanations_repo.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@LazySingleton()
class FactExplanationUtilUseCase {
  final FactExplanationsRepo _factExplanationsRepo;

  const FactExplanationUtilUseCase(this._factExplanationsRepo);

  static const maxExplanationFetchAttempts = 3;
  static const explanationNextFetchDelay = Duration(milliseconds: 1000);

  static const explanationStreamInterval = Duration(milliseconds: 110);
  static const explanationStreamCharsPerUpdate = 30;

  Future<Either<FactsFailure, FactExplanation>> retryFetch(UniqueId id, {bool useStars = false}) async {
    late Either<FactsFailure, FactExplanation> failureOrSuccess;

    for (var attempt = 0; attempt < maxExplanationFetchAttempts; attempt++) {
      failureOrSuccess = await _factExplanationsRepo.getFactExplanationRemote(id, useStars: useStars);
      final entities = failureOrSuccess.getEntries();
      if (entities.$1 != FactsFailure.explanationRewardMissing) break;
      if (entities.$2 != null) break;
      await Future<void>.delayed(explanationNextFetchDelay);
    }

    return failureOrSuccess;
  }

  Stream<String> createStream(String explanationData) async* {
    for (var i = 0;
        i < explanationData.length;
        i += explanationStreamCharsPerUpdate) {
      final end = (i + explanationStreamCharsPerUpdate)
          .clamp(0, explanationData.length);
      final chunk = explanationData.substring(i, end);
      yield chunk;
      await Future.delayed(explanationStreamInterval);
    }
  }
}
