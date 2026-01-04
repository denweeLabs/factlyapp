import 'package:denwee/core/auth/domain/repo/auth_repo.dart';
import 'package:denwee/core/misc/data/storage/common_storage.dart';
import 'package:denwee/core/network/domain/failure/common_api_failure.dart';
import 'package:denwee/core/subscriptions/domain/repo/subscriptions_repo.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:denwee/core/ui/bloc/facts_cubit/daily_facts_cubit.dart';
import 'package:denwee/core/ui/bloc/notifications_cubit/notifications_cubit.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:denwee/pages/onboarding/configuration/onboarding_configuration_routes.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'onboarding_configuration_state.dart';
part 'onboarding_configuration_cubit.freezed.dart';

enum ConfigurationStep {
  selectInterests,
  selectThemeColoration;

  factory ConfigurationStep.fromRouteSettings(
      RouteSettings? settings) {
    switch (settings?.name) {
      case OnboardingConfigurationRoutes.selectInterests: return ConfigurationStep.selectInterests;
      case OnboardingConfigurationRoutes.selectThemeColoration: return ConfigurationStep.selectThemeColoration;
      default: return ConfigurationStep.selectInterests;
    }
  }
}

extension ConfigurationStepX on ConfigurationStep {
  String get route {
    switch (this) {
      case ConfigurationStep.selectInterests: return OnboardingConfigurationRoutes.selectInterests;
      case ConfigurationStep.selectThemeColoration: return OnboardingConfigurationRoutes.selectThemeColoration;
    }
  }

  bool get showBackButton {
    switch (this) {
      case ConfigurationStep.selectInterests: return false;
      case ConfigurationStep.selectThemeColoration: return true;
    }
  }

  List<Color>? bottomActionButtonBackgroundColor(BuildContext context) {
    switch (this) {
      case ConfigurationStep.selectInterests: return null;
      case ConfigurationStep.selectThemeColoration: return [context.lightPrimaryContainer, context.lightPrimaryContainer];
    }
  }

  Color bottomActionButtonTextColor(BuildContext context) {
    switch (this) {
      case ConfigurationStep.selectInterests: return context.lightTextColor;
      case ConfigurationStep.selectThemeColoration: return context.theme.colorScheme.primary;
    }
  }

  Color? bottomActionButtonShadowColor(BuildContext context) {
    switch (this) {
      case ConfigurationStep.selectInterests: return null;
      case ConfigurationStep.selectThemeColoration: return Colors.black26;
    }
  }

  String bottomActionButtonText(BuildContext context) {
    switch (this) {
      case ConfigurationStep.selectInterests: return context.tr(LocaleKeys.onboarding_select_interests_cta);
      case ConfigurationStep.selectThemeColoration: return context.tr(LocaleKeys.onboarding_select_theme_colorations_cta);
    }
  }

  Color haveAccountTextColor(BuildContext context) {
    switch (this) {
      case ConfigurationStep.selectInterests: return context.textColor.withValues(alpha: 0.2);
      case ConfigurationStep.selectThemeColoration: return context.lightTextColorSecondary;
    }
  }
}

@Injectable()
class OnboardingConfigurationCubit extends Cubit<OnboardingConfigurationState> {
  final AuthRepo _authRepo;
  final CommonStorage _commonStorage;
  final UserPreferencesCubit _userPreferencesCubit;
  final NotificationsCubit _notificationsCubit;
  final ProfileCubit _profileCubit;
  final AuthCubit _authCubit;
  final DailyFactsCubit _dailyFactsCubit;
  final SubscriptionsRepo _subscriptionsRepo;

  OnboardingConfigurationCubit(
    this._authRepo,
    this._commonStorage,
    this._userPreferencesCubit,
    this._notificationsCubit,
    this._authCubit,
    this._profileCubit,
    this._dailyFactsCubit,
    this._subscriptionsRepo,
  ) : super(OnboardingConfigurationState.initial());

  final navigatorKey = GlobalKey<NavigatorState>();
  BuildContext get context => navigatorKey.currentState!.context;

  void setStep(ConfigurationStep step) {
    emit(state.copyWith(step: step));
  }

  Future<void> submitData(UserPreferences preferences) async {
    emit(state.copyWith(
      submissionInProgress: true,
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
      _subscriptionsRepo.login();
    }
    emit(state.copyWith(
      submissionInProgress: false,
      submissionFailureOrSuccess: Some(anonymousLoginFailureOrSuccess.map((_) => unit)),
    ));
  }

  @override
  void emit(OnboardingConfigurationState state) {
    if (isClosed) return;
    super.emit(state);
  }
}
