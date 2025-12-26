import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/login_result.dart';
import 'package:denwee/core/auth/domain/entity/password.dart';
import 'package:denwee/core/auth/domain/failure/change_password_failure.dart';
import 'package:denwee/core/auth/domain/failure/login_failure.dart';
import 'package:denwee/core/auth/domain/repo/auth_repo.dart';
import 'package:denwee/core/misc/data/storage/common_storage.dart';
import 'package:denwee/core/statistics/domain/repo/analytics_repo.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:denwee/core/ui/bloc/facts_cubit/daily_facts_cubit.dart';
import 'package:denwee/core/ui/bloc/notifications_cubit/notifications_cubit.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/bloc/user_statistics_cubit/user_statistics_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;
  final CommonStorage _commonStorage;
  final ProfileCubit _profileCubit;
  final UserPreferencesCubit _preferencesCubit;
  final UserStatisticsCubit _userStatisticsCubit;
  final AuthCubit _authCubit;
  final DailyFactsCubit _dailyFactsCubit;
  final NotificationsCubit _notificationsCubit;
  final AnalyticsRepo _analyticsRepo;

  static const resendEmailUnlockPeriod = Duration(seconds: 5);

  var _isResendEmailLocked = false;

  LoginCubit(
    this._authRepo,
    this._commonStorage,
    this._profileCubit,
    this._preferencesCubit,
    this._userStatisticsCubit,
    this._notificationsCubit,
    this._authCubit,
    this._dailyFactsCubit,
    this._analyticsRepo,
  ) : super(LoginState.initial());

  void onEmailChanged(String email) {
    final newEmail = Email.pure(email);
    emit(state.copyWith(email: newEmail));
  }

  void onPasswordChanged(String password) {
    final newPass = Password.pure(password);
    emit(state.copyWith(password: newPass));
  }

  void validate({
    required String email,
    required String password,
  }) {
    final newEmail = Email.dirty(email);
    final newPass = Password.dirty(password);
    emit(state.copyWith(email: newEmail, password: newPass));
  }

  Future<void> login() async {
    assert(state.email.isValid);
    assert(state.password.isValid);

    if (state.authInProgress) return;

    emit(state.copyWith(
      failureOrSuccess: const None(),
      authInProgress: true,
    ));

    final failureOrSuccess = await _authRepo.login(
      email: state.email,
      password: state.password,
    );

    final isSuccess = failureOrSuccess.isRight();

    if (isSuccess) {
      final result = failureOrSuccess.getOrElse(() => throw '');
      await _commonStorage.setIsOnboardingState(false);
      await _preferencesCubit.emitPreservePreferences(result.preferences, remotePreserve: false);
      await _notificationsCubit.forceUpdateToken();
      await _profileCubit.emitPreserveProfile(result.profile);
      await _userStatisticsCubit.checkStatistics();
      await _authCubit.setAuthenticated();
      await _dailyFactsCubit.checkBucket();
      _analyticsRepo.logLogin();
    }

    emit(state.copyWith(
      failureOrSuccess: some(failureOrSuccess),
      authInProgress: false,
    ));
  }

  Future<void> sendResetPassEmail([Email? forcedEmail]) async {
    final thisEmail = forcedEmail ?? state.email;

    assert(thisEmail.isValid);

    if (state.resetPassInProgress || _isResendEmailLocked) return;

    emit(state.copyWith(
      resetPassFailureOrSuccess: const None(),
      resetPassInProgress: true,
    ));

    final failureOrSuccess = await _authRepo.resetPassword(thisEmail);

    if (failureOrSuccess.isRight()) {
      _isResendEmailLocked = true;
      Future.delayed(resendEmailUnlockPeriod, () => _isResendEmailLocked = false);
    }

    emit(state.copyWith(
      resetPassFailureOrSuccess: some(failureOrSuccess),
      resetPassInProgress: false,
    ));
  }

  @override
  void emit(LoginState state) {
    if (isClosed) return;
    super.emit(state);
  }
}
