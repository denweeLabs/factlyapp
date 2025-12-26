import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_notifications_subscribe_body_dto.g.dart';

@JsonSerializable(includeIfNull: false)
@immutable
class PushNotificationsSubscribeBodyDto {
  final String token;
  final String timezone;
  final String? platform;
  @JsonKey(name: 'device_model') final String? deviceModel;
  @JsonKey(name: 'app_version') final String? appVersion;
  @JsonKey(name: 'os_version') final String? osVersion;

  const PushNotificationsSubscribeBodyDto({
    required this.token,
    required this.timezone,
    this.platform,
    this.deviceModel,
    this.appVersion,
    this.osVersion,
  });

  factory PushNotificationsSubscribeBodyDto.fromJson(
    Map<String, dynamic> json,
  ) => _$PushNotificationsSubscribeBodyDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PushNotificationsSubscribeBodyDtoToJson(this);
}
