import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:denwee/core/statistics/data/model/user_statistics_dto.dart';
import 'package:denwee/core/statistics/data/source/local/statistics_local_source.dart';
import 'package:denwee/core/statistics/data/source/remote/statistics_remote_source.dart';
import 'package:denwee/core/statistics/domain/entity/user_statistics.dart';
import 'package:denwee/core/statistics/domain/failure/statistics_failure.dart';
import 'package:denwee/core/statistics/domain/repo/statistics_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: StatisticsRepo)
class StatisticsRepoImpl implements StatisticsRepo {
  final StatisticsLocalSource _localSource;
  final StatisticsRemoteSource _remoteSource;

  const StatisticsRepoImpl(
    this._localSource,
    this._remoteSource,
  );

  @override
  Option<UserStatistics> getStatisticsLocal() {
    final data = _localSource.get();
    return optionOf(data?.toDomain());
  }

  @override
  Future<Unit> storeStatisticsLocal(UserStatistics statistics) async {
    final dto = UserStatisticsDto.fromDomain(statistics);
    await _localSource.store(dto);
    return unit;
  }

  @override
  Future<Unit> deleteStatisticsLocal() async {
    await _localSource.delete();
    return unit;
  }

  @override
  Future<Either<StatisticsFailure, UserStatistics>> getStatisticsRemote() async {
    try {
      final statistics = await _remoteSource.getStatistics();
      return right(statistics.toDomain());
    } on AppException catch (error) {
      final failure = StatisticsFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(StatisticsFailure.unexpected);
    }
  }
}
