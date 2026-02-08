import 'package:flutter/material.dart';

@immutable
class AppleSignInProviderResult {
  final String idToken;
  final String accessToken;
  final String nonce;
  
  const AppleSignInProviderResult({
    required this.idToken,
    required this.accessToken,
    required this.nonce,
  });
}
