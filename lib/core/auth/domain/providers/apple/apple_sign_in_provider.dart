// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:math';

import 'package:denwee/core/auth/domain/providers/apple/apple_sign_in_provider_result.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:crypto/crypto.dart';

@LazySingleton()
class AppleSignInProvider {
  const AppleSignInProvider();

  Future<AppleSignInProviderResult?> authenticate() async {
    try {
      final rawNonce = _generateNonce();
      final hashedNonce = _sha256(rawNonce);

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: const [AppleIDAuthorizationScopes.email],
        nonce: hashedNonce,
      );

      if (credential.identityToken == null) {
        return null;
      }

      final result = AppleSignInProviderResult(
        idToken: credential.identityToken!,
        accessToken: credential.authorizationCode,
        nonce: rawNonce,
      );

      return result;
    } on SignInWithAppleAuthorizationException catch (error) {
      switch (error.code) {
        case AuthorizationErrorCode.canceled:
        case AuthorizationErrorCode.unknown:
          return null;
        default:
          rethrow;
      }
    }
  }

  String _generateNonce() {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();

    return List.generate(
      32,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  String _sha256(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
