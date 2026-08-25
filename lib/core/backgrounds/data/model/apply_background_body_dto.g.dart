// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_background_body_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyBackgroundBodyDto _$ApplyBackgroundBodyDtoFromJson(
  Map<String, dynamic> json,
) => ApplyBackgroundBodyDto(
  backgroundId: (json['background_id'] as num).toInt(),
  style: BackgroundStyleDto.fromJson(json['style'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ApplyBackgroundBodyDtoToJson(
  ApplyBackgroundBodyDto instance,
) => <String, dynamic>{
  'background_id': instance.backgroundId,
  'style': instance.style,
};
