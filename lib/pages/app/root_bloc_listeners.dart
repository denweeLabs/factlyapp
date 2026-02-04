import 'package:denwee/core/backgrounds/domain/failure/background_failure.dart';
import 'package:denwee/core/backgrounds/domain/use_case/on_background_applied_use_case.dart';
import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/facts/domain/failure/facts_failure.dart';
import 'package:denwee/core/profile/domain/failure/profile_failure.dart';
import 'package:denwee/core/statistics/domain/failure/statistics_failure.dart';
import 'package:denwee/core/subscriptions/domain/failure/subscriptions_failure.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:denwee/core/ui/bloc/backgrounds/active_background_cubit.dart';
import 'package:denwee/core/ui/bloc/backgrounds/available_backgrounds_cubit.dart';
import 'package:denwee/core/ui/bloc/facts_cubit/daily_facts_cubit.dart';
import 'package:denwee/core/ui/bloc/facts_cubit/facts_archive_cubit.dart';
import 'package:denwee/core/ui/bloc/notifications_cubit/notifications_cubit.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:denwee/core/ui/bloc/subscriptions_cubit/subscription_offerings_cubit.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/bloc/user_statistics_cubit/user_statistics_cubit.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/core/user_preferences/domain/failure/preferences_failure.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/pages/app/root_listeners_handlers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class RootBlocListeners extends StatefulWidget {
  const RootBlocListeners({super.key, required this.child});

  final Widget child;

  @override
  State<RootBlocListeners> createState() => _RootBlocListenersState();
}

