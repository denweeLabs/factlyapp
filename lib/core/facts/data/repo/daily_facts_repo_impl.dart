import 'package:denwee/core/facts/data/model/daily_facts_bucket_dto.dart';
import 'package:denwee/core/facts/data/source/local/facts_local_source.dart';
import 'package:denwee/core/facts/data/source/remote/facts_remote_source.dart';
import 'package:denwee/core/facts/domain/entity/daily_facts_bucket.dart';
import 'package:denwee/core/facts/domain/failure/facts_failure.dart';
import 'package:denwee/core/facts/domain/repo/daily_facts_repo.dart';
import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DailyFactsRepo)
class DailyFactsRepoImpl implements DailyFactsRepo {
  final FactsLocalSource _localSource;
  final FactsRemoteSource _remoteSource;

  const DailyFactsRepoImpl(
    this._localSource,
    this._remoteSource,
  );

  @override
  Option<DailyFactsBucket> getBucketLocal() {
    final dto = _localSource.getDailyBucket();
    return optionOf(dto?.toDomain());
  }

  @override
  Future<Unit> storeBucketLocal(DailyFactsBucket bucket) async {
    final dto = DailyFactsBucketDto.fromDomain(bucket);
    await _localSource.storeDailyBucket(dto);
    return unit;
  }

  @override
  Future<Unit> deleteBucketLocal() async {
    await _localSource.deleteDailyBucket();
    return unit;
  }

  @override
  Future<Either<FactsFailure, DailyFactsBucket>> getBucketRemote({String? languageCode, List<String>? interests}) async {
    try {
      final bucketDto = await _remoteSource.getDailyFactsBucket(
        languageCode: languageCode,
        interests: interests,
      );
      return right(bucketDto.toDomain());
    } on AppException catch (error) {
      final failure = FactsFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(FactsFailure.unexpected);
    }
  }
}
