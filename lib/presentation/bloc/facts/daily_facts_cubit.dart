import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/facts/domain/entity/daily_facts_bucket.dart';
import 'package:denwee/core/facts/domain/entity/facts_failure.dart';
import 'package:denwee/core/facts/domain/repo/daily_facts_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:denwee/core/facts/domain/use_case/get_daily_facts_bucket_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

part 'daily_facts_state.dart';
part 'daily_facts_cubit.freezed.dart';

@LazySingleton()
class DailyFactsCubit extends Cubit<DailyFactsState> {
  final DailyFactsRepo _repo;
  final GetDailyFactsBucketUseCase _getDailyFactsBucketUseCase;

  DailyFactsCubit(this._repo, this._getDailyFactsBucketUseCase)
    : super(DailyFactsState.initial(_repo.getBucketLocal()));

  Future<void> checkBucket({
    String? languageCode,
    List<String>? interests,
  }) async {
    final localBucket = _repo.getBucketLocal().toNullable();
    final lastFetchDay = _repo.getBucketFetchDayLocal().toNullable();
    final isForcedFetch = localBucket == null || lastFetchDay == null || languageCode != null || interests != null;

    if (isForcedFetch) {
      return _fetchRemoteBucket(
        languageCode: languageCode,
        interests: interests,
      );
    }

    final isBucketOutdated = DateTime.now().isDayAfter(lastFetchDay);
    if (isBucketOutdated) {
      await _fetchRemoteBucket();
    }
  }

  Future<void> _fetchRemoteBucket({
    String? languageCode,
    List<String>? interests,
  }) async {
    if (state.isFetching) return;

    emit(state.copyWith(isFetching: true, bucketFailure: const None()));

    final failureOrSuccess = await _getDailyFactsBucketUseCase.execute(
      languageCode: languageCode,
      interests: interests,
    );

    return emit(
      failureOrSuccess.fold(
        (failure) => state.copyWith(isFetching: false, bucketFailure: Some(failure)),
        (success) => state.copyWith(isFetching: false, bucket: Some(success)),
      ),
    );
  }

  void clearState() {
    emit(DailyFactsState.initial(const None()));
  }
}
