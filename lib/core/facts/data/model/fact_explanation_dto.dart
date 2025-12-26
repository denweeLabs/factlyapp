import 'package:denwee/core/facts/domain/entity/fact_explanation.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/db/database.dart' as db;
import 'package:drift/drift.dart' hide JsonKey;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fact_explanation_dto.g.dart';

@JsonSerializable(includeIfNull: false)
@immutable
class FactExplanationDto {
  @JsonKey(name: 'fact_id')
  final int id;
  final String content;

  const FactExplanationDto({
    required this.id,
    required this.content,
  });

  factory FactExplanationDto.fromDomain(FactExplanation domain) {
    return FactExplanationDto(
      id: domain.id.value,
      content: domain.content,
    );
  }

  factory FactExplanationDto.fromDbModel(db.FactExplanation model) {
    return FactExplanationDto(
      id: model.id,
      content: model.content,
    );
  }

  FactExplanation toDomain() {
    return FactExplanation(
      id: UniqueId.fromValue(id),
      content: content,
    );
  }

  db.FactExplanationsCompanion toDbCompanion() {
    return db.FactExplanationsCompanion.insert(
      id: Value(id),
      content: content,
    );
  }

  factory FactExplanationDto.fromJson(Map<String, dynamic> json) =>
      _$FactExplanationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FactExplanationDtoToJson(this);
}
