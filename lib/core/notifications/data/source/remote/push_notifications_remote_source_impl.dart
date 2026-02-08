import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:denwee/core/notifications/data/model/push_notifications_subscribe_body_dto.dart';
import 'package:denwee/core/notifications/data/source/remote/push_notifications_api.dart';
import 'package:denwee/core/notifications/domain/source/push_notifications_remote_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PushNotificationsRemoteSource)
class PushNotificationsRemoteSourceImpl implements PushNotificationsRemoteSource {
  final PushNotificationsApi _api;

  const PushNotificationsRemoteSourceImpl(this._api);

  @override
  Future<void> subscribe(PushNotificationsSubscribeBodyDto dto) async {
    final response = await _api.subscribe(dto.toJson());
    return response.successOrThrow();
  }

  @override
  Future<void> unsubscribe(String token) async {
    final body = {'token': token};
    final response = await _api.unsubscribe(body);
    return response.successOrThrow();
  }
}
