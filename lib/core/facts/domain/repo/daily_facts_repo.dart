import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/facts/domain/entity/daily_facts_bucket.dart';
import 'package:denwee/core/facts/domain/failure/facts_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';

abstract class DailyFactsRepo {
  // Local
  Option<DailyFactsBucket> getBucketLocal();
  Future<Unit> storeBucketLocal(DailyFactsBucket bucket);
  Future<Unit> deleteBucketLocal();

  // Remote
  Future<Either<FactsFailure, DailyFactsBucket>> getBucketRemote({String? languageCode, List<String>? interests});
  Future<Either<FactsFailure, DailyFact>> getFactByIdRemote(UniqueId id);
}