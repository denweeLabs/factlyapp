import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:denwee/core/network/domain/repo/request_executor.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

abstract class PushNotificationsEndpoints {
  static const _base = '/member/push_notifications';

  static const subscribe = '$_base/subscribe';
  static const unsubscribe = '$_base/unsubscribe';
}

@LazySingleton()
class PushNotificationsApi {
  final RequestExecutor _client;

  const PushNotificationsApi(@API this._client);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> subscribe(Map<String, dynamic> body) {
    return _client.post(
      PushNotificationsEndpoints.subscribe,
      body: body,
    );
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> unsubscribe(Map<String, dynamic> body) {
    return _client.post(
      PushNotificationsEndpoints.unsubscribe,
      body: body,
    );
  }
}