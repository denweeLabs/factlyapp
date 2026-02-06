import 'package:denwee/core/auth/data/model/change_password_body_dto.dart';
import 'package:denwee/core/auth/data/model/login_anonymously_response_dto.dart';
import 'package:denwee/core/auth/data/model/login_body_dto.dart';
import 'package:denwee/core/auth/data/model/login_response_dto.dart';
import 'package:denwee/core/auth/data/model/register_body_dto.dart';
import 'package:denwee/core/auth/data/model/register_response_dto.dart';
import 'package:denwee/core/auth/data/model/reset_password_body_dto.dart';
import 'package:denwee/core/auth/data/model/third_party_login_body_dto.dart';
import 'package:denwee/core/auth/data/model/third_party_register_body_dto.dart';
import 'package:denwee/core/user_preferences/data/model/user_preferences_dto.dart';

abstract class AuthRemoteSource {
  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<LoginResponseDto> login(LoginBodyDto body);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<LoginResponseDto> thirdPartyLogin(ThirdPartyLoginBodyDto body);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<RegisterResponseDto> register(RegisterBodyDto body);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<RegisterResponseDto> thirdPartyRegister(ThirdPartyRegisterBodyDto body);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<LoginAnonymouslyResponseDto> signInAnonymously(
    UserPreferencesDto preferencesDto,
  );

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<void> changePassword(ChangePasswordBodyDto bodyDto);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<void> resetPassword(String email);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<void> resetPasswordValidate(ResetPasswordBodyDto bodyDto);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<void> deleteAccount();

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<String> getUserId();
}