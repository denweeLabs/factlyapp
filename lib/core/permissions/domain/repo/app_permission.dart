import 'package:denwee/core/permissions/data/repo/app_notifications_permission_impl.dart';
import 'package:denwee/core/permissions/domain/entity/app_permission_status.dart'
    as pm_status;

enum AppPermissionType { notifications }

abstract class AppPermission {
  static final notifications = AppPermission._(AppPermissionType.notifications);

  const AppPermission();

  factory AppPermission._(AppPermissionType type) {
    switch (type) {
      case AppPermissionType.notifications:
        return AppNotificationsPermission();
    }
  }

  AppPermissionType get type;
  Future<pm_status.AppPermissionStatus> request();
  Future<pm_status.AppPermissionStatus> status();
}
