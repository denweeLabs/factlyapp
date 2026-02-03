import 'package:denwee/core/auth/domain/repo/auth_repo.dart';
import 'package:denwee/core/misc/data/storage/common_storage.dart';
import 'package:denwee/core/network/domain/failure/common_api_failure.dart';
import 'package:denwee/core/subscriptions/domain/repo/subscriptions_repo.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:denwee/core/ui/bloc/backgrounds/available_backgrounds_cubit.dart';
import 'package:denwee/core/ui/bloc/facts_cubit/daily_facts_cubit.dart';
import 'package:denwee/core/ui/bloc/notifications_cubit/notifications_cubit.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
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
  final AuthRepo _authRepo;
  final CommonStorage _commonStorage;
  final UserPreferencesCubit _userPreferencesCubit;
  final NotificationsCubit _notificationsCubit;
  final ProfileCubit _profileCubit;
  final AuthCubit _authCubit;
  final DailyFactsCubit _dailyFactsCubit;
  final AvailableBackgroundsCubit _backgroundsCubit;
  final SubscriptionsRepo _subscriptionsRepo;

  OnboardingConfigurationCubit(
    this._authRepo,
    this._commonStorage,
    this._userPreferencesCubit,
    this._notificationsCubit,
    this._authCubit,
    this._profileCubit,
    this._dailyFactsCubit,
    this._backgroundsCubit,
    this._subscriptionsRepo,
  ) : super(OnboardingConfigurationState.initial());

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
    final anonymousLoginFailureOrSuccess = await _authRepo.signInAnonymously(preferences: preferences);
    final anonymousResult = anonymousLoginFailureOrSuccess.toOption().fold(() => null, (data) => data);
    if (anonymousResult != null) {
      await _commonStorage.setIsOnboardingState(false);
      await _notificationsCubit.forceUpdateToken();
      await _profileCubit.emitPreserveProfile(anonymousResult.profile);
      await _userPreferencesCubit.emitPreservePreferences(anonymousResult.preferences, remotePreserve: false);
      await _authCubit.setAnonymous();
      await _dailyFactsCubit.checkBucket();
      _backgroundsCubit.checkBackgrounds();
      _subscriptionsRepo.login();
    }
    emit(state.copyWith(
      submissionInProgress: false,
      submissionFailureOrSuccess: Some(anonymousLoginFailureOrSuccess.map((_) => unit)),
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
