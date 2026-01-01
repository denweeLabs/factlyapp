import 'package:dartz/dartz.dart';
import 'package:denwee/core/auth/data/source/auth_remote_source.dart';
import 'package:denwee/core/auth/domain/repo/user_identity_repo.dart';
import 'package:denwee/core/misc/data/storage/local_storage.dart';
import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:denwee/core/network/domain/failure/common_api_failure.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserIdentityRepo)
class UserIdentityRepoImpl implements UserIdentityRepo {
  final AuthRemoteSource _remoteSource;
  final LocalStorage _localStorage;
  final String _envPrefix;

  UserIdentityRepoImpl(
    this._remoteSource, 
    this._localStorage,
    @ENV_PREFIX this._envPrefix,
  );

  String? _cachedUserId;
  String get _userIdKey => '${_envPrefix}USER_IDENTITY';

  @override
  Future<Either<CommonApiFailure, String>> resolve() async {
    // 1. try get userId from memory
    if (_cachedUserId != null) {
      return right(_cachedUserId!);
    }

    // 2. local storage cache
    final storedUserId = _localStorage.getString(key: _userIdKey);
    if (storedUserId != null && storedUserId.trim().isNotEmpty) {
      _cachedUserId = storedUserId;
      return right(storedUserId);
    }

    // 3. remote fetch
    return refresh();
  }

  @override
  Future<Either<CommonApiFailure, String>> refresh() async {
    try {
      final userId = await _remoteSource.getUserId();
      if (userId.trim().isEmpty) {
        return left(CommonApiFailure.unexpected);
      }
      _cachedUserId = userId;
      await _localStorage.putString(key: _userIdKey, value: userId);
      return right(userId);
    } on AppException catch (e) {
      return left(CommonApiFailure.fromAppException(e));
    } catch (_) {
      return left(CommonApiFailure.unexpected);
    }
  }

  /// Clear on log out
  @override
  Future<Unit> clear() async {
    _cachedUserId = null;
    await _localStorage.remove(key: _userIdKey);
    return unit;
  }
}
