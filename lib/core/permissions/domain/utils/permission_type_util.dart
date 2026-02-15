import 'package:app_settings/app_settings.dart';
import 'package:denwee/core/permissions/domain/entity/app_permission_status.dart';
import 'package:denwee/core/permissions/domain/repo/app_permission.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/bloc/permissions/permissions_cubit.dart';

extension AppPermissionTypeX on AppPermissionType {
  Future<void> openSettings() {
    switch (this) {
      case AppPermissionType.notifications:
        return AppSettings.openAppSettings(type: AppSettingsType.notification);
      case AppPermissionType.photosAdd:
        return AppSettings.openAppSettings();
      case AppPermissionType.photosFull:
        return AppSettings.openAppSettings();
    }
  }

  Future<AppPermissionStatus> check() {
    switch (this) {
      case AppPermissionType.notifications:
        return getIt<PermissionsCubit>().forceCheckNotifications();
      case AppPermissionType.photosAdd:
        return getIt<PermissionsCubit>().forceCheckPhotosAdd();
      case AppPermissionType.photosFull:
        return getIt<PermissionsCubit>().forceCheckPhotosFull();
    }
  }

  Future<AppPermissionStatus> request() {
    switch (this) {
      case AppPermissionType.notifications:
        return getIt<PermissionsCubit>().forceCheckNotifications(request: true);
      case AppPermissionType.photosAdd:
        return getIt<PermissionsCubit>().forceCheckPhotosAdd(request: true);
      case AppPermissionType.photosFull:
        return getIt<PermissionsCubit>().forceCheckPhotosFull(request: true);
    }
  }
}
