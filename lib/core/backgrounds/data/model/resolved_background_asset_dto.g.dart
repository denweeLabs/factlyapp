// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolved_background_asset_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResolvedBackgroundAssetDto _$ResolvedBackgroundAssetDtoFromJson(
  Map<String, dynamic> json,
) => ResolvedBackgroundAssetDto(
  activeBackground: ActiveBackgroundDto.fromJson(
    json['active_background'] as Map<String, dynamic>,
  ),
  visualFilePath: json['visual_file_path'] as String,
  audioFilePath: json['audio_file_path'] as String?,
);

Map<String, dynamic> _$ResolvedBackgroundAssetDtoToJson(
  ResolvedBackgroundAssetDto instance,
) => <String, dynamic>{
  'active_background': instance.activeBackground,
  'visual_file_path': instance.visualFilePath,
  'audio_file_path': ?instance.audioFilePath,
};
