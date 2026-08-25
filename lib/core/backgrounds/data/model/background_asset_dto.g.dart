// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_asset_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundAssetDto _$BackgroundAssetDtoFromJson(Map<String, dynamic> json) =>
    BackgroundAssetDto(
      path: json['path'] as String,
      type: json['type'] as String,
      version: (json['version'] as num).toInt(),
      hasSound: json['has_sound'] as bool,
      url: json['url'] as String,
      audioUrl: json['audio_url'] as String?,
    );

Map<String, dynamic> _$BackgroundAssetDtoToJson(BackgroundAssetDto instance) =>
    <String, dynamic>{
      'path': instance.path,
      'type': instance.type,
      'version': instance.version,
      'url': instance.url,
      'has_sound': instance.hasSound,
      'audio_url': ?instance.audioUrl,
    };
