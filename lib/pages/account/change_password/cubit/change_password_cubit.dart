import 'package:denwee/core/auth/domain/entity/change_password_body.dart';
import 'package:denwee/core/auth/domain/entity/password.dart';
import 'package:denwee/core/auth/domain/entity/reset_password_body.dart';
import 'package:denwee/core/auth/domain/failure/change_password_failure.dart';
import 'package:denwee/core/auth/domain/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'change_password_state.dart';
part 'change_password_cubit.freezed.dart';

@Injectable()
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final AuthRepo _authRepo;

  ChangePasswordCubit(this._authRepo) : super(ChangePasswordState.initial());

  void onOldPasswordChanged(String value) {
    value = value.trim();
    final oldPassword = Password.pure(value);
    emit(state.copyWith(oldPassword: oldPassword));
  }

  void onNewPasswordChanged(String value) {
    value = value.trim();
    final newPassword = Password.pure(value);
    emit(state.copyWith(newPassword: newPassword));
  }

  void validate({
    required String oldPassword,
    required String newPassword,
  }) {
    final newOldPassword = Password.dirty(oldPassword);
    final newNewPassword = Password.dirty(newPassword);
    emit(state.copyWith(
      oldPassword: newOldPassword,
      newPassword: newNewPassword,
    ));
  }

  Future<void> changePassword() async {
    emit(state.copyWith(
      isChanging: true,
      changeFailureOrSuccess: const None(),
    ));
    final body = ChangePasswordBody(
      oldPassword: state.oldPassword,
      newPassword: state.newPassword,
    );
    final failureOrSuccess = await _authRepo.changePassword(body);
    emit(state.copyWith(
      isChanging: false,
      changeFailureOrSuccess: Some(failureOrSuccess),
    ));
  }

  Future<void> resetPasswordValidate(String accessToken) async {
    emit(state.copyWith(
      isChanging: true,
      changeFailureOrSuccess: const None(),
    ));
    final body = ResetPasswordBody(
      accessToken: accessToken,
      newPassword: state.newPassword,
    );
    final failureOrSuccess = await _authRepo.resetPasswordValidate(body);
    emit(state.copyWith(
      isChanging: false,
      changeFailureOrSuccess: Some(failureOrSuccess),
    ));
  }

  @override
  void emit(ChangePasswordState state) {
    if (isClosed) return;
    super.emit(state);
  }
}
