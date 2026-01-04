import 'package:dartz/dartz.dart';
import 'package:denwee/core/network/domain/failure/common_api_failure.dart';

abstract class UserIdentityRepo {
  Future<Either<CommonApiFailure, String>> getUserIdRemote();
}
