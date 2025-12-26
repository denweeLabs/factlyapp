import 'package:denwee/core/facts/domain/entity/fact_explanation.dart';
import 'package:denwee/core/facts/domain/failure/facts_failure.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:dartz/dartz.dart';

abstract class FactExplanationsRepo {
  // Local
  Future<Either<FactsFailure, Option<FactExplanation>>> getFactExplanationLocal(UniqueId id);
  Future<Either<FactsFailure, Unit>> storeFactExplanationLocal(FactExplanation explanation);
  Future<Either<FactsFailure, Unit>> deleteFactExplanationsLocal();

  // Remote
  Future<Either<FactsFailure, FactExplanation>> getFactExplanationRemote(UniqueId id, {bool useStars = false});
  Future<Either<FactsFailure, bool>> getFactExplanationRewardStatusRemote(UniqueId id);
}
