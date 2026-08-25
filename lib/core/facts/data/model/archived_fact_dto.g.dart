// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archived_fact_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArchivedFactDto _$ArchivedFactDtoFromJson(Map<String, dynamic> json) =>
    ArchivedFactDto(
      id: (json['id'] as num).toInt(),
      archivedAt: DateTime.parse(json['archived_at'] as String),
      fact: DailyFactDto.fromJson(json['fact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArchivedFactDtoToJson(ArchivedFactDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'archived_at': instance.archivedAt.toIso8601String(),
      'fact': instance.fact,
    };
