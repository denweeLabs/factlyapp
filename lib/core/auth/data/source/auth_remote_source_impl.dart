import 'package:denwee/core/auth/data/model/change_password_body_dto.dart';
import 'package:denwee/core/auth/data/model/login_anonymously_response_dto.dart';
import 'package:denwee/core/auth/data/model/login_body_dto.dart';
import 'package:denwee/core/auth/data/model/login_response_dto.dart';
import 'package:denwee/core/auth/data/model/register_body_dto.dart';
import 'package:denwee/core/auth/data/model/register_response_dto.dart';
import 'package:denwee/core/auth/data/model/reset_password_body_dto.dart';
import 'package:denwee/core/auth/data/model/third_party_login_body_dto.dart';
import 'package:denwee/core/auth/data/model/third_party_register_body_dto.dart';
import 'package:denwee/core/auth/domain/repo/access_token_repo.dart';
import 'package:denwee/core/auth/domain/source/auth_remote_source.dart';
import 'package:denwee/core/network/data/model/server_error_response.dart';
import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:denwee/core/network/domain/request_executor/request_executor.dart';
import 'package:denwee/core/user_preferences/data/model/user_preferences_dto.dart';
import 'package:denwee/di/api/endpoints/endpoints.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRemoteSource)
class AuthRemoteSourceImpl implements AuthRemoteSource {
  final RequestExecutor _requestExecutor;
  final AccessTokenRepo _accessTokenRepo;

  const AuthRemoteSourceImpl(
    @API this._requestExecutor,
    this._accessTokenRepo,
  );

  @override
  Future<LoginResponseDto> login(LoginBodyDto body) async {
    final response = await _requestExecutor.post(
      Endpoints.member.login,
      body: body.toJson(),
    );
    final data = response.data as Map<String, dynamic>;

    if (response.isSuccessful) {
      await _processTokensFromResponse(response);
      return LoginResponseDto.fromJson(data);
    } else {
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<LoginResponseDto> thirdPartyLogin(ThirdPartyLoginBodyDto body) async {
    final response = await _requestExecutor.post(
      Endpoints.member.loginThirdParty,
      body: body.toJson(),
    );
    final data = response.data as Map<String, dynamic>;
    if (response.isSuccessful) {
      await _processTokensFromResponse(response);
      return LoginResponseDto.fromJson(data);
    } else {
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<RegisterResponseDto> register(RegisterBodyDto body) async {
    final response = await _requestExecutor.post(
      Endpoints.member.register,
      body: body.toJson(),
    );
    final data = response.data as Map<String, dynamic>;
    if (response.isSuccessful) {
      await _processTokensFromResponse(response);
      return RegisterResponseDto.fromJson(data);
    } else {
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<RegisterResponseDto> thirdPartyRegister(ThirdPartyRegisterBodyDto body) async {
    final response = await _requestExecutor.post(
      Endpoints.member.thirdPartyRegister,
      body: body.toJson(),
    );
    
    final data = response.data as Map<String, dynamic>;
    if (response.isSuccessful) {
      await _processTokensFromResponse(response);
      return RegisterResponseDto.fromJson(data);
    } else {
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<LoginAnonymouslyResponseDto> signInAnonymously(
    UserPreferencesDto preferencesDto,
  ) async {
    final body = preferencesDto.toJson();
    final response = await _requestExecutor.post(
      Endpoints.member.signInAnonymously,
      body: body,
    );
    final data = response.data as Map<String, dynamic>;

    if (response.isSuccessful) {
      await _processTokensFromResponse(response);
      return LoginAnonymouslyResponseDto.fromJson(data);
    } else {
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<void> changePassword(ChangePasswordBodyDto bodyDto) async {
    final response = await _requestExecutor.post(
      Endpoints.member.changePassword,
      body: bodyDto.toJson(),
    );
    if (response.isSuccessful) {
      await _processTokensFromResponse(response);
    } else {
      final data = response.data as Map<String, dynamic>;
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    final body = { 'email': email };
    final response = await _requestExecutor.post(
      Endpoints.member.resetPassword,
      body: body,
    );
    if (!response.isSuccessful) {
      final data = response.data as Map<String, dynamic>;
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }
  
  @override
  Future<void> resetPasswordValidate(ResetPasswordBodyDto bodyDto) async {
    final response = await _requestExecutor.post(
      Endpoints.member.resetPasswordValidate,
      body: bodyDto.toJson(),
    );
    if (!response.isSuccessful) {
      final data = response.data as Map<String, dynamic>;
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<void> deleteAccount() async {
    final response = await _requestExecutor.delete(Endpoints.member.account);
    if (!response.isSuccessful) {
      final data = response.data as Map<String, dynamic>;
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<String> getUserId() async {
    final response = await _requestExecutor.get(Endpoints.member.userIdentity);
    final data = response.data as Map<String, dynamic>;

    if (response.isSuccessful) {
      final userId = data['user_id'] as String;
      return userId;
    } else {
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  String _parseRefreshToken(ServerResponse response) {
    final refreshTokenCookie = response.cookies!
        .firstWhere((cookie) => cookie.contains('refreshToken'));
    return refreshTokenCookie.substring(refreshTokenCookie.indexOf('=') + 1);
  }

  Future<void> _processTokensFromResponse(ServerResponse response) async {
    final accessToken =
        (response.data as Map<String, dynamic>)['access_token'] as String;
    final refreshToken = _parseRefreshToken(response);
    await _accessTokenRepo.setAccessToken(accessToken);
    await _accessTokenRepo.setRefreshToken(refreshToken);
  }
}
