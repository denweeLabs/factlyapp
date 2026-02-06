import 'package:flutter/material.dart';

@immutable
class GoogleSignInProviderResult {
  final String idToken;
  final String email;
  
  const GoogleSignInProviderResult({
    required this.idToken,
    required this.email,
  });
}
