part of 'onboarding_configuration_cubit.dart';

@freezed
abstract class OnboardingConfigurationState with _$OnboardingConfigurationState {
  const OnboardingConfigurationState._();
  const factory OnboardingConfigurationState({
    @Default(ConfigurationStep.selectInterests) ConfigurationStep step,
    @Default(false) bool submissionInProgress,
    @Default(None()) Option<Either<CommonApiFailure, Unit>> submissionFailureOrSuccess,
  }) = _OnboardingConfigurationState;

  factory OnboardingConfigurationState.initial() => const OnboardingConfigurationState();

  bool get submissionSuccess => submissionFailureOrSuccess.fold(
        () => false,
        (failureOrSuccess) => failureOrSuccess.isRight(),
      );
}
