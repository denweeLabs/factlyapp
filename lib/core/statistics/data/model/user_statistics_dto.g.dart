// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_statistics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStatisticsDto _$UserStatisticsDtoFromJson(Map<String, dynamic> json) =>
    UserStatisticsDto(
      stars: (json['stars'] as num).toInt(),
      starsRecord: (json['max_stars'] as num).toInt(),
      currentStreak: (json['current_streak'] as num).toInt(),
      streakRecord: (json['longest_streak'] as num).toInt(),
      knownFacts: (json['known_facts'] as num).toInt(),
      lastActiveDate: json['last_active_date'] == null
          ? null
          : DateTime.parse(json['last_active_date'] as String),
      streakLost: json['streak_lost'] as bool?,
    );

Map<String, dynamic> _$UserStatisticsDtoToJson(UserStatisticsDto instance) =>
    <String, dynamic>{
      'stars': instance.stars,
      'max_stars': instance.starsRecord,
      'current_streak': instance.currentStreak,
      'longest_streak': instance.streakRecord,
      'known_facts': instance.knownFacts,
      'last_active_date': ?instance.lastActiveDate?.toIso8601String(),
      'streak_lost': ?instance.streakLost,
    };
