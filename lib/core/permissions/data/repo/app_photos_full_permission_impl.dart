import 'dart:io';

import 'package:denwee/core/misc/domain/entity/device_info.dart';
import 'package:denwee/core/permissions/domain/repo/app_permission.dart';
import 'package:denwee/core/permissions/domain/utils/permission_mapper.dart';
import 'package:denwee/di/di.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:denwee/core/permissions/domain/entity/app_permission_status.dart' as pm_status;

class AppPhotosFullPermission implements AppPermission {
  const AppPhotosFullPermission();
  
  @override
  AppPermissionType get type => AppPermissionType.photosFull;

  /// permissions are different on SDK > 32
  static const androidSdkThreshold = 32;
  
  @override
  Future<pm_status.AppPermissionStatus> request() async {
    if (Platform.isAndroid) {
      final sdkVersion = getIt<DeviceInfo>().androidSdkInt!;
      if (sdkVersion <= androidSdkThreshold) {
        final status = await Permission.storage.request();
        return status.mapToDomain();
      }
      // Android 13+
      final photos = await Permission.photos.request();
      final videos = await Permission.videos.request();
      return PermissionStatusX.mergeStrict2(photos, videos);
    }

    final status = await Permission.photos.request();
    return status.mapToDomain();
  }

  @override
  Future<pm_status.AppPermissionStatus> status() async {
    if (Platform.isAndroid) {
      final sdkVersion = getIt<DeviceInfo>().androidSdkInt!;
      if (sdkVersion <= androidSdkThreshold) {
        final status = await Permission.storage.status;
        return status.mapToDomain();
      }
      // Android 13+
      final photos = await Permission.photos.status;
      final videos = await Permission.videos.status;
      return PermissionStatusX.mergeStrict2(photos, videos);
    }

    final status = await Permission.photos.status;
    return status.mapToDomain();
  }
}
