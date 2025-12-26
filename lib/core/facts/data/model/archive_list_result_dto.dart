import 'package:denwee/core/facts/data/model/archived_fact_dto.dart';
import 'package:denwee/core/facts/domain/entity/archive_list_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'archive_list_result_dto.g.dart';

@JsonSerializable(includeIfNull: false)
@immutable
class ArchiveListResultDto {
  final List<ArchivedFactDto> items;
  final int total;
  final int page;

  const ArchiveListResultDto({
    required this.items,
    required this.total,
    required this.page,
  });

  factory ArchiveListResultDto.fromDomain(ArchiveListResult domain) {
    return ArchiveListResultDto(
      items: domain.items.map(ArchivedFactDto.fromDomain).toList(),
      page: domain.page,
      total: domain.total,
    );
  }

  ArchiveListResult toDomain() {
    return ArchiveListResult(
      items: items.map((e) => e.toDomain()).toList(),
      total: total,
      page: page,
    );
  }

  factory ArchiveListResultDto.fromJson(Map<String, dynamic> json) =>
      _$ArchiveListResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArchiveListResultDtoToJson(this);
}
