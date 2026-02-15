part of 'permissions_cubit.dart';

@freezed
abstract class PermissionsState with _$PermissionsState {
  const PermissionsState._();
  const factory PermissionsState({
    @Default(false) bool checkingNotificationsPermission,
    @Default(false) bool checkingPhotosAddPermission,
    @Default(false) bool checkingPhotosFullPermission,
    @Default(None()) Option<AppPermissionStatus> notificationsPermission,
    @Default(None()) Option<AppPermissionStatus> photosAddPermission,
    @Default(None()) Option<AppPermissionStatus> photosFullPermission,
  }) = _PermissionsState;

  factory PermissionsState.initial() => const PermissionsState();

  bool get notificationsPermssionGranted => notificationsPermission.fold(() => false, (x) => x.isAnyGranted);
}
