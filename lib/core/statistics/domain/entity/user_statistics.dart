import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:utils/utils.dart';

part 'user_statistics.freezed.dart';

@freezed
abstract class UserStatistics with _$UserStatistics {
  const factory UserStatistics({
    required int stars,
    required int starsRecord,
    required int currentStreak,
    required int streakRecord,
    required int knownFacts,
    required Option<DateTime> lastActiveDate,
    required bool isStreakLost,
  }) = _UserStatistics;

  factory UserStatistics.initial() {
    return UserStatistics(
      stars: 0,
      starsRecord: 0,
      currentStreak: 0,
      streakRecord: 0,
      knownFacts: 0,
      lastActiveDate: Some(currentDay()),
      isStreakLost: false,
    );
  }
}
