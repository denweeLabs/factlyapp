// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_explanation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactExplanationDto _$FactExplanationDtoFromJson(Map<String, dynamic> json) =>
    FactExplanationDto(
      id: (json['fact_id'] as num).toInt(),
      content: json['content'] as String,
    );

Map<String, dynamic> _$FactExplanationDtoToJson(FactExplanationDto instance) =>
    <String, dynamic>{'fact_id': instance.id, 'content': instance.content};
