import 'package:denwee/core/network/data/model/server_error_response.dart';
import 'package:denwee/core/network/domain/request_executor/request_executor.dart';
import 'package:denwee/core/user_preferences/data/model/user_preferences_dto.dart';
import 'package:denwee/di/api/endpoints/endpoints.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

abstract class UserPreferencesRemoteSource {
  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<UserPreferencesDto> get();

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<void> store(UserPreferencesDto dto);
}

@LazySingleton(as: UserPreferencesRemoteSource)
class UserPreferencesRemoteSourceImpl implements UserPreferencesRemoteSource {
  final RequestExecutor _requestExecutor;

  const UserPreferencesRemoteSourceImpl(
    @API this._requestExecutor,
  );

  @override
  Future<UserPreferencesDto> get() async {
    final response = await _requestExecutor.get(Endpoints.member.preferences);
    final data = response.data as Map<String, dynamic>;

    if (response.isSuccessful) {
      return UserPreferencesDto.fromJson(data);
    } else {
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<void> store(UserPreferencesDto dto) async {
    final body = dto.toJson();
    final response = await _requestExecutor.put(
      Endpoints.member.preferences,
      body: body,
    );
    if (!response.isSuccessful) {
      final errorResponse = ServerErrorResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
      throw errorResponse.asGenericException;
    }
  }
}
