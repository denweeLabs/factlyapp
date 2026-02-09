import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:denwee/core/network/domain/repo/request_executor.dart';
import 'package:denwee/di/server_module.dart';
import 'package:injectable/injectable.dart';

abstract class StatisticsEndpoints {
  static const _base = '/member';
  static const userStatistics = '$_base/statistics';
}

@LazySingleton()
class StatisticsApi {
  final RequestExecutor _client;

  const StatisticsApi(@API this._client);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> getStatistics() {
    return _client.get(StatisticsEndpoints.userStatistics);
  }
}