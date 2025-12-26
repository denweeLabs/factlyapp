import 'package:denwee/core/permissions/domain/repo/app_permission.dart';
import 'package:denwee/core/permissions/domain/utils/permission_mapper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:denwee/core/permissions/domain/entity/app_permission_status.dart' as pm_status;

class AppNotificationsPermission implements AppPermission {
  @override
  AppPermissionType get type => AppPermissionType.notifications;
  
  @override
  Future<pm_status.AppPermissionStatus> request() async {
    final status = await Permission.notification.request();
    return status.mapToDomain();
  }

  @override
  Future<pm_status.AppPermissionStatus> status() async {
    final status = await Permission.notification.status;
    return status.mapToDomain();
  }
}
