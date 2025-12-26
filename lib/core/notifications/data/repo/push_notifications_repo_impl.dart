import 'package:denwee/core/misc/data/storage/local_secure_storage.dart';
import 'package:denwee/core/misc/data/storage/local_storage.dart';
import 'package:denwee/core/misc/domain/repo/device_info_repo.dart';
import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:denwee/core/network/domain/failure/common_api_failure.dart';
import 'package:denwee/core/notifications/data/model/push_notifications_subscribe_body_dto.dart';
import 'package:denwee/core/notifications/domain/repo/push_notifications_repo.dart';
import 'package:denwee/core/notifications/source/push_notifications_remote_source.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@LazySingleton(as: PushNotificationsRepo)
class PushNotificationsRepoImpl implements PushNotificationsRepo {
  final FirebaseMessaging _messaging;
  final PushNotificationsRemoteSource _remoteSource;
  final LocalSecureStorage _localSecureStorage;
  final LocalStorage _localStorage;
  final DeviceInfoRepo _deviceInfoRepo;
  final String _envPrefix;

  PushNotificationsRepoImpl(
    this._messaging,
    this._remoteSource,
    this._localStorage,
    this._localSecureStorage,
    this._deviceInfoRepo,
    @ENV_PREFIX this._envPrefix,
  );

  static const tokenHeartbeatInterval = Duration(hours: 12);

  String? _lastToken;
  String get _tokenKey => '${_envPrefix}FCM_TOKEN_KEY';

  String? _lastTimezoneOffset;
  String get _timezoneOffsetKey => '${_envPrefix}TIMEZONE_OFFSET_KEY';

  DateTime? _lastSyncAt;
  String get _lastSyncAtKey => '${_envPrefix}FCM_LAST_SYNC_AT';

  @override
  Future<Either<CommonApiFailure, String?>> retrieveToken() async {
    try {
      // getAPNSToken() is not required, but can be useful to establish APN's routing
      await _messaging.getAPNSToken();
      final token = await _messaging.getToken();
      return right(token);
    } catch (_) {
      return left(CommonApiFailure.unexpected);
    }
  }

  @override
  Future<Either<CommonApiFailure, Unit>> subscribe(String token) async {
    try {
      final currentUtcTime = DateTime.now().toUtc();
      final currentOffset = getDeviceTimezoneOffset();

      // check if token has to be updated
      final shouldUpdate = await _shouldUpdateToken(token, currentOffset);
      if (!shouldUpdate) return right(unit);

      final deviceInfo = await _deviceInfoRepo.getDeviceInfo();
      final dto = PushNotificationsSubscribeBodyDto(
        token: token,
        timezone: currentOffset,
        platform: deviceInfo.operatingSystem,
        deviceModel: deviceInfo.deviceModel,
        appVersion: deviceInfo.appInfo.version,
        osVersion: deviceInfo.operatingSystemVersion,
      );
      await _remoteSource.subscribe(dto);
      await _storeToken(token);
      await _storeTimezoneOffset(currentOffset);
      await _storeLastSyncAt(currentUtcTime);
      return right(unit);
    } on AppException catch (error) {
      final failure = CommonApiFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(CommonApiFailure.unexpected);
    }
  }

  @override
  Future<Either<CommonApiFailure, Unit>> unsubscribe() async {
    try {
      final token = await _getLastToken();
      if (token == null) return left(CommonApiFailure.unexpected);
      await _remoteSource.unsubscribe(token);
      await _storeLastSyncAt(null);
      return right(unit);
    } on AppException catch (error) {
      final failure = CommonApiFailure.fromAppException(error);
      return left(failure);
    }
  }

  Future<String?> _getLastToken() async {
    return _lastToken ??= await _localSecureStorage.getString(key: _tokenKey);
  }

  Future<String?> _getLastTimezoneOffset() async {
    return _lastTimezoneOffset ??= await _localSecureStorage.getString(key: _timezoneOffsetKey);
  }

  Future<DateTime?> _getLastSyncAt() async {
    return _lastSyncAt ??= () {
      final timeString = _localStorage.getString(key: _lastSyncAtKey);
      return timeString != null ? DateTime.parse(timeString) : null;
    }();
  }

  Future<void> _storeToken(String? token) async {
    if (_lastToken != token) {
      _lastToken = token;

      if (token != null) {
        await _localSecureStorage.putString(key: _tokenKey, value: token);
      } else {
        await _localSecureStorage.remove(key: _tokenKey);
      }
    }
  }

  Future<void> _storeTimezoneOffset(String? offset) async {
    if (_lastTimezoneOffset != offset) {
      _lastTimezoneOffset = offset;

      if (offset != null) {
        await _localSecureStorage.putString(key: _timezoneOffsetKey, value: offset);
      } else {
        await _localSecureStorage.remove(key: _timezoneOffsetKey);
      }
    }
  }

  Future<void> _storeLastSyncAt(DateTime? time) async {
    _lastSyncAt = time;
    
    if (time != null) {
      await _localStorage.putString(key: _lastSyncAtKey, value: time.toIso8601String());
    } else {
      await _localStorage.remove(key: _lastSyncAtKey);
    }
  }

  Future<bool> _shouldUpdateToken(
    String currentToken,
    String currentOffset,
  ) async {
    final lastToken = await _getLastToken();
    final lastOffset = await _getLastTimezoneOffset();
    final lastSyncAt = await _getLastSyncAt();

    final now = DateTime.now().toUtc();

    final tokenChanged = lastToken != currentToken;
    final offsetChanged = lastOffset != currentOffset;
    final heartbeatExpired = lastSyncAt == null ||
        now.difference(lastSyncAt) >= tokenHeartbeatInterval;

    return tokenChanged || offsetChanged || heartbeatExpired;
  }
}
