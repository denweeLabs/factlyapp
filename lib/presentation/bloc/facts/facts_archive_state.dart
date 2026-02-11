part of 'facts_archive_cubit.dart';

@freezed
abstract class FactsArchiveState with _$FactsArchiveState {
  const FactsArchiveState._();
  const factory FactsArchiveState({
    @Default(false) bool isFetching,
    @Default(false) bool isFetchingMore,
    @Default(0) int archiveListTotalCount,
    @Default(<UniqueId>{}) Set<UniqueId> archiveIds,
    @Default(<ArchivedFact>[]) List<ArchivedFact> archiveList,
    @Default(None()) Option<FactsFailure> failure,
  }) = _FactsArchiveState;

  factory FactsArchiveState.initial(List<UniqueId> archive) {
    return FactsArchiveState(archiveIds: archive.toSet());
  }

  bool isArchived(UniqueId id) => archiveIds.contains(id);

  Map<DateTime, List<ArchivedFact>> get groupedByMonth {
    return archiveList.groupListsBy((fact) {
      final day = DateTime(
        fact.archivedAt.year,
        fact.archivedAt.month,
      );
      return day;
    });
  }
}
