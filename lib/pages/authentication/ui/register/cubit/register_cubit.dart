import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/password.dart';
import 'package:denwee/core/auth/domain/entity/register_result.dart';
import 'package:denwee/core/auth/domain/failure/register_failure.dart';
import 'package:denwee/core/auth/domain/use_case/register_use_case.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

@Injectable()
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;
  final UserPreferencesCubit _preferencesCubit;

  RegisterCubit(this._registerUseCase, this._preferencesCubit)
    : super(RegisterState.initial());

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

  Future<void> registerWithEmailAndPassword() async {
    assert(state.email.isValid);
    assert(state.password.isValid);

    if (state.authInProgress) return;

    emit(state.copyWith(
      failureOrSuccess: const None(),
      authInProgress: true,
    ));
    
    final failureOrSuccess = await _registerUseCase.withEmailAndPassword(
      email: state.email,
      password: state.password,
      preferences: _preferencesCubit.state.preferences,
    );

    emit(state.copyWith(
      failureOrSuccess: some(failureOrSuccess),
      authInProgress: false,
    ));
  }

  Future<void> registerWithGoogle() async {
    if (state.authInProgress) return;

    emit(state.copyWith(
      failureOrSuccess: const None(),
      authInProgress: true,
    ));
    
    final failureOrSuccess = await _registerUseCase.withGoogle(
      preferences: _preferencesCubit.state.preferences,
    );

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
