import 'package:denwee/core/auth/domain/entity/change_password_body.dart';
import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/login_anonymously_result.dart';
import 'package:denwee/core/auth/domain/entity/login_result.dart';
import 'package:denwee/core/auth/domain/entity/password.dart';
import 'package:denwee/core/auth/domain/entity/register_result.dart';
import 'package:denwee/core/auth/domain/entity/reset_password_body.dart';
import 'package:denwee/core/auth/domain/entity/change_password_failure.dart';
import 'package:denwee/core/auth/domain/entity/login_failure.dart';
import 'package:denwee/core/auth/domain/entity/register_failure.dart';
import 'package:denwee/core/network/domain/entity/common_api_failure.dart';
import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<LoginFailure, LoginResult>> login({
    required Email email,
    required Password password,
  });
  Future<Either<LoginFailure, LoginResult>> loginWithGoogle();
  Future<Either<LoginFailure, LoginResult>> loginWithApple();
  Future<Either<RegisterFailure, RegisterResult>> register({
    required Email email,
    required Password password,
    required UserPreferences preferences,
  });
  Future<Either<RegisterFailure, RegisterResult>> registerWithGoogle({
    required UserPreferences preferences,
  });
  Future<Either<RegisterFailure, RegisterResult>> registerWithApple({
    required UserPreferences preferences,
  });
  Future<Either<CommonApiFailure, LoginAnonymouslyResult>> signInAnonymously({
    required UserPreferences preferences,
  });
  Future<Either<CommonApiFailure, String>> getUserIdRemote();
  Future<Either<ChangePasswordFailure, Unit>> changePassword(ChangePasswordBody body);
  Future<Either<ChangePasswordFailure, Unit>> resetPassword(Email email);
  Future<Either<ChangePasswordFailure, Unit>> resetPasswordValidate(ResetPasswordBody body);
  Future<Either<CommonApiFailure, Unit>> deleteAccount();
}