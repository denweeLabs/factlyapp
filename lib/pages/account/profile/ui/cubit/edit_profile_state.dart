part of 'edit_profile_cubit.dart';

@freezed
abstract class EditProfileState with _$EditProfileState {
  const EditProfileState._();
  const factory EditProfileState({
    // @Default(None()) Option<File> newAvatar,
    @Default(None()) Option<Username> name,
    @Default(Email.pure()) Email email,
    // @Default(false) bool hasChanges,
    @Default(false) bool isNameChanged,
    @Default(false) bool isEmailChanged,
    @Default(false) bool isSaving,
    @Default(false) bool isAccountDeleting,
    @Default(None()) Option<Either<ProfileFailure, Profile>> saveFailureOrSuccess,
    @Default(None()) Option<Either<CommonApiFailure, Unit>> accountDeleteFailureOrSuccess,
  }) = _EditProfileState;

  factory EditProfileState.initial({
    required Profile initialProfile,
  }) {
    return EditProfileState(
      name: initialProfile.name,
      email: initialProfile.email.toNullable()!,
    );
  }

  bool get isValid {
    final isName = name.fold(() => true, (name) => name.isValid);
    final isEmail = email.isValid;
    return isName && isEmail;
  }

  bool get hasChanges {
    return isNameChanged || isEmailChanged;
  }

  bool get isSaveSuccess {
    return saveFailureOrSuccess.fold(
      () => false,
      (failureOrSuccess) => failureOrSuccess.isRight(),
    );
  }

  bool get isSaveFailure {
    return saveFailureOrSuccess.fold(
      () => false,
      (failureOrSuccess) => failureOrSuccess.isLeft(),
    );
  }

  Option<ProfileFailure> get saveFailure {
    return saveFailureOrSuccess.fold(
      () => const None(),
      (x) => x.fold((failure) => Some(failure), (_) => const None()),
    );
  }

  bool get isSaveVisible {
    return hasChanges || isSaving || isSaveFailure;
  }

  bool get isAccountDeleteFailure {
    return accountDeleteFailureOrSuccess.fold(
      () => false,
      (failureOrSuccess) => failureOrSuccess.isLeft(),
    );
  }

  Option<CommonApiFailure> get accountDeleteFailure {
    return accountDeleteFailureOrSuccess.fold(
      () => const None(),
      (x) => x.fold((failure) => Some(failure), (_) => const None()),
    );
  }
}
