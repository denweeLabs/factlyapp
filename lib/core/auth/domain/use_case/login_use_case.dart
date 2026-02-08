import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/login_result.dart';
import 'package:denwee/core/auth/domain/entity/password.dart';
import 'package:denwee/core/auth/domain/entity/login_failure.dart';
import 'package:denwee/core/auth/domain/repo/auth_repo.dart';
import 'package:denwee/core/misc/data/storage/common_storage.dart';
import 'package:denwee/core/notifications/domain/repo/push_notifications_repo.dart';
import 'package:denwee/core/analytics/domain/repo/analytics_repo.dart';
import 'package:denwee/core/subscriptions/domain/repo/subscriptions_repo.dart';
import 'package:denwee/presentation/bloc/auth/auth_cubit.dart';
import 'package:denwee/presentation/bloc/backgrounds/available_backgrounds_cubit.dart';
import 'package:denwee/presentation/bloc/facts/daily_facts_cubit.dart';
import 'package:denwee/presentation/bloc/facts/facts_archive_cubit.dart';
import 'package:denwee/presentation/bloc/profile/profile_cubit.dart';
import 'package:denwee/presentation/bloc/subscriptions/user_subscription_cubit.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:denwee/presentation/bloc/user_statistics/user_statistics_cubit.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@LazySingleton()
class LoginUseCase {
  final AuthRepo _authRepo;
  final AuthCubit _authCubit;
  final CommonStorage _commonStorage;
  final PushNotificationsRepo _notificationsRepo;
  final SubscriptionsRepo _subscriptionsRepo;
  final AnalyticsRepo _analyticsRepo;
  final UserPreferencesCubit _preferencesCubit;
  final UserStatisticsCubit _statisticsCubit;
  final UserSubscriptionCubit _subscriptionCubit;
  final ProfileCubit _profileCubit;
  final FactsArchiveCubit _factsArchiveCubit;
  final AvailableBackgroundsCubit _backgroundsCubit;
  final DailyFactsCubit _dailyFactsCubit;

  const LoginUseCase(
    this._authRepo,
    this._authCubit,
    this._commonStorage,
    this._notificationsRepo,
    this._subscriptionsRepo,
    this._analyticsRepo,
    this._preferencesCubit,
    this._statisticsCubit,
    this._subscriptionCubit,
    this._profileCubit,
    this._factsArchiveCubit,
    this._backgroundsCubit,
    this._dailyFactsCubit,
  );


  /// Executes the full login flow with email and password.
  ///
  /// What it does:
  /// - Authenticate the user via [AuthRepo]
  /// - On success, hydrate in-memory app state with user-related data
  /// - Establish internal services and background processes
  /// - Load essential app resources required after login
  ///
  Future<Either<LoginFailure, LoginResult>> withEmailAndPassword({
    required Email email,
    required Password password,
  }) async {
    final failureOrSuccess = await _authRepo.login(
      email: email,
      password: password,
    );
    final successResult = failureOrSuccess.getEntries().$2;
    if (successResult != null) {
      await _submitAppState(successResult);
      await _establishInternalData(successResult);
      await _loadAppResources();
    }
    return failureOrSuccess;
  }


  /// Executes the full login flow with Google.
  ///
  /// What it does:
  /// - Authenticate the user via [AuthRepo]
  /// - On success, hydrate in-memory app state with user-related data
  /// - Establish internal services and background processes
  /// - Load essential app resources required after login
  ///
  Future<Either<LoginFailure, LoginResult>> withGoogle() async {
    final failureOrSuccess = await _authRepo.loginWithGoogle();
    final successResult = failureOrSuccess.getEntries().$2;
    if (successResult != null) {
      await _submitAppState(successResult);
      await _establishInternalData(successResult);
      await _loadAppResources();
    }
    return failureOrSuccess;
  }


  /// Executes the full login flow with Apple.
  ///
  /// What it does:
  /// - Authenticate the user via [AuthRepo]
  /// - On success, hydrate in-memory app state with user-related data
  /// - Establish internal services and background processes
  /// - Load essential app resources required after login
  ///
  Future<Either<LoginFailure, LoginResult>> withApple() async {
    final failureOrSuccess = await _authRepo.loginWithApple();
    final successResult = failureOrSuccess.getEntries().$2;
    if (successResult != null) {
      await _submitAppState(successResult);
      await _establishInternalData(successResult);
      await _loadAppResources();
    }
    return failureOrSuccess;
  }


  /// Submits authenticated user data into application state.
  ///
  /// This method updates all user-scoped cubits with data received
  /// from the backend after a successful login.
  ///
  /// Notes:
  /// - Uses `unawaited` calls to avoid blocking the login flow
  /// - Preserves data locally
  /// 
  Future<void> _submitAppState(LoginResult result) async {
    /// Update and store user profile
    /// 
    unawaited(_profileCubit.emitPreserveProfile(result.profile));

    /// Update and store user statistics
    /// 
    unawaited(_statisticsCubit.emitPreserveStatistics(result.statistics));

    /// Update and store user preferences
    /// 
    unawaited(_preferencesCubit.emitPreservePreferences(
      result.preferences,
      remotePreserve: false,
    ));

    /// Update and store user active subscription (if present)
    /// 
    final activeSubscription = result.activeSubscription.toNullable();
    if (activeSubscription != null) {
      unawaited(_subscriptionCubit.emitPreserveSubscription(activeSubscription));
    }

    /// Update and store fact ids that user has added to archive
    /// 
    unawaited(_factsArchiveCubit.emitPreserveArchivedIds(result.archivedFactIds));

    /// Small delay to establish state before setting to 'authenticated'
    ///
    await Future<void>.delayed(const Duration(milliseconds: 15));

    /// Update state to 'authenticated'
    ///
    unawaited(_authCubit.setAuthenticated());
  }


  /// Establishes internal app services after successful authentication.
  ///
  /// Responsibilities:
  /// - Finalize onboarding state
  /// - Ensure push notification subscription is active
  /// - Initialize subscription-related backend state
  /// - Log analytics event for successful login
  ///
  /// All operations are non-blocking and executed in parallel.
  /// 
  Future<void> _establishInternalData(LoginResult result) async {
    /// Turn off onboarding state
    /// 
    unawaited(_commonStorage.setIsOnboardingState(false));
    
    /// Ensure the app can receive push notifications
    /// 
    unawaited(_notificationsRepo.retrieveTokenAndSubscribe());

    /// Ensure subscription offerings data is established
    /// 
    unawaited(_subscriptionsRepo.login(userId: result.userId));

    /// Log analytics event for login
    /// 
    unawaited(_analyticsRepo.logLogin());
  }


  /// Loads app resources required for immediate user interaction.
  ///
  /// Responsibilities:
  /// - Check available backgrounds
  /// - Fetch daily facts before rendering the facts page (HomePage)
  ///
  /// Daily facts are awaited to ensure content is ready
  /// as soon as the user enters the app.
  /// 
  Future<void> _loadAppResources() async {
    /// Fetch latest available backgrounds
    /// 
    unawaited(_backgroundsCubit.checkBackgrounds());
    
    /// Fetch latest daily facts. Awaiting to ensure facts displayed right away after login
    /// 
    await _dailyFactsCubit.checkBucket();
  }
}
