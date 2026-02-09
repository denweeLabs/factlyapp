import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'third_party_login_body.freezed.dart';

enum ThirdPartyAuthProvider {
  google('google'),
  apple('apple');

  final String apiType;
  const ThirdPartyAuthProvider(this.apiType);
}

enum AppSupportedAuthProvider {
  email,
  google,
  apple;

  static AppSupportedAuthProvider fromString(String value) {
    switch (value) {
      case 'google': return AppSupportedAuthProvider.google;
      case 'apple': return AppSupportedAuthProvider.apple;
      default: return AppSupportedAuthProvider.email;
    }
  }
}

@Freezed(toJson: false, fromJson: false)
abstract class ThirdPartyLoginBody with _$ThirdPartyLoginBody {
  const factory ThirdPartyLoginBody({
    required ThirdPartyAuthProvider provider,
    required String idToken,
    required Option<String> accessToken,
    required Option<String> nonce,
  }) = _ThirdPartyLoginBody;

  factory ThirdPartyLoginBody.google({required String idToken}) {
    return ThirdPartyLoginBody(
      provider: ThirdPartyAuthProvider.google,
      idToken: idToken,
      accessToken: const None(),
      nonce: const None(),
    );
  }

  factory ThirdPartyLoginBody.apple({
    required String idToken,
    required String nonce,
  }) {
    return ThirdPartyLoginBody(
      provider: ThirdPartyAuthProvider.apple,
      idToken: idToken,
      accessToken: const None(),
      nonce: Some(nonce),
    );
  }
}
