import 'dart:async';

abstract class AccessTokenRepo {
  FutureOr<String?> getAccessToken();
  FutureOr<String?> getRefreshToken();

  Future<void> setAccessToken(String? token);
  Future<void> setRefreshToken(String? token);

  Future<void> clearSession();
}
