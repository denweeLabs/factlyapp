part of 'user_statistics_cubit.dart';

@freezed
abstract class UserStatisticsState with _$UserStatisticsState {
  const UserStatisticsState._();
  const factory UserStatisticsState({
    required UserStatistics statistics,
    @Default(false) bool isFetching,
    @Default(false) bool isInitiallyLoaded,
    @Default(None()) Option<StatisticsFailure> failure,
  }) = _UserStatisticsState;

  factory UserStatisticsState.initial() {
    return UserStatisticsState(
      statistics: UserStatistics.initial(),
    );
  }

  bool get possible2UseFreeExplanation =>
      statistics.stars >= AppConstants.config.factExplanationStarsCost;
}
