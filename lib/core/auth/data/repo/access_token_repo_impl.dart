import 'dart:async';

import 'package:denwee/core/auth/domain/repo/access_token_repo.dart';
import 'package:denwee/core/misc/data/storage/local_secure_storage.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AccessTokenRepo)
class AccessTokenRepoImpl implements AccessTokenRepo {
  final LocalSecureStorage _localSecureStorage;
  final String _envPrefix;

  AccessTokenRepoImpl(
    this._localSecureStorage,
    @ENV_PREFIX this._envPrefix,
  );

  String? _accessToken;
  String? _refreshToken;

  String get _accessTokenKey => '${_envPrefix}ACCESS_TOKEN_KEY';
  String get _refreshTokenKey => '${_envPrefix}REFRESH_TOKEN_KEY';

  @override
  FutureOr<String?> getAccessToken() async {
    return _accessToken ??=
        await _localSecureStorage.getString(key: _accessTokenKey);
  }

  @override
  FutureOr<String?> getRefreshToken() async {
    return _refreshToken ??=
        await _localSecureStorage.getString(key: _refreshTokenKey);
  }

  @override
  Future<void> setAccessToken(String? token) async {
    _accessToken = token;

    if (token != null) {
      await _localSecureStorage.putString(key: _accessTokenKey, value: token);
    } else {
      await _localSecureStorage.remove(key: _accessTokenKey);
    }
  }

  @override
  Future<void> setRefreshToken(String? token) async {
    _refreshToken = token;

    if (token != null) {
      await _localSecureStorage.putString(key: _refreshTokenKey, value: token);
    } else {
      await _localSecureStorage.remove(key: _refreshTokenKey);
    }
  }

  @override
  Future<void> clearSession() async {
    return Future.microtask(() async {
      await setAccessToken(null);
      await setRefreshToken(null);
    });
  }
}
