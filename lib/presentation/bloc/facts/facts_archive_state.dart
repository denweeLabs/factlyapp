part of 'facts_archive_cubit.dart';

@freezed
abstract class FactsArchiveState with _$FactsArchiveState {
  const FactsArchiveState._();
  const factory FactsArchiveState({
    @Default(false) bool isFetching,
    @Default(false) bool isFetchingMore,
    @Default(0) int archiveListTotalCount,
    @Default(<UniqueId>[]) List<UniqueId> archiveIds,
    @Default(<ArchivedFact>[]) List<ArchivedFact> archiveList,
    @Default(None()) Option<FactsFailure> failure,
  }) = _FactsArchiveState;

  factory FactsArchiveState.initial(List<UniqueId> archive) {
    return FactsArchiveState(archiveIds: archive);
  }

  bool isArchived(UniqueId id) => archiveIds.contains(id);

  // List<ArchivedFact> get sortedByDate =>
  //     archive.sorted((a, b) => a.archivedAt.compareTo(b.archivedAt));

  Map<DateTime, List<ArchivedFact>> get groupedByMonth {
    return archiveList.groupListsBy((fact) {
      final day = DateTime(
        fact.archivedAt.year,
        fact.archivedAt.month,
        // fact.archivedAt.day,
      );
      return day;
    });
  }

  // Map<DateTime, List<ArchivedFact>> get sortedGroupedByDay {
  //   final original = groupedByDay;

  //   final sortedEntries = original.entries.toList()
  //     ..sort((a, b) => b.key.compareTo(a.key));

  //   return Map.fromEntries(sortedEntries.map(
  //     (entry) => MapEntry(
  //       entry.key,
  //       entry.value.sorted((a, b) =>
  //           b.archivedAt.compareTo(a.archivedAt)),
  //     ),
  //   ));
  // }
}
