import 'package:denwee/core/auth/data/model/change_password_body_dto.dart';
import 'package:denwee/core/auth/data/model/login_anonymously_response_dto.dart';
import 'package:denwee/core/auth/data/model/login_body_dto.dart';
import 'package:denwee/core/auth/data/model/login_response_dto.dart';
import 'package:denwee/core/auth/data/model/register_body_dto.dart';
import 'package:denwee/core/auth/data/model/register_response_dto.dart';
import 'package:denwee/core/auth/data/model/reset_password_body_dto.dart';
import 'package:denwee/core/auth/data/model/third_party_login_body_dto.dart';
import 'package:denwee/core/auth/data/model/third_party_register_body_dto.dart';
import 'package:denwee/core/auth/data/source/remote/auth_api.dart';
import 'package:denwee/core/auth/domain/repo/access_token_repo.dart';
import 'package:denwee/core/auth/domain/source/auth_remote_source.dart';
import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:denwee/core/user_preferences/data/model/user_preferences_dto.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRemoteSource)
class AuthRemoteSourceImpl implements AuthRemoteSource {
  final AccessTokenRepo _accessTokenRepo;
  final AuthApi _api;

  const AuthRemoteSourceImpl(
    this._accessTokenRepo,
    this._api,
  );

  @override
  Future<LoginResponseDto> login(LoginBodyDto body) async {
    final response = await _api.login(body.toJson());
    if (response.isSuccessful) {
      await _processTokensFromResponse(response);
    }
    return response.parseOrThrow(LoginResponseDto.fromJson);
  }

  @override
  Future<LoginResponseDto> thirdPartyLogin(ThirdPartyLoginBodyDto body) async {
    final response = await _api.loginThirdParty(body.toJson());
    if (response.isSuccessful) {
      await _processTokensFromResponse(response);
    }
    return response.parseOrThrow(LoginResponseDto.fromJson);
  }

  @override
  Future<RegisterResponseDto> register(RegisterBodyDto body) async {
    final response = await _api.register(body.toJson());
    if (response.isSuccessful) {
      await _processTokensFromResponse(response);
    }
    return response.parseOrThrow(RegisterResponseDto.fromJson);
  }

  @override
  Future<RegisterResponseDto> thirdPartyRegister(ThirdPartyRegisterBodyDto body) async {
    final response = await _api.thirdPartyRegister(body.toJson());
    if (response.isSuccessful) {
      await _processTokensFromResponse(response);
    }
    return response.parseOrThrow(RegisterResponseDto.fromJson);
  }

  @override
  Future<LoginAnonymouslyResponseDto> signInAnonymously(
    UserPreferencesDto preferencesDto,
  ) async {
    final response = await _api.signInAnonymously(preferencesDto.toJson());
    if (response.isSuccessful) {
      await _processTokensFromResponse(response);
    }
    return response.parseOrThrow(LoginAnonymouslyResponseDto.fromJson);
  }

  @override
  Future<void> changePassword(ChangePasswordBodyDto body) async {
    final response = await _api.changePassword(body.toJson());
    if (response.isSuccessful) {
      await _processTokensFromResponse(response);
    }
    return response.successOrThrow();
  }

  @override
  Future<void> resetPassword(String email) async {
    final body = { 'email': email };
    final response = await _api.resetPassword(body);
    return response.successOrThrow();
  }
  
  @override
  Future<void> resetPasswordValidate(ResetPasswordBodyDto body) async {
    final response = await _api.resetPasswordValidate(body.toJson());
    return response.successOrThrow();
  }

  @override
  Future<void> deleteAccount() async {
    final response = await _api.deleteAccount();
    return response.successOrThrow();
  }

  @override
  Future<String> getUserId() async {
    final response = await _api.getUserId();
    return response.parseOrThrow((data) => data['user_id']);
  }

  Future<void> _processTokensFromResponse(ServerResponse response) async {
    final accessToken =
        (response.data as Map<String, dynamic>)['access_token'] as String;
    final refreshToken = _parseRefreshToken(response);
    await _accessTokenRepo.setAccessToken(accessToken);
    await _accessTokenRepo.setRefreshToken(refreshToken);
  }

  String _parseRefreshToken(ServerResponse response) {
    final refreshTokenCookie = response.cookies!
        .firstWhere((cookie) => cookie.contains('refreshToken'));
    return refreshTokenCookie.substring(refreshTokenCookie.indexOf('=') + 1);
  }
}
