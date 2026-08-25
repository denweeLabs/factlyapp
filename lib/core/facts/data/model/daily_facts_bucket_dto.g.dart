// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_facts_bucket_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyFactsBucketDto _$DailyFactsBucketDtoFromJson(Map<String, dynamic> json) =>
    DailyFactsBucketDto(
      date: json['date'] as String,
      facts: (json['facts'] as List<dynamic>)
          .map((e) => DailyFactDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyFactsBucketDtoToJson(
  DailyFactsBucketDto instance,
) => <String, dynamic>{'date': instance.date, 'facts': instance.facts};
