part of 'daily_facts_cubit.dart';

@freezed
abstract class DailyFactsState with _$DailyFactsState {
  const DailyFactsState._();
  const factory DailyFactsState({
    @Default(false) bool isFetching,
    @Default(None()) Option<DailyFactsBucket> bucket,
    @Default(None()) Option<FactsFailure> bucketFailure,
  }) = _DailyFactsState;

  factory DailyFactsState.initial(Option<DailyFactsBucket> initialBucket) {
    return DailyFactsState(bucket: initialBucket);
  }

  bool get isEmptyBucket =>
      bucket.fold(() => true, (bucket) => bucket.facts.isEmpty);

  List<DailyFact> get facts =>
      bucket.fold(() => const <DailyFact>[], (bucket) => bucket.facts);
}
