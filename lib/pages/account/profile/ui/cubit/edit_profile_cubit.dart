import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/username.dart';
import 'package:denwee/core/auth/domain/repo/auth_repo.dart';
import 'package:denwee/core/network/domain/failure/common_api_failure.dart';
import 'package:denwee/core/profile/domain/entity/profile.dart';
import 'package:denwee/core/profile/domain/entity/update_profile_body.dart';
import 'package:denwee/core/profile/domain/failure/profile_failure.dart';
import 'package:denwee/core/profile/domain/repo/profile_repo.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'edit_profile_state.dart';
part 'edit_profile_cubit.freezed.dart';

@Injectable()
class EditProfileCubit extends Cubit<EditProfileState> {
  final ProfileCubit _profileCubit;
  final ProfileRepo _profileRepo;
  final AuthRepo _authRepo;
  final AuthCubit _authCubit;

  String? _initialName;
  String? _initialEmail;

  EditProfileCubit(
    this._profileCubit,
    this._profileRepo,
    this._authRepo,
    this._authCubit,
  ) : super(EditProfileState.initial(
          initialProfile: _profileCubit.state.profile.toNullable()!,
        )) {
    _setInitialPersonalDetails(
      name: state.name,
      email: state.email,
    );
  }

  void _setInitialPersonalDetails({
    required Option<Username> name,
    required Email email,
  }) {
    _initialName = name.toNullable()?.value ?? '';
    _initialEmail = email.value;
  }

  bool get _isNameChanged {
    return (state.name.toNullable()?.value ?? '') != _initialName;
  }

  bool get _isEmailChanged {
    return state.email.value != _initialEmail;
  }

  // void changeAvatar(File file) {}

  void onNameChanged(String value) {
    if (state.isSaving) return;

    value = value.trim();

    final isChanged = _initialName != value;
    final newName =
        value.isEmpty ? const None<Username>() : Some(Username.pure(value));

    emit(state.copyWith(
      isNameChanged: isChanged,
      name: newName,
      saveFailureOrSuccess: const None(),
    ));
  }

  void onEmailChanged(String value) {
    if (state.isSaving) return;

    value = value.trim();

    final isChanged = _initialEmail != value;
    final newEmail = Email.pure(value);

    emit(state.copyWith(
      isEmailChanged: isChanged,
      email: newEmail,
      saveFailureOrSuccess: const None(),
    ));
  }

  void validate({
    required String? name,
    required String email,
  }) {
    final newName = name != null ? Some(Username.dirty(name)) : state.name;
    final newEmail = Email.dirty(email);
    emit(state.copyWith(
      name: newName,
      email: newEmail,
    ));
  }

  Future<void> save() async {
    emit(state.copyWith(
      isSaving: true,
      saveFailureOrSuccess: const None(),
    ));
    final body = UpdateProfileBody(name: state.name, email: state.email);
    final failureOrSuccess = await _profileRepo.updateProfileRemote(body);
    final isSuccess = failureOrSuccess.isRight();

    if (isSuccess) {
      _setInitialPersonalDetails(name: state.name, email: state.email);
      final newProfile = failureOrSuccess.toOption().toNullable()!;
      await _profileCubit.emitPreserveProfile(newProfile);
    }

    emit(state.copyWith(
      isSaving: false,
      isNameChanged: _isNameChanged,
      isEmailChanged: _isEmailChanged,
      saveFailureOrSuccess: Some(failureOrSuccess),
    ));
  }

  Future<void> deleteAccount() async {
    emit(state.copyWith(
      isAccountDeleting: true,
      accountDeleteFailureOrSuccess: const None(),
    ));
    final failureOrSuccess = await _authRepo.deleteAccount();
    final isSuccess = failureOrSuccess.isRight();
    if (isSuccess) {
      await _authCubit.setUnauthenticated();
    }
    emit(state.copyWith(
      isAccountDeleting: false,
      accountDeleteFailureOrSuccess: Some(failureOrSuccess),
    ));
  }

  @override
  void emit(EditProfileState state) {
    if (isClosed) return;
    super.emit(state);
  }
}
