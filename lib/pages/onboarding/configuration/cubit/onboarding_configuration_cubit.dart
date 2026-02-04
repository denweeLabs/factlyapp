import 'package:denwee/core/auth/domain/use_case/login_anonymously_use_case.dart';
import 'package:denwee/core/network/domain/failure/common_api_failure.dart';
import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:dartz/dartz.dart';
import 'package:denwee/pages/onboarding/configuration/onboarding_configuration_step.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'onboarding_configuration_state.dart';
part 'onboarding_configuration_cubit.freezed.dart';

@Injectable()
class OnboardingConfigurationCubit extends Cubit<OnboardingConfigurationState> {
  final LoginAnonymouslyUseCase _loginAnonymouslyUseCase;

  OnboardingConfigurationCubit(this._loginAnonymouslyUseCase)
    : super(OnboardingConfigurationState.initial());

  final navigatorKey = GlobalKey<NavigatorState>();
  BuildContext get context => navigatorKey.currentState!.context;

  void setStep(ConfigurationStep step) {
    emit(state.copyWith(step: step));
  }

  Future<void> submitData(
    UserPreferences preferences, {
    bool isSubmissionVisibilityForced = false,
  }) async {
    emit(state.copyWith(
      submissionInProgress: true,
      isSubmissionVisibilityForced: isSubmissionVisibilityForced,
      submissionFailureOrSuccess: const None(),
    ));
    
    final failureOrSuccess = await _loginAnonymouslyUseCase.execute(
      preferences: preferences,
    );
    
    emit(state.copyWith(
      submissionInProgress: false,
      submissionFailureOrSuccess: Some(failureOrSuccess.map((_) => unit)),
    ));
  }

  void forceSubmissionVisibility() {
    emit(state.copyWith(isSubmissionVisibilityForced: true));
  }

  @override
  void emit(OnboardingConfigurationState state) {
    if (isClosed) return;
    super.emit(state);
  }
}
