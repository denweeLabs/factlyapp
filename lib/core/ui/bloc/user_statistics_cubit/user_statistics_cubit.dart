import 'package:denwee/core/statistics/domain/entity/user_statistics.dart';
import 'package:denwee/core/statistics/domain/failure/statistics_failure.dart';
import 'package:denwee/core/statistics/domain/repo/statistics_repo.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

part 'user_statistics_state.dart';
part 'user_statistics_cubit.freezed.dart';

@LazySingleton()
class UserStatisticsCubit extends Cubit<UserStatisticsState> {
  final StatisticsRepo _statisticsRepo;

  UserStatisticsCubit(this._statisticsRepo)
      : super(_initialState(_statisticsRepo.getStatisticsLocal()));

  static UserStatisticsState _initialState(Option<UserStatistics> localData) {
    return UserStatisticsState(
      statistics: localData.fold(UserStatistics.initial, (data) => data),
    );
  }

  Future<void> checkStatistics() async {
    emit(state.copyWith(
      isFetching: true,
      failure: const None(),
    ));
    final statistics = (await _statisticsRepo.getStatisticsRemote()).getEntries();
    if (statistics.$2 != null) {
      await _statisticsRepo.storeStatisticsLocal(statistics.$2!);
    }
    emit(state.copyWith(
      isFetching: false,
      failure: optionOf(statistics.$1),
      statistics: statistics.$2 ?? state.statistics,
    ));
    await Future<void>.delayed(const Duration(milliseconds: 25));
    emit(state.copyWith(isInitiallyLoaded: true));
  }

  Future<void> updateStarsBalance(int value) async {
    final newStats = state.statistics.copyWith(stars: value);
    emit(state.copyWith(statistics: newStats));
    await _statisticsRepo.storeStatisticsLocal(newStats);
  }

  Future<void> emitPreserveStatistics(UserStatistics data) async {
    emit(state.copyWith(statistics: data));
    await _statisticsRepo.storeStatisticsLocal(data);
  }

  void clearState() {
    emit(UserStatisticsState.initial());
  }
}
