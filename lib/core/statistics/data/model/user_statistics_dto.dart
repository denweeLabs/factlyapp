import 'package:denwee/core/statistics/domain/entity/user_statistics.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_statistics_dto.g.dart';

@JsonSerializable(includeIfNull: false)
@immutable
class UserStatisticsDto {
  final int stars;
  @JsonKey(name: 'max_stars') final int starsRecord;
  @JsonKey(name: 'current_streak') final int currentStreak;
  @JsonKey(name: 'longest_streak') final int streakRecord;
  @JsonKey(name: 'known_facts') final int knownFacts;
  @JsonKey(name: 'last_active_date') final DateTime? lastActiveDate;
  @JsonKey(name: 'streak_lost') final bool streakLost;

  const UserStatisticsDto({
    required this.stars,
    required this.starsRecord,
    required this.currentStreak,
    required this.streakRecord,
    required this.knownFacts,
    required this.lastActiveDate,
    required this.streakLost,
  });

  factory UserStatisticsDto.fromDomain(UserStatistics domain) {
    return UserStatisticsDto(
      stars: domain.stars,
      starsRecord: domain.starsRecord,
      currentStreak: domain.currentStreak,
      streakRecord: domain.streakRecord,
      knownFacts: domain.knownFacts,
      lastActiveDate: domain.lastActiveDate.toNullable(),
      streakLost: domain.isStreakLost,
    );
  }

  UserStatistics toDomain() {
    return UserStatistics(
      stars: stars,
      starsRecord: starsRecord,
      currentStreak: currentStreak,
      streakRecord: streakRecord,
      knownFacts: knownFacts,
      lastActiveDate: optionOf(lastActiveDate),
      isStreakLost: streakLost,
    );
  }

  factory UserStatisticsDto.fromJson(Map<String, dynamic> json) =>
      _$UserStatisticsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserStatisticsDtoToJson(this);
}
