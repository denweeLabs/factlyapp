import 'package:denwee/core/network/domain/entity/common_api_failure.dart';
import 'package:dartz/dartz.dart';

abstract class PushNotificationsRepo {
  Future<Either<CommonApiFailure, String?>> retrieveToken();
  Future<Either<CommonApiFailure, Unit>> retrieveTokenAndSubscribe();
  Future<Either<CommonApiFailure, Unit>> subscribe(String token);
  Future<Either<CommonApiFailure, Unit>> unsubscribe();
}
