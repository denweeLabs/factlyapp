// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notifications_subscribe_body_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotificationsSubscribeBodyDto _$PushNotificationsSubscribeBodyDtoFromJson(
  Map<String, dynamic> json,
) => PushNotificationsSubscribeBodyDto(
  token: json['token'] as String,
  timezone: json['timezone'] as String,
  platform: json['platform'] as String?,
  deviceModel: json['device_model'] as String?,
  appVersion: json['app_version'] as String?,
  osVersion: json['os_version'] as String?,
);

Map<String, dynamic> _$PushNotificationsSubscribeBodyDtoToJson(
  PushNotificationsSubscribeBodyDto instance,
) => <String, dynamic>{
  'token': instance.token,
  'timezone': instance.timezone,
  'platform': ?instance.platform,
  'device_model': ?instance.deviceModel,
  'app_version': ?instance.appVersion,
  'os_version': ?instance.osVersion,
};