class _RootBlocListenersState extends State<RootBlocListeners>
    with WidgetsBindingObserver, RootBlocListenersHandlers {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) processAppResume();
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listenWhen: _authListener,
          listener: (_, _) {},
        ),
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: _profileListener,
          listener: (_, _) {},
        ),
        BlocListener<UserStatisticsCubit, UserStatisticsState>(
          listenWhen: _userStatisticsListener,
          listener: (_, _) {},
        ),
        BlocListener<UserPreferencesCubit, UserPreferencesState>(
          listenWhen: _userPreferencesListener,
          listener: (_, _) {},
        ),
        BlocListener<FactsArchiveCubit, FactsArchiveState>(
          listenWhen: _archiveListener,
          listener: (_, _) {},
        ),
        BlocListener<SubscriptionOfferingsCubit, SubscriptionOfferingsState>(
          listenWhen: _subscriptionOfferingsListener,
          listener: (_, _) {},
        ),
        BlocListener<NotificationsCubit, NotificationsState>(
          listenWhen: _notificationsListener,
          listener: (_, _) {},
        ),
        BlocListener<AvailableBackgroundsCubit, AvailableBackgroundsState>(
          listenWhen: _availableBackgroundsListener,
          listener: (_, _) {},
        ),
        BlocListener<ActiveBackgroundCubit, ActiveBackgroundState>(
          listenWhen: _activeBackgroundListener,
          listener: (_, _) {},
        ),
      ],
      child: widget.child,
    );
  }

  bool _authListener(AuthState p, AuthState c) {
    final isLoggedOut = p.isAuthenticated && c.isUnauthenticated;
    if (isLoggedOut) processLoggedOutUser();
    return false;
  }

  bool _profileListener(ProfileState p, ProfileState c) {
    final isFailure = p.failure != c.failure && c.failure.isSome();

    if (isFailure) {
      final failure = c.failure.toNullable()!;
      processErrorSnackbar(
        messageProvider: failure.errorMessage,
        isInsufficientPermissions: failure.isInsufficientPermissions,
      );
    }

    return false;
  }

  bool _userStatisticsListener(UserStatisticsState p, UserStatisticsState c) {
    final isFailure = p.failure != c.failure && c.failure.isSome();

    if (isFailure) {
      final failure = c.failure.toNullable()!;
      processErrorSnackbar(
        messageProvider: failure.errorMessage,
        isInsufficientPermissions: failure.isInsufficientPermissions,
      );
    }

    return false;
  }

  bool _userPreferencesListener(UserPreferencesState p, UserPreferencesState c) {
    final isFailure = p.failure != c.failure && c.failure.isSome();

    if (isFailure) {
      final failure = c.failure.toNullable()!;
      processErrorSnackbar(
        messageProvider: failure.errorMessage,
        isInsufficientPermissions: failure.isInsufficientPermissions,
      );
    }
    
    final oldLanguage = p.preferences.language.languageCode;
    final newLanguage = c.preferences.language.languageCode;
    
    final languageChanged = oldLanguage != newLanguage;
    final interestsChanged = !const DeepCollectionEquality.unordered().equals(
      p.preferences.interests,
      c.preferences.interests,
    );

    if (languageChanged) {
      context.setLocale(Locale(newLanguage));
      Intl.defaultLocale = newLanguage;
    }

    if (!getIt<AuthCubit>().state.isUnauthenticated && (languageChanged || interestsChanged)) {
      getIt<DailyFactsCubit>().checkBucket(
        languageCode: newLanguage,
        interests: c.preferences.interests.ids,
      );
    }

    return false;
  }

  bool _archiveListener(FactsArchiveState p, FactsArchiveState c) {
    final isFailure = p.failure != c.failure && c.failure.isSome();

    if (isFailure) {
      final failure = c.failure.toNullable()!;
      processErrorSnackbar(
        messageProvider: failure.errorMessage,
        isInsufficientPermissions: failure.isInsufficientPermissions,
      );
    }

    return false;
  }

  bool _subscriptionOfferingsListener(SubscriptionOfferingsState p, SubscriptionOfferingsState c) {
    final isFailure = p.failure != c.failure && c.failure.isSome();
    final isSuccessPackagePurchase = p.purchasedPackage.isNone() && c.purchasedPackage.isSome();
    final isSuccessPurchaseRestoration = p.isPurchaseRestoring && !c.isPurchaseRestoring && c.isPurchaseRestoreSuccess;

    if (isFailure) {
      final failure = c.failure.toNullable()!;
      processErrorSnackbar(
        messageProvider: failure.errorMessage,
        isInsufficientPermissions: failure.isInsufficientPermissions,
      );
    }

    /// check subscription status form backend when purchase was made
    if (isSuccessPackagePurchase) {
      processPurchasedSubscriptionPackage(c.purchasedPackage.toNullable()!);
    }

    /// check subscription status form backend when purchase successfully restored
    if (isSuccessPurchaseRestoration) {
      processRestoredSubscription();
    }

    return false;
  }

  bool _notificationsListener(NotificationsState p, NotificationsState c) {
    if (p.notification != c.notification && c.notification.isSome()) {
      final notificationData = c.notification.toNullable()!;

      if (c.showSnackbar) {
        AppDialogs.showNotificationSnackbar(notificationData);
      } else {
        notificationData.tryLaunchLink();
      }
    }

    return false;
  }

  bool _availableBackgroundsListener(
    AvailableBackgroundsState p,
    AvailableBackgroundsState c,
  ) {
    final isFailure = p.failure != c.failure && c.failure.isSome();

    if (isFailure) {
      final failure = c.failure.toNullable()!;
      processErrorSnackbar(
        messageProvider: failure.errorMessage,
        isInsufficientPermissions: failure.isInsufficientPermissions,
      );
    }

    return false;
  }

  bool _activeBackgroundListener(
    ActiveBackgroundState p,
    ActiveBackgroundState c,
  ) {
    final isFailure = p.failure != c.failure && c.failure.isSome();

    if (isFailure) {
      final failure = c.failure.toNullable()!;
      processErrorSnackbar(
        messageProvider: failure.errorMessage,
        isInsufficientPermissions: failure.isInsufficientPermissions,
      );
    }

    if (p.isApplying && !c.isApplying && c.isApplied) {
      c.mapOrNull(
        applied: (data) {
          getIt<OnBackgroundAppliedUseCase>().execute(data.asset);
        },
      );
    }

    return false;
  }
}
