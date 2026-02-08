part of 'register_cubit.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const RegisterState._();
  const factory RegisterState({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(false) bool authInProgress,
    @Default(None())
    Option<Either<RegisterFailure, RegisterResult>> failureOrSuccess,
  }) = _RegisterState;

  factory RegisterState.initial() => const RegisterState();

  bool get isValid => email.isValid && password.isValid;
}
