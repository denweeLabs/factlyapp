import 'package:denwee/core/profile/data/model/profile_dto.dart';
import 'package:denwee/core/network/data/model/server_error_response.dart';
import 'package:denwee/core/network/domain/request_executor/request_executor.dart';
import 'package:denwee/core/profile/data/model/update_profile_body_dto.dart';
import 'package:denwee/di/api/endpoints/endpoints.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileRemoteSource {
  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<ProfileDto> get();

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<ProfileDto> update(UpdateProfileBodyDto bodyDto);
}

@LazySingleton(as: ProfileRemoteSource)
class ProfileRemoteSourceImpl implements ProfileRemoteSource {
  final RequestExecutor _requestExecutor;

  const ProfileRemoteSourceImpl(
    @API this._requestExecutor,
  );

  @override
  Future<ProfileDto> get() async {
    final response = await _requestExecutor.get(Endpoints.member.profile);
    final data = response.data as Map<String, dynamic>;

    if (response.isSuccessful) {
      return ProfileDto.fromJson(data);
    } else {
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<ProfileDto> update(UpdateProfileBodyDto bodyDto) async {
    final body = bodyDto.toJson();
    final response = await _requestExecutor.put(
      Endpoints.member.profile,
      body: body,
    );
    final data = response.data as Map<String, dynamic>;

    if (response.isSuccessful) {
      return ProfileDto.fromJson(data);
    } else {
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }
}
