import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:denwee/core/network/domain/repo/request_executor.dart';
import 'package:denwee/di/server_module.dart';
import 'package:injectable/injectable.dart';

abstract class UserPreferencesEndpoints {
  static const _base = '/member';

  static const preferences = '$_base/preferences';
}

@LazySingleton()
class UserPreferencesApi {
  final RequestExecutor _client;

  const UserPreferencesApi(@API this._client);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> getPreferences() {
    return _client.get(UserPreferencesEndpoints.preferences);
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> storePreferences(Map<String, dynamic> body) {
    return _client.put(
      UserPreferencesEndpoints.preferences,
      body: body,
    );
  }
}