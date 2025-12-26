part of 'select_interests_cubit.dart';

@freezed
abstract class SelectInterestsState with _$SelectInterestsState {
  const SelectInterestsState._();
  const factory SelectInterestsState({
    @Default([]) List<UserInterest> selectedInterests,
    @Default(false) bool validate,
  }) = _SelectInterestsState;

  factory SelectInterestsState.initial({List<UserInterest>? initialInterests}) {
    return SelectInterestsState(
      selectedInterests: initialInterests ?? const <UserInterest>[],
    );
  }

  bool get isValidationError {
    return validate && selectedInterests.isEmpty;
  }
}
