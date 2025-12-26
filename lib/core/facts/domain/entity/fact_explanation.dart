import 'package:denwee/core/misc/domain/entity/i_entity.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fact_explanation.freezed.dart';

@freezed
abstract class FactExplanation with _$FactExplanation implements IEntity {
  const factory FactExplanation({
    required UniqueId id,
    required String content,
  }) = _FactExplanation;
}
