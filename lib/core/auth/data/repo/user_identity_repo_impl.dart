import 'package:dartz/dartz.dart';
import 'package:denwee/core/auth/data/source/auth_remote_source.dart';
import 'package:denwee/core/auth/domain/repo/user_identity_repo.dart';
import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:denwee/core/network/domain/failure/common_api_failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserIdentityRepo)
class UserIdentityRepoImpl implements UserIdentityRepo {
  final AuthRemoteSource _remoteSource;

  UserIdentityRepoImpl(this._remoteSource);

  @override
  Future<Either<CommonApiFailure, String>> getUserIdRemote() async {
    try {
      final userId = await _remoteSource.getUserId();
      if (userId.trim().isEmpty) {
        return left(CommonApiFailure.unexpected);
      }
      return right(userId);
    } on AppException catch (e) {
      return left(CommonApiFailure.fromAppException(e));
    } catch (_) {
      return left(CommonApiFailure.unexpected);
    }
  }
}
