import 'package:denwee/core/network/data/model/server_error_response.dart';
import 'package:denwee/core/network/domain/request_executor/request_executor.dart';
import 'package:denwee/core/statistics/data/model/user_statistics_dto.dart';
import 'package:denwee/core/statistics/data/source/remote/statistics_remote_source.dart';
import 'package:denwee/di/api/endpoints/endpoints.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: StatisticsRemoteSource)
class StatisticsRemoteSourceImpl implements StatisticsRemoteSource {
  final RequestExecutor _requestExecutor;

  const StatisticsRemoteSourceImpl(
    @API this._requestExecutor,
  );

  @override
  Future<UserStatisticsDto> getStatistics() async {
    final response = await _requestExecutor.get(
      Endpoints.member.userStatistics,
    );
    final data = response.data as Map<String, dynamic>;
    if (response.isSuccessful) {
      return UserStatisticsDto.fromJson(data);
    } else {
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }
}
