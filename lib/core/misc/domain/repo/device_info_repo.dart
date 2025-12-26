import 'package:denwee/core/misc/domain/entity/device_info.dart';

abstract class DeviceInfoRepo {
  Future<DeviceInfo> getDeviceInfo();
}
