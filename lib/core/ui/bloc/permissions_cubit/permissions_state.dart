part of 'permissions_cubit.dart';

@freezed
abstract class PermissionsState with _$PermissionsState {
  const PermissionsState._();
  const factory PermissionsState({
    @Default(false) bool checkingNotificationsPermission,
    required Option<AppPermissionStatus> notificationsPermission,
  }) = _PermissionsState;

  factory PermissionsState.initial() =>
      const PermissionsState(notificationsPermission: None());

  bool get notificationsPermssionGranted => notificationsPermission.fold(() => false, (x) => x.isAnyGranted);
}
