import 'package:denwee/core/network/data/exceptions/connection_exception.dart';
import 'package:denwee/core/statistics/data/model/user_statistics_dto.dart';

abstract class StatisticsRemoteSource {
  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<UserStatisticsDto> getStatistics();
}
