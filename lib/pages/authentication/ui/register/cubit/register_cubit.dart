import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/password.dart';
import 'package:denwee/core/auth/domain/entity/register_result.dart';
import 'package:denwee/core/auth/domain/failure/register_failure.dart';
import 'package:denwee/core/auth/domain/repo/auth_repo.dart';
import 'package:denwee/core/misc/data/storage/common_storage.dart';
import 'package:denwee/core/statistics/domain/repo/analytics_repo.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:denwee/core/ui/bloc/notifications_cubit/notifications_cubit.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/bloc/user_statistics_cubit/user_statistics_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

@Injectable()
class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo _authRepo;
  final ProfileCubit _profileCubit;
  final UserPreferencesCubit _preferencesCubit;
  final UserStatisticsCubit _userStatisticsCubit;
  final NotificationsCubit _notificationsCubit;
  final AuthCubit _authCubit;
  final CommonStorage _commonStorage;
  final AnalyticsRepo _analyticsRepo;

  RegisterCubit(
    this._authRepo,
    this._profileCubit,
    this._preferencesCubit,
    this._userStatisticsCubit,
    this._authCubit,
    this._commonStorage,
    this._analyticsRepo,
    this._notificationsCubit,
  ) : super(RegisterState.initial());

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

  Future<void> register() async {
    assert(state.email.isValid);
    assert(state.password.isValid);

    if (state.authInProgress) return;

    emit(state.copyWith(
      failureOrSuccess: const None(),
      authInProgress: true,
    ));

    final failureOrSuccess = await _authRepo.register(
      email: state.email,
      password: state.password,
      preferences: _preferencesCubit.state.preferences,
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
      _analyticsRepo.logSignUp();
    }

    emit(state.copyWith(
      failureOrSuccess: some(failureOrSuccess),
      authInProgress: false,
    ));
  }

  @override
  void emit(RegisterState state) {
    if (isClosed) return;
    super.emit(state);
  }
}
