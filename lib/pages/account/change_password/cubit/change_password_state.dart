part of 'change_password_cubit.dart';

@freezed
abstract class ChangePasswordState with _$ChangePasswordState {
  const ChangePasswordState._();
  const factory ChangePasswordState({
    @Default(Password.pure()) Password oldPassword,
    @Default(Password.pure()) Password newPassword,
    @Default(None())
    Option<Either<ChangePasswordFailure, Unit>> changeFailureOrSuccess,
    @Default(false) bool isChanging,
  }) = _ChangePasswordState;

  factory ChangePasswordState.initial() => const ChangePasswordState();

  bool get isValid => oldPassword.isValid && newPassword.isValid;

  bool get isChangeFailure {
    return changeFailureOrSuccess.fold(
      () => false,
      (failureOrSuccess) => failureOrSuccess.isLeft(),
    );
  }

  Option<ChangePasswordFailure> get changeFailure {
    return changeFailureOrSuccess.fold(
      () => const None(),
      (x) => x.fold((failure) => Some(failure), (_) => const None()),
    );
  }

  bool get isChangeSuccess {
    return changeFailureOrSuccess.fold(
      () => false,
      (failureOrSuccess) => failureOrSuccess.isRight(),
    );
  }
}
