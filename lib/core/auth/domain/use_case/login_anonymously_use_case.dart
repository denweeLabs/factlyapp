import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:denwee/core/auth/domain/entity/login_anonymously_result.dart';
import 'package:denwee/core/auth/domain/repo/auth_repo.dart';
import 'package:denwee/core/misc/data/storage/common_storage.dart';
import 'package:denwee/core/network/domain/entity/common_api_failure.dart';
import 'package:denwee/core/notifications/domain/repo/push_notifications_repo.dart';
import 'package:denwee/core/subscriptions/domain/repo/subscriptions_repo.dart';
import 'package:denwee/presentation/bloc/auth/auth_cubit.dart';
import 'package:denwee/presentation/bloc/backgrounds/available_backgrounds_cubit.dart';
import 'package:denwee/presentation/bloc/facts/daily_facts_cubit.dart';
import 'package:denwee/presentation/bloc/profile/profile_cubit.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:denwee/presentation/bloc/user_statistics/user_statistics_cubit.dart';
import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@LazySingleton()
class LoginAnonymouslyUseCase {
  final AuthRepo _authRepo;
  final AuthCubit _authCubit;
  final CommonStorage _commonStorage;
  final PushNotificationsRepo _notificationsRepo;
  final SubscriptionsRepo _subscriptionsRepo;
  final ProfileCubit _profileCubit;
  final UserPreferencesCubit _preferencesCubit;
  final UserStatisticsCubit _statisticsCubit;
  final AvailableBackgroundsCubit _backgroundsCubit;
  final DailyFactsCubit _dailyFactsCubit;

  const LoginAnonymouslyUseCase(
    this._authRepo,
    this._authCubit,
    this._commonStorage,
    this._notificationsRepo,
    this._subscriptionsRepo,
    this._profileCubit,
    this._preferencesCubit,
    this._statisticsCubit,
    this._backgroundsCubit,
    this._dailyFactsCubit,
  );


  /// Executes the anonymous authentication flow.
  ///
  /// Responsibilities:
  /// - Create a temporary anonymous user session via [AuthRepo]
  /// - Persist initial user preferences
  /// - Transition the app into anonymous authentication state
  /// - Initialize required internal services
  /// - Load essential app resources for immediate usage
  ///
  /// Returns either a [CommonApiFailure] or a successful
  /// [LoginAnonymouslyResult].
  /// 
  Future<Either<CommonApiFailure, LoginAnonymouslyResult>> execute({
    required UserPreferences preferences,
  }) async {
    final failureOrSuccess = await _authRepo.signInAnonymously(
      preferences: preferences,
    );
    final successResult = failureOrSuccess.getEntries().$2;
    if (successResult != null) {
      await _submitAppState(successResult);
      await _establishInternalData(successResult);
      await _loadAppResources();
    }
    return failureOrSuccess;
  }


  /// Submits anonymous user data into application state.
  ///
  /// This method hydrates core user-related cubits after
  /// a successful anonymous sign-in.
  ///
  /// Notes:
  /// - Sets authentication state to anonymous
  /// - Preserves profile and preferences locally
  /// 
  Future<void> _submitAppState(LoginAnonymouslyResult result) async {
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

    /// Small delay to establish state before setting to 'anonymous'
    ///
    await Future<void>.delayed(const Duration(milliseconds: 15));

    /// Update state to 'anonymous'
    ///
    unawaited(_authCubit.setAnonymous());
  }


  /// Establishes internal app services after anonymous authentication.
  ///
  /// Responsibilities:
  /// - Finalize onboarding completion
  /// - Enable push notification delivery
  /// - Initialize subscription backend state
  ///
  /// All operations are non-blocking and executed in parallel.
  /// 
  Future<void> _establishInternalData(LoginAnonymouslyResult result) async {
    /// Turn off onboarding state
    /// 
    unawaited(_commonStorage.setIsOnboardingState(false));
    
    /// Ensure the app can receive push notifications
    /// 
    unawaited(_notificationsRepo.retrieveTokenAndSubscribe());

    /// Ensure subscription offerings data is established
    /// 
    unawaited(_subscriptionsRepo.login(userId: result.userId));
  }


  /// Loads post-login app resources for anonymous users.
  ///
  /// Responsibilities:
  /// - Refresh available backgrounds asynchronously
  /// - Fetch daily facts before main UI is displayed
  ///
  /// Daily facts are awaited to ensure content is ready
  /// immediately after sign-in.
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
