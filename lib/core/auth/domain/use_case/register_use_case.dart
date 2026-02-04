import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/password.dart';
import 'package:denwee/core/auth/domain/entity/register_result.dart';
import 'package:denwee/core/auth/domain/failure/register_failure.dart';
import 'package:denwee/core/auth/domain/repo/auth_repo.dart';
import 'package:denwee/core/misc/data/storage/common_storage.dart';
import 'package:denwee/core/notifications/domain/repo/push_notifications_repo.dart';
import 'package:denwee/core/statistics/domain/repo/analytics_repo.dart';
import 'package:denwee/core/subscriptions/domain/repo/subscriptions_repo.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@LazySingleton()
class RegisterUseCase {
  final AuthRepo _authRepo;
  final AuthCubit _authCubit;
  final CommonStorage _commonStorage;
  final PushNotificationsRepo _notificationsRepo;
  final SubscriptionsRepo _subscriptionsRepo;
  final AnalyticsRepo _analyticsRepo;
  final UserPreferencesCubit _preferencesCubit;
  final ProfileCubit _profileCubit;

  const RegisterUseCase(
    this._authRepo,
    this._authCubit,
    this._commonStorage,
    this._notificationsRepo,
    this._subscriptionsRepo,
    this._analyticsRepo,
    this._preferencesCubit,
    this._profileCubit,
  );


  /// Executes the full user registration flow.
  ///
  /// Responsibilities:
  /// - Register a new user account via [AuthRepo]
  /// - On success, transition the app into an authenticated state
  ///
  /// Returns either a [RegisterFailure] or a successful [RegisterResult].
  /// 
  Future<Either<RegisterFailure, RegisterResult>> execute({
    required Email email,
    required Password password,
    required UserPreferences preferences,
  }) async {
    final failureOrSuccess = await _authRepo.register(
      email: email,
      password: password,
      preferences: preferences,
    );
    final successResult = failureOrSuccess.getEntries().$2;
    if (successResult != null) {
      await _submitAppState(successResult);
      await _establishInternalData(successResult);
    }
    return failureOrSuccess;
  }


  /// Submits newly created user data into application state.
  ///
  /// This method hydrates core user-related cubits immediately
  /// after a successful registration.
  ///
  Future<void> _submitAppState(RegisterResult result) async {
    /// Update state to 'authenticated'
    ///
    unawaited(_authCubit.setAuthenticated());

    /// Update and store user profile
    /// 
    unawaited(_profileCubit.emitPreserveProfile(result.profile));

    /// Update and store user preferences
    /// 
    unawaited(_preferencesCubit.emitPreservePreferences(
      result.preferences,
      remotePreserve: false,
    ));
  }  


  /// Establishes internal app services after successful registration.
  ///
  /// Responsibilities:
  /// - Finalize onboarding completion
  /// - Enable push notification delivery
  /// - Initialize subscription backend state for the new user
  /// - Log analytics event for sign-up
  ///
  /// All operations are non-blocking and executed in parallel.
  /// 
  Future<void> _establishInternalData(RegisterResult result) async {
    /// Turn off onboarding state
    /// 
    unawaited(_commonStorage.setIsOnboardingState(false));
    
    /// Ensure the app can receive push notifications
    /// 
    unawaited(_notificationsRepo.retrieveTokenAndSubscribe());

    /// Ensure subscription offerings data is established
    /// 
    unawaited(_subscriptionsRepo.login(userId: result.userId));

    /// Log analytics event for sign up
    /// 
    unawaited(_analyticsRepo.logSignUp());
  }
}
