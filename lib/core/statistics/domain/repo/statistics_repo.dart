import 'package:denwee/core/statistics/domain/entity/user_statistics.dart';
import 'package:dartz/dartz.dart';
import 'package:denwee/core/statistics/domain/failure/statistics_failure.dart';

abstract class StatisticsRepo {
  // Local
  Option<UserStatistics> getStatisticsLocal();
  Future<Unit> storeStatisticsLocal(UserStatistics statistics);
  Future<Unit> deleteStatisticsLocal();


  // Remote
  Future<Either<StatisticsFailure, UserStatistics>> getStatisticsRemote();
}
