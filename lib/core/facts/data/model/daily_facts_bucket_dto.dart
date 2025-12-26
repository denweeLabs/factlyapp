import 'package:denwee/core/facts/data/model/daily_fact_dto.dart';
import 'package:denwee/core/facts/domain/entity/daily_facts_bucket.dart';
import 'package:denwee/core/ui/constants/formatters/common_formatters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_facts_bucket_dto.g.dart';

@JsonSerializable(includeIfNull: false)
@immutable
class DailyFactsBucketDto {
  final String date;
  final List<DailyFactDto> facts;

  const DailyFactsBucketDto({
    required this.date,
    required this.facts,
  });

  factory DailyFactsBucketDto.fromDomain(DailyFactsBucket domain) {
    return DailyFactsBucketDto(
      date: yyyy_MM_dd.format(domain.date),
      facts: domain.facts.map(DailyFactDto.fromDomain).toList(),
    );
  }

  DailyFactsBucket toDomain() {
    return DailyFactsBucket(
      date: yyyy_MM_dd.parse(date),
      facts: facts.map((e) => e.toDomain()).toList(),
    );
  }

  factory DailyFactsBucketDto.fromJson(Map<String, dynamic> json) =>
      _$DailyFactsBucketDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DailyFactsBucketDtoToJson(this);
}
