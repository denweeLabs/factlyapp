import 'package:denwee/core/facts/domain/entity/archived_fact.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'archive_list_result.freezed.dart';

@freezed
abstract class ArchiveListResult with _$ArchiveListResult {
  const factory ArchiveListResult({
    required List<ArchivedFact> items,
    required int total,
    required int page,
  }) = _ArchiveListResult;
}
