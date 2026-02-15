import 'package:permission_handler/permission_handler.dart';
import 'package:denwee/core/permissions/domain/entity/app_permission_status.dart' as pm_status;

extension PermissionStatusX on PermissionStatus {
  pm_status.AppPermissionStatus mapToDomain() {
    switch (this) {
      case PermissionStatus.granted:
        return const pm_status.AppPermissionStatus.granted();
      case PermissionStatus.limited:
        return const pm_status.AppPermissionStatus.granted(isLimited: true);
      case PermissionStatus.denied:
        return const pm_status.AppPermissionStatus.denied();
      case PermissionStatus.permanentlyDenied:
        return const pm_status.AppPermissionStatus.denied(isForever: true);
      default:
        return const pm_status.AppPermissionStatus.denied();
    }
  }

  /// Strict merge of two permission statuses
  static pm_status.AppPermissionStatus mergeStrict2(
    PermissionStatus photos,
    PermissionStatus videos,
  ) {
    // Both granted
    if (photos.isGranted && videos.isGranted) {
      return const pm_status.AppPermissionStatus.granted();
    }

    // Any permanently denied → forever denied
    if (photos.isPermanentlyDenied || videos.isPermanentlyDenied) {
      return const pm_status.AppPermissionStatus.denied(isForever: true);
    }

    // Otherwise → incomplete permission
    return const pm_status.AppPermissionStatus.denied();
  }
}
