import 'package:denwee/core/facts/data/model/daily_fact_dto.dart';
import 'package:denwee/core/facts/domain/entity/archived_fact.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'archived_fact_dto.g.dart';

@JsonSerializable(includeIfNull: false)
@immutable
class ArchivedFactDto {
  final int id;
  @JsonKey(name: 'archived_at')
  final DateTime archivedAt;
  final DailyFactDto fact;

  const ArchivedFactDto({
    required this.id,
    required this.archivedAt,
    required this.fact,
  });

  factory ArchivedFactDto.fromDomain(ArchivedFact domain) {
    return ArchivedFactDto(
      id: domain.id.value,
      archivedAt: domain.archivedAt,
      fact: DailyFactDto.fromDomain(domain.fact),
    );
  }

  ArchivedFact toDomain() {
    return ArchivedFact(
      id: UniqueId.fromValue(id),
      archivedAt: archivedAt,
      fact: fact.toDomain(),
    );
  }

  factory ArchivedFactDto.fromJson(Map<String, dynamic> json) =>
      _$ArchivedFactDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArchivedFactDtoToJson(this);
}
