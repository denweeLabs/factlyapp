// ignore_for_file: use_build_context_synchronously

import 'package:denwee/presentation/bloc/connectivity/connectivity_cubit.dart';
import 'package:denwee/presentation/bloc/permissions/permissions_cubit.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:denwee/presentation/shared/router/root_router.dart';
import 'package:denwee/presentation/shared/utils/dialogs_util.dart';
import 'package:denwee/presentation/shared/utils/haptic_util.dart';
import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/bloc/onboarding/onboarding_configuration_cubit.dart';
import 'package:denwee/presentation/page/onboarding/configuration/onboarding_configuration_step.dart';
import 'package:denwee/presentation/bloc/onboarding/select_interests_cubit.dart';
import 'package:denwee/presentation/bloc/onboarding/select_notification_time_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utils/utils.dart';

mixin OnboardingConfigurationHandlers {
  // Step 1: Select interests
  void validateSelectInterests(BuildContext context) {
    final isValidState = context.read<SelectInterestsCubit>().state.isValid;
    if (isValidState) {
      context
          .read<OnboardingConfigurationCubit>()
          .navigatorKey
          .currentState
          ?.pushNamed(ConfigurationStep.selectNotificationTime.route);
    } else {
      context.read<SelectInterestsCubit>().validateInterests();
      HapticUtil.medium();
    }
  }

  // Step 2: Select notification time
  void validateSelectNotificationTime(BuildContext context) async {
    await getIt<PermissionsCubit>().forceCheckNotifications(request: true);
    context
        .read<OnboardingConfigurationCubit>()
        .navigatorKey
        .currentState
        ?.pushNamed(ConfigurationStep.selectThemeColoration.route);
  }

  // Step 3: Select theme coloration
  void validateThemeColoration(BuildContext context) async {
    submitAnonymousData(
      context: context,
      isSubmissionVisibilityForced: false,
    );
    context
        .read<OnboardingConfigurationCubit>()
        .navigatorKey
        .currentState
        ?.pushNamed(ConfigurationStep.valuePrimer.route);
  }

  // Step 4: Value primer
  void validateValuePrimer(BuildContext context) async {
    // current submission state
    final state = context.read<OnboardingConfigurationCubit>().state;

    // if success anonymous login
    if (state.submissionSuccess) {
      return completeOnboarding(context);
    }
    
    // if anonymous login is still in progress
    // raise submission visibility flag
    if (state.submissionInProgress) {
      return context
          .read<OnboardingConfigurationCubit>()
          .forceSubmissionVisibility();
    }

    // otherwise retry anonymous login
    // with submission visibility flag
    return submitAnonymousData(
      context: context,
      isSubmissionVisibilityForced: true,
    );
  }

  // Submission (User sign in anonymously)
  void submitAnonymousData({
    required BuildContext context,
    required bool isSubmissionVisibilityForced,
  }) {
    if (!context.read<ConnectivityCubit>().state.isNetworkAccess) {
      return AppDialogs.showNoConnectionSnackbar();
    }

    final selectedInterests = context
        .read<SelectInterestsCubit>()
        .state
        .selectedInterests;
    final selectedNotification = context
        .read<SelectNotificationTimeCubit>()
        .state
        .notificationPreferences;
    final selectedTheme = context
        .read<UserPreferencesCubit>()
        .state
        .preferences
        .theme;
    final selectedLanguage = context.locale;
    
    final preferences = UserPreferences.fromOnboarding(
      selectedInterests: selectedInterests,
      notificationPreferences: selectedNotification,
      selectedTheme: selectedTheme,
      selectedLocale: selectedLanguage
    );

    context.read<OnboardingConfigurationCubit>().submitData(
      preferences,
      isSubmissionVisibilityForced: isSubmissionVisibilityForced,
    );
  }

  // On submission success (User signed in anonymously)
  void completeOnboarding(BuildContext context) async {
    context.read<UserPreferencesCubit>().setFromOnboarding(
      interests: context.read<SelectInterestsCubit>().state.selectedInterests,
      notificationTime: context.read<SelectNotificationTimeCubit>().state.time,
    );

    final isVisibilityForced = context
        .read<OnboardingConfigurationCubit>()
        .state
        .isSubmissionVisibilityForced;

    await Future<void>.delayed(
      Duration(milliseconds: isVisibilityForced ? 400 : 25),
    );

    context.restorablePushReplacementNamedArgs(
      Routes.homeCircleReveal,
      rootNavigator: true,
    );
  }
}
