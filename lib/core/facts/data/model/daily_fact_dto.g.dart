// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_fact_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyFactDto _$DailyFactDtoFromJson(Map<String, dynamic> json) => DailyFactDto(
  id: (json['id'] as num).toInt(),
  content: json['content'] as String,
  source: json['source'] as String?,
  language: json['language_code'] as String,
  interestId: (json['interest_id'] as num).toInt(),
  title: json['title'] as String,
  historicalDate: json['historical_date'] as String?,
  factRegion: json['fact_region'] as String?,
  relatedTopics: (json['related_topics'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$DailyFactDtoToJson(DailyFactDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'source': ?instance.source,
      'language_code': instance.language,
      'interest_id': instance.interestId,
      'historical_date': ?instance.historicalDate,
      'fact_region': ?instance.factRegion,
      'related_topics': ?instance.relatedTopics,
    };
