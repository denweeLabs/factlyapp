import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/misc/domain/entity/i_entity.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'archived_fact.freezed.dart';

@freezed
abstract class ArchivedFact with _$ArchivedFact implements IEntity {
  const factory ArchivedFact({
    required UniqueId id,
    required DateTime archivedAt,
    required DailyFact fact,
  }) = _ArchivedFact;
}
