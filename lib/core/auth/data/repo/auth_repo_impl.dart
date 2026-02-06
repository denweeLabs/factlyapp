import 'package:denwee/core/auth/data/model/change_password_body_dto.dart';
import 'package:denwee/core/auth/data/model/login_body_dto.dart';
import 'package:denwee/core/auth/data/model/register_body_dto.dart';
import 'package:denwee/core/auth/data/model/reset_password_body_dto.dart';
import 'package:denwee/core/auth/data/model/third_party_login_body_dto.dart';
import 'package:denwee/core/auth/data/model/third_party_register_body_dto.dart';
import 'package:denwee/core/auth/domain/entity/change_password_body.dart';
import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/login_anonymously_result.dart';
import 'package:denwee/core/auth/domain/entity/login_result.dart';
import 'package:denwee/core/auth/domain/entity/password.dart';
import 'package:denwee/core/auth/domain/entity/register_result.dart';
import 'package:denwee/core/auth/domain/entity/reset_password_body.dart';
import 'package:denwee/core/auth/domain/entity/third_party_login_body.dart';
import 'package:denwee/core/auth/domain/entity/third_party_register_body.dart';
import 'package:denwee/core/auth/domain/failure/change_password_failure.dart';
import 'package:denwee/core/auth/domain/failure/login_failure.dart';
import 'package:denwee/core/auth/domain/failure/register_failure.dart';
import 'package:denwee/core/auth/domain/repo/auth_repo.dart';
import 'package:denwee/core/auth/domain/source/auth_remote_source.dart';
import 'package:denwee/core/auth/domain/providers/google/google_sign_in_provider.dart';
import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:denwee/core/network/domain/failure/common_api_failure.dart';
import 'package:denwee/core/user_preferences/data/model/user_preferences_dto.dart';
import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteSource _remoteSource;
  final GoogleSignInProvider _googleSignInProvider;

  const AuthRepoImpl(this._remoteSource, this._googleSignInProvider);

  @override
  Future<Either<LoginFailure, LoginResult>> login({
    required Email email,
    required Password password,
  }) async {
    try {
      final body = LoginBodyDto(
        email: email.value,
        password: password.value,
      );
      final response = await _remoteSource.login(body);
      return right(response.toResult());
    } on AppException catch (error) {
      final failure = LoginFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(LoginFailure.unexpected);
    }
  }

  @override
  Future<Either<LoginFailure, LoginResult>> loginWithGoogle() async {
    try {
      final result = await _googleSignInProvider.authenticate();
      if (result == null) return left(LoginFailure.cancelled);
      
      final body = ThirdPartyLoginBody.google(idToken: result.idToken);
      final response = await _remoteSource.thirdPartyLogin(
        ThirdPartyLoginBodyDto.fromDomain(body),
      );
      return right(response.toResult());
    } on AppException catch (error) {
      final failure = LoginFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(LoginFailure.unexpected);
    }
  }

  @override
  Future<Either<RegisterFailure, RegisterResult>> register({
    required Email email,
    required Password password,
    required UserPreferences preferences,
  }) async {
    try {
      final body = RegisterBodyDto(
        email: email.value,
        password: password.value,
        preferences: UserPreferencesDto.fromDomain(preferences),
      );
      final response = await _remoteSource.register(body);
      return right(response.toResult());
    } on AppException catch (error) {
      final failure = RegisterFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(RegisterFailure.unexpected);
    }
  }

  @override
  Future<Either<RegisterFailure, RegisterResult>> registerWithGoogle({
    required UserPreferences preferences,
  }) async {
    try {
      final result = await _googleSignInProvider.authenticate();
      if (result == null) return left(RegisterFailure.cancelled);

      final body = ThirdPartyRegisterBody.google(
        idToken: result.idToken,
        preferences: preferences,
      );
      final response = await _remoteSource.thirdPartyRegister(
        ThirdPartyRegisterBodyDto.fromDomain(body),
      );
      return right(response.toResult());
    } on AppException catch (error) {
      final failure = RegisterFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(RegisterFailure.unexpected);
    }
  }

  @override
  Future<Either<CommonApiFailure, LoginAnonymouslyResult>> signInAnonymously({
    required UserPreferences preferences,
  }) async {
    try {
      final response = await _remoteSource.signInAnonymously(
        UserPreferencesDto.fromDomain(preferences),
      );
      return right(response.toResult());
    } on AppException catch (error) {
      final failure = CommonApiFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(CommonApiFailure.unexpected);
    }
  }

  @override
  Future<Either<ChangePasswordFailure, Unit>> changePassword(ChangePasswordBody body) async {
    try {
      final bodyDto = ChangePasswordBodyDto.fromDomain(body);
      await _remoteSource.changePassword(bodyDto);
      return right(unit);
    } on AppException catch (error) {
      final failure = ChangePasswordFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(ChangePasswordFailure.unexpected);
    }
  }

  @override
  Future<Either<ChangePasswordFailure, Unit>> resetPassword(Email email) async {
    try {
      await _remoteSource.resetPassword(email.value);
      return right(unit);
    } on AppException catch (error) {
      final failure = ChangePasswordFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(ChangePasswordFailure.unexpected);
    }
  }

  @override
  Future<Either<ChangePasswordFailure, Unit>> resetPasswordValidate(ResetPasswordBody body) async {
    try {
      final bodyDto = ResetPasswordBodyDto.fromDomain(body);
      await _remoteSource.resetPasswordValidate(bodyDto);
      return right(unit);
    } on AppException catch (error) {
      final failure = ChangePasswordFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(ChangePasswordFailure.unexpected);
    }
  }

  @override
  Future<Either<CommonApiFailure, Unit>> deleteAccount() async {
    try {
      await _remoteSource.deleteAccount();
      return right(unit);
    } on AppException catch (error) {
      final failure = CommonApiFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(CommonApiFailure.unexpected);
    }
  }
}
