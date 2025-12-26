import 'dart:ui';

import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/misc/domain/entity/i_entity.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/network/domain/entity/network_link.dart';
import 'package:denwee/core/ui/constants/formatters/common_formatters.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;

part 'daily_fact.freezed.dart';

@freezed
abstract class DailyFact with _$DailyFact implements IEntity {
  const DailyFact._();
  const factory DailyFact({
    required UniqueId id,
    required UserInterest interest,
    required String content,
    required String title,
    required Locale language,
    required Option<NetworkLink> source,
    required Option<DateTime> date,
    required Option<String> region,
    required Option<List<String>> relatedTopics,
  }) = _DailyFact;
}

extension DailyFactX on DailyFact {
  bool showFullHistoricalDate() {
    final nullableDate = date.toNullable();
    if (nullableDate == null) return false;
    final difference = currentDay().difference(nullableDate);
    return interest.isHistory || (difference.inDays > 365 * 50);  // if more than 50 years
  }

  bool showTimeAgoDate() {
    return !showFullHistoricalDate();
  }

  String? fullDateText() {
    final nullableDate = date.toNullable();
    if (nullableDate == null) return null;
    return historical_date.format(nullableDate);
  }

  String? timeAgoDateText() {
    final nullableDate = date.toNullable();
    if (nullableDate == null) return null;
    final difference = currentDay().difference(nullableDate);
    return timeago.format(currentDay().subtract(difference));
  }

  String? displayDateText() {
    final nullableDate = date.toNullable();
    if (nullableDate == null) return null;
    final isFullDate = showFullHistoricalDate();
    return isFullDate ? fullDateText() : timeAgoDateText();
  }
}
