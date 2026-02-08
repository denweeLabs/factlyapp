import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:denwee/core/network/domain/repo/request_executor.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

sealed class ProfileEndpoints {
  static const profile = '/member/profile';
  static const memberData = '/member/bootstrap';
}

@LazySingleton()
class ProfileApi {
  final RequestExecutor _client;

  const ProfileApi(@API this._client);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> getProfile() {
    return _client.get(ProfileEndpoints.profile);
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> updateProfile(Map<String, dynamic> body) {
    return _client.put(ProfileEndpoints.profile, body: body);
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> getMemberData() {
    return _client.get(ProfileEndpoints.memberData);
  }
}
