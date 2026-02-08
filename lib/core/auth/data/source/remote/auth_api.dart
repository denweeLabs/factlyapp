import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:denwee/core/network/domain/repo/request_executor.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

abstract class AuthEndpoints {
  static const _base = '/member';

  static const login = '$_base/login';
  static const loginThirdParty = '$_base/login_oauth';
  static final register = '$_base/register';
  static final thirdPartyRegister = '$_base/register_oauth';
  static final signInAnonymously = '$_base/login_anonymously';
  static final changePassword = '$_base/account/change_password';
  static final resetPassword = '$_base/account/reset_password';
  static final resetPasswordValidate = '$_base/account/reset_password/validate';
  static final userIdentity = '$_base/identity';
  static final account = '$_base/account';
}

@LazySingleton()
class AuthApi {
  final RequestExecutor _client;

  const AuthApi(@API this._client);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  /// 
  Future<ServerResponse> login(Map<String, dynamic> body) {
    return _client.post(AuthEndpoints.login, body: body);
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  /// 
  Future<ServerResponse> loginThirdParty(Map<String, dynamic> body) {
    return _client.post(AuthEndpoints.loginThirdParty, body: body);
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> register(Map<String, dynamic> body) {
    return _client.post(AuthEndpoints.register, body: body);
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> thirdPartyRegister(Map<String, dynamic> body) {
    return _client.post(AuthEndpoints.thirdPartyRegister, body: body);
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> signInAnonymously(Map<String, dynamic> body) {
    return _client.post(AuthEndpoints.signInAnonymously, body: body);
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> changePassword(Map<String, dynamic> body) {
    return _client.post(AuthEndpoints.changePassword, body: body);
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> resetPassword(Map<String, dynamic> body) {
    return _client.post(AuthEndpoints.resetPassword, body: body);
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> resetPasswordValidate(Map<String, dynamic> body) {
    return _client.post(AuthEndpoints.resetPasswordValidate, body: body);
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> deleteAccount() {
    return _client.delete(AuthEndpoints.account);
  }

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  /// 
  Future<ServerResponse> getUserId() {
    return _client.get(AuthEndpoints.userIdentity);
  }
}