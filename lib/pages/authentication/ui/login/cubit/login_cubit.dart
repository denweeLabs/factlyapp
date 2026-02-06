import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/login_result.dart';
import 'package:denwee/core/auth/domain/entity/password.dart';
import 'package:denwee/core/auth/domain/failure/change_password_failure.dart';
import 'package:denwee/core/auth/domain/failure/login_failure.dart';
import 'package:denwee/core/auth/domain/repo/auth_repo.dart';
import 'package:denwee/core/auth/domain/use_case/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;
  final LoginUseCase _loginUseCase;

  static const resendEmailUnlockPeriod = Duration(seconds: 5);

  var _isResendEmailLocked = false;

  LoginCubit(this._authRepo, this._loginUseCase) : super(LoginState.initial());

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

  Future<void> loginWithEmailAndPassword() async {
    assert(state.email.isValid);
    assert(state.password.isValid);

    if (state.authInProgress) return;

    emit(state.copyWith(
      failureOrSuccess: const None(),
      authInProgress: true,
    ));

    final failureOrSuccess = await _loginUseCase.withEmailAndPassword(
      email: state.email,
      password: state.password,
    );

    emit(state.copyWith(
      failureOrSuccess: some(failureOrSuccess),
      authInProgress: false,
    ));
  }

  Future<void> loginWithGoogle() async {
    if (state.authInProgress) return;

    emit(state.copyWith(
      failureOrSuccess: const None(),
      authInProgress: true,
    ));

    final failureOrSuccess = await _loginUseCase.withGoogle();

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
