import 'dart:io';

import 'package:denwee/core/misc/domain/entity/device_info.dart';
import 'package:denwee/core/misc/domain/repo/device_info_repo.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@LazySingleton(as: DeviceInfoRepo)
class DeviceInfoRepoImpl implements DeviceInfoRepo {
  final PackageInfo _packageInfo;
  final DeviceInfoPlugin _deviceInfo;

  const DeviceInfoRepoImpl(this._packageInfo, this._deviceInfo);

  @override
  Future<DeviceInfo> getDeviceInfo() async {
    if (Platform.isIOS) {
      final info = await _deviceInfo.iosInfo;
      return DeviceInfo(
        deviceModel: info.modelName,
        operatingSystem: Platform.operatingSystem,
        operatingSystemVersion: Platform.operatingSystemVersion,
        osVersionValue: info.systemVersion,
        appInfo: AppInfo(
          packageName: _packageInfo.packageName,
          buildNumber: _packageInfo.buildNumber,
          version: _packageInfo.version,
        ),
        deviceId: info.identifierForVendor,
      );
    }

    if (Platform.isAndroid) {
      final info = await _deviceInfo.androidInfo;
      return DeviceInfo(
        deviceModel: info.model,
        operatingSystem: Platform.operatingSystem,
        operatingSystemVersion: Platform.operatingSystemVersion,
        osVersionValue: info.version.release,
        appInfo: AppInfo(
          packageName: _packageInfo.packageName,
          buildNumber: _packageInfo.buildNumber,
          version: _packageInfo.version,
        ),
        deviceId: info.id,
      );
    }

    throw UnsupportedError('Operating system is not supported');
  }
}
