part of 'profile_cubit.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const ProfileState._();
  const factory ProfileState({
    @Default(None()) Option<Profile> profile,
    @Default(None()) Option<ProfileFailure> failure,
  }) = _ProfileState;

  factory ProfileState.initial() => const ProfileState();

  String commonUserName(BuildContext context) {
    return profile.toNullable()?.name.toNullable()?.value ??
        context.tr(LocaleKeys.account_profile_default_username);
  } 
}
