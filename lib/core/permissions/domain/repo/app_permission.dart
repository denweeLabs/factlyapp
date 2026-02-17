import 'package:denwee/core/permissions/data/repo/app_notifications_permission_impl.dart';
import 'package:denwee/core/permissions/data/repo/app_photos_add_permission_impl.dart';
import 'package:denwee/core/permissions/data/repo/app_photos_full_permission_impl.dart';
import 'package:denwee/core/permissions/domain/entity/app_permission_status.dart'
    as pm_status;

enum AppPermissionType { notifications, photosAdd, photosFull }

abstract class AppPermission {
  static final notifications = AppPermission._(AppPermissionType.notifications);
  static final photosAdd = AppPermission._(AppPermissionType.photosAdd);
  static final photosFull = AppPermission._(AppPermissionType.photosFull);

  const AppPermission();

  factory AppPermission._(AppPermissionType type) {
    switch (type) {
      case AppPermissionType.notifications:
        return const AppNotificationsPermission();
      case AppPermissionType.photosAdd:
        return const AppPhotosAddPermission();
      case AppPermissionType.photosFull:
        return const AppPhotosFullPermission();
    }
  }

  AppPermissionType get type;
  Future<pm_status.AppPermissionStatus> request();
  Future<pm_status.AppPermissionStatus> status();
}
