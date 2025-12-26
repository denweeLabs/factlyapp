import 'package:denwee/core/network/data/model/server_error_response.dart';
import 'package:denwee/core/network/domain/request_executor/request_executor.dart';
import 'package:denwee/core/notifications/data/model/push_notifications_subscribe_body_dto.dart';
import 'package:denwee/di/api/endpoints/endpoints.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

abstract class PushNotificationsRemoteSource {
  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<void> subscribe(PushNotificationsSubscribeBodyDto dto);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<void> unsubscribe(String token);
}

@LazySingleton(as: PushNotificationsRemoteSource)
class PushNotificationsRemoteSourceImpl implements PushNotificationsRemoteSource {
  final RequestExecutor _requestExecutor;

  const PushNotificationsRemoteSourceImpl(
    @API this._requestExecutor,
  );

  @override
  Future<void> subscribe(PushNotificationsSubscribeBodyDto dto) async {
    final body = dto.toJson();
    final response = await _requestExecutor.post(
      Endpoints.member.pushNotificationsSubscribe,
      body: body,
    );
    if (!response.isSuccessful) {
      final errorResponse = ServerErrorResponse.fromJson(response.data as Map<String, dynamic>);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<void> unsubscribe(String token) async {
    final body = {'token': token};
    final response = await _requestExecutor.post(
      Endpoints.member.pushNotificationsUnsubscribe,
      body: body,
    );
    if (!response.isSuccessful) {
      final errorResponse = ServerErrorResponse.fromJson(response.data as Map<String, dynamic>);
      throw errorResponse.asGenericException;
    }
  }
}
