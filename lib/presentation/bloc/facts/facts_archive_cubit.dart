import 'dart:async';

import 'package:denwee/core/ads/domain/use_case/show_add_to_archive_ad_use_case.dart';
import 'package:denwee/core/analytics/domain/repo/analytics_repo.dart';
import 'package:denwee/core/facts/data/source/remote/facts_api.dart';
import 'package:denwee/core/facts/domain/entity/archived_fact.dart';
import 'package:denwee/core/facts/domain/entity/facts_failure.dart';
import 'package:denwee/core/facts/domain/repo/facts_archive_repo.dart';
import 'package:denwee/core/facts/domain/use_case/handle_facts_archive_use_case.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';

part 'facts_archive_state.dart';
part 'facts_archive_cubit.freezed.dart';

@LazySingleton()
class FactsArchiveCubit extends Cubit<FactsArchiveState> {
  final FactsArchiveRepo _archiveRepo;
  final ShowAddToArchiveAdUseCase _showAddToArchiveAdUseCase;
  final HandleFactsArchiveUseCase _handleFactsArchiveUseCase;
  final AnalyticsRepo _analyticsRepo;

  FactsArchiveCubit(
    this._archiveRepo,
    this._showAddToArchiveAdUseCase,
    this._handleFactsArchiveUseCase,
    this._analyticsRepo,
  ) : super(FactsArchiveState.initial(_archiveRepo.getArchiveIdsLocal()));

  var _itemsTotalCount = 0;
  var _itemsPage = 0;

  Future<void> checkArchiveIds() async {
    emit(state.copyWith(
      isFetching: true,
      failure: const None(),
    ));

    final failureOrSuccess = await _handleFactsArchiveUseCase.getIds();

    emit(
      failureOrSuccess.fold(
        (failure) => state.copyWith(isFetching: false, failure: Some(failure)),
        (success) => state.copyWith(isFetching: false, archiveIds: success.toSet()),
      ),
    );
  }

  Future<void> fetchArchiveList() async {
    emit(state.copyWith(isFetching: true, failure: const None()));

    _itemsPage = 0;

    final failureOrSuccess = await _archiveRepo.getArchiveListRemote(
      sortOrder: SortOrder.descending,
      count: AppConstants.config.myArchivePageSize,
      page: _itemsPage,
    );

    emit(
      failureOrSuccess.fold(
        (failure) => state.copyWith(isFetching: false, failure: Some(failure)),
        (success) {
          _itemsTotalCount = success.total;

          return state.copyWith(
            archiveListTotalCount: _itemsTotalCount,
            archiveList: success.items,
            isFetching: false,
          );
        },
      ),
    );
  }

  Future<void> fetchMoreArchiveList() async {
    if (state.isFetchingMore) return;
    
    if (state.archiveList.length < _itemsTotalCount) {
      emit(state.copyWith(isFetchingMore: true));

      final newPage = _itemsPage + 1;
      final failureOrSuccess = await _archiveRepo.getArchiveListRemote(
        sortOrder: SortOrder.descending,
        count: AppConstants.config.myArchivePageSize,
        page: newPage,
      );

      emit(
        failureOrSuccess.fold(
          (failure) => state.copyWith(isFetchingMore: false, failure: Some(failure)),
          (success) {
            _itemsPage = newPage;
            _itemsTotalCount = success.total;

            final newArchiveList = [
              ...state.archiveList,
              ...success.items,
            ];

            return state.copyWith(
              archiveListTotalCount: _itemsTotalCount,
              archiveList: newArchiveList,
              isFetchingMore: false,
            );
          },
        ),
      );
    }
  }

  Future<void> add(UniqueId id) async {
    final archive = Set<UniqueId>.from(state.archiveIds)..add(id);

    emit(state.copyWith(
      archiveIds: archive,
      failure: const None(),
    ));

    final failureOrSuccess = await _handleFactsArchiveUseCase.storeId(id);

    failureOrSuccess.fold(
      (failure) {
        final revertedArchive = Set<UniqueId>.from(state.archiveIds)..remove(id);
        emit(state.copyWith(
          archiveIds: revertedArchive,
          failure: Some(failure),
        ));
      },
      (success) {
        unawaited(_analyticsRepo.logFactArchived());
        unawaited(_showAddToArchiveAdUseCase.executeIfEligible());
      },
    );
  }

  Future<void> remove(UniqueId id) async {
    final archive = Set<UniqueId>.from(state.archiveIds)..remove(id);

    emit(state.copyWith(
      archiveIds: archive,
      failure: const None(),
    ));

    final failureOrSuccess = await _handleFactsArchiveUseCase.removeId(id);

    failureOrSuccess.fold((failure) {
      final revertedArchive = Set<UniqueId>.from(state.archiveIds)..add(id);
      emit(state.copyWith(archiveIds: revertedArchive, failure: Some(failure)));
    }, (_) {
      unawaited(_analyticsRepo.logFactUnarchived());
    });
  }

  Future<void> emitPreserveArchivedIds(List<UniqueId> data) async {
    emit(state.copyWith(archiveIds: data.toSet()));
    await _archiveRepo.storeArchiveIdsLocal(data);
  }

  void clearState() {
    emit(FactsArchiveState.initial(const <UniqueId>[]));
  }
}
