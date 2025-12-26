import 'package:denwee/core/ads/domain/repo/ads_repo.dart';
import 'package:denwee/core/ads/domain/use_case/show_add_to_archive_ad_use_case.dart';
import 'package:denwee/core/facts/data/source/remote/facts_remote_source_impl.dart';
import 'package:denwee/core/facts/domain/entity/archived_fact.dart';
import 'package:denwee/core/facts/domain/failure/facts_failure.dart';
import 'package:denwee/core/facts/domain/repo/facts_archive_repo.dart';
import 'package:denwee/core/misc/data/storage/common_storage.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';
import 'package:utils/utils.dart';

part 'facts_archive_state.dart';
part 'facts_archive_cubit.freezed.dart';

@LazySingleton()
class FactsArchiveCubit extends Cubit<FactsArchiveState> {
  final ProfileCubit _profileCubit;
  final FactsArchiveRepo _archiveRepo;
  final CommonStorage _commonStorage;
  final AdsRepo _adsRepo;
  final ShowAddToArchiveAdUseCase _showAddToArchiveAdUseCase;

  FactsArchiveCubit(
    this._profileCubit,
    this._archiveRepo,
    this._commonStorage,
    this._adsRepo,
    this._showAddToArchiveAdUseCase,
  ) : super(FactsArchiveState.initial(_archiveRepo.getArchiveIdsLocal()));

  var _itemsTotalCount = 0;
  var _itemsPage = 0;

  Future<void> checkArchiveIds() async {
    emit(state.copyWith(
      isFetching: true,
      failure: const None(),
    ));
    final result = (await _archiveRepo.getArchiveRemote()).getEntries();
    if (result.$2 != null) await _archiveRepo.storeArchiveIdsLocal(result.$2!);
    emit(state.copyWith(
      isFetching: false,
      archiveIds: result.$2 ?? state.archiveIds,
      failure: optionOf(result.$1),
    ));
  }

  Future<void> fetchArchiveList() async {
    emit(state.copyWith(isFetching: true, failure: const None()));

    _itemsPage = 0;

    final archiveResult = (await _archiveRepo.getArchiveListRemote(
      sortOrder: SortOrder.descending,
      count: AppConstants.config.myArchivePageSize,
      page: _itemsPage,
    )).getEntries();

    if (archiveResult.$1 != null) {
      return emit(state.copyWith(
        failure: Some(archiveResult.$1!),
        isFetching: false,
      ));
    }

    _itemsTotalCount = archiveResult.$2!.total;

    emit(state.copyWith(
      archiveListTotalCount: _itemsTotalCount,
      archiveList: archiveResult.$2!.items,
      isFetching: false,
    ));
  }

  Future<void> fetchMoreArchiveList() async {
    if (state.isFetchingMore) return;
    
    if (state.archiveList.length < _itemsTotalCount) {
      emit(state.copyWith(isFetchingMore: true));

      final newPage = _itemsPage + 1;
      final archiveResult = (await _archiveRepo.getArchiveListRemote(
        sortOrder: SortOrder.descending,
        count: AppConstants.config.myArchivePageSize,
        page: newPage,
      )).getEntries();

      if (archiveResult.$1 != null) {
        return emit(state.copyWith(
          failure: Some(archiveResult.$1!),
          isFetchingMore: false,
        ));
      }

      _itemsPage = newPage;
      _itemsTotalCount = archiveResult.$2!.total;

      final newArchiveList = [...state.archiveList, ...archiveResult.$2!.items];

      emit(state.copyWith(
        archiveListTotalCount: _itemsTotalCount,
        archiveList: newArchiveList,
        isFetchingMore: false,
      ));
    }
  }

  Future<void> add(UniqueId id) async {
    final archive = [...state.archiveIds, id];
    emit(state.copyWith(
      archiveIds: archive,
      failure: const None(),
    ));
    final result = (await _archiveRepo.storeFactRemote(id)).getEntries();
    if (result.$1 != null) {
      final revertedArchive = [...state.archiveIds]..removeWhere((e) => e == id);
      emit(state.copyWith(
        archiveIds: revertedArchive,
        failure: some(result.$1!),
      ));
    } else {
      await _archiveRepo.storeFactLocal(id);
      await _checkAdDisplay();
    }
  }

  Future<void> remove(UniqueId id) async {
    final archive = [...state.archiveIds]..removeWhere((e) => e == id);
    emit(state.copyWith(
      archiveIds: archive,
      failure: const None(),
    ));
    final result = (await _archiveRepo.deleteFactRemote(id)).getEntries();
    if (result.$1 != null) {
      final revertedArchive = [...state.archiveIds, id];
      emit(state.copyWith(
        archiveIds: revertedArchive,
        failure: some(result.$1!),
      ));
    } else {
      await _archiveRepo.deleteFactLocal(id);
    }
  }

  void clearState() {
    emit(FactsArchiveState.initial(const <UniqueId>[]));
  }

  Future<void> _checkAdDisplay() async {
    final currentCounter = await _commonStorage.increaseAddToArchiveCounter();

    // wait for the counter and check if probability to show an ad has passed
    if (currentCounter < AppConstants.config.showArchiveAdOnCountOf) return;
    await _commonStorage.resetAddToArchiveCounter();
    final isChance = pseudoProbabilityOf(
      AppConstants.config.showArchiveAdProbabilityPercent,
    );
    if (!isChance) return;

    // load an ad
    final ad = (await _adsRepo.getOrLoadAddToArchiveAd()).getEntries();

    // if loaded -> show the ad
    if (ad.$2 != null) {
      final profileId = _profileCubit.state.profile.toNullable()!.id;
      await _showAddToArchiveAdUseCase.execute(
        ad: ad.$2!,
        profileId: profileId,
      );
    }
  }
}
