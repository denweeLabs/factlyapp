import 'package:dartz/dartz.dart';
import 'package:denwee/core/network/domain/failure/common_api_failure.dart';

abstract class UserIdentityRepo {
  /// Returns cached or fetched userId
  Future<Either<CommonApiFailure, String>> resolve();

  /// Always fetches from backend and updates cache
  Future<Either<CommonApiFailure, String>> refresh();

  /// Clears all identity state (on logout)
  Future<Unit> clear();
}
