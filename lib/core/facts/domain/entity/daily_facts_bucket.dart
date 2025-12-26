import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_facts_bucket.freezed.dart';

@freezed
abstract class DailyFactsBucket with _$DailyFactsBucket {
  const factory DailyFactsBucket({
    required DateTime date,
    required List<DailyFact> facts,
  }) = _DailyFactsBucket;
}
