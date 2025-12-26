import 'package:denwee/core/statistics/data/model/user_statistics_dto.dart';

abstract class StatisticsLocalSource {
  ///
  /// Get user statistics
  UserStatisticsDto? get();

  ///
  /// Store user statistics
  Future<void> store(UserStatisticsDto dto);
  
  ///
  /// Delete user statistics
  Future<void> delete();
}