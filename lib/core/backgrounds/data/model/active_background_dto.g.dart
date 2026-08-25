// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_background_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveBackgroundDto _$ActiveBackgroundDtoFromJson(Map<String, dynamic> json) =>
    ActiveBackgroundDto(
      backgroundId: (json['background_id'] as num).toInt(),
      asset: BackgroundAssetDto.fromJson(json['asset'] as Map<String, dynamic>),
      style: BackgroundStyleDto.fromJson(json['style'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActiveBackgroundDtoToJson(
  ActiveBackgroundDto instance,
) => <String, dynamic>{
  'background_id': instance.backgroundId,
  'asset': instance.asset,
  'style': instance.style,
};
