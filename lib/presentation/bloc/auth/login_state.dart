part of 'login_cubit.dart';

@freezed
abstract class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(false) bool authInProgress,
    @Default(false) bool resetPassInProgress,
    @Default(None()) Option<Either<LoginFailure, LoginResult>> failureOrSuccess,
    @Default(None()) Option<Either<ChangePasswordFailure, Unit>> resetPassFailureOrSuccess,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState();

  bool get isValid => email.isValid && password.isValid;
}
