import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_info.freezed.dart';

@freezed
abstract class DeviceInfo with _$DeviceInfo {
  const factory DeviceInfo({
    required String deviceModel,
    required String operatingSystem,
    required String operatingSystemVersion,
    required String osVersionValue,
    required AppInfo appInfo,
    required String? deviceId,
  }) = _DeviceInfo;
}

@freezed
abstract class AppInfo with _$AppInfo {
  const AppInfo._();
  const factory AppInfo({
    required String packageName,
    required String version,
    required String buildNumber,
  }) = _AppInfo;

  @override
  String toString() {
    return '$packageName, $version($buildNumber)';
  }
}
