import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/facts/domain/entity/daily_facts_bucket.dart';
import 'package:denwee/core/facts/domain/failure/facts_failure.dart';
import 'package:denwee/core/facts/domain/repo/daily_facts_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

part 'daily_facts_state.dart';
part 'daily_facts_cubit.freezed.dart';

@LazySingleton()
class DailyFactsCubit extends Cubit<DailyFactsState> {
  final DailyFactsRepo _repo;

  DailyFactsCubit(this._repo)
    : super(DailyFactsState.initial(_repo.getBucketLocal()));

  Future<void> checkBucket({
    String? languageCode,
    List<String>? interests,
  }) async {
    final localBucket = _repo.getBucketLocal().toNullable();
    final isForcedFetch = localBucket == null || languageCode != null || interests != null;

    if (isForcedFetch) {
      return _fetchRemoteBucket(
        languageCode: languageCode,
        interests: interests,
      );
    }

    final nowDate = DateTime.now();
    final lastBucketDate = localBucket.date;
    final isBucketOutdated = (nowDate.toUtc()).isDayAfter(lastBucketDate);
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

    final bucket = (await _repo.getBucketRemote(
      languageCode: languageCode,
      interests: interests,
    )).getEntries();

    if (bucket.$2?.facts.isNotEmpty == true) {
      await _repo.storeBucketLocal(bucket.$2!);
    }

    emit(state.copyWith(
      isFetching: false,
      bucket: bucket.$2 == null ? state.bucket : optionOf(bucket.$2?.normalized()),
      bucketFailure: optionOf(bucket.$1),
    ));
  }

  void clearState() {
    emit(DailyFactsState.initial(const None()));
  }
}
