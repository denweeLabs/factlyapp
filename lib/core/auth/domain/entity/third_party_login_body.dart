import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'third_party_login_body.freezed.dart';

enum ThirdPartyAuthProvider {
  google('google');

  final String apiType;
  const ThirdPartyAuthProvider(this.apiType);
}

enum AppSupportedAuthProvider {
  email,
  google;

  static AppSupportedAuthProvider fromString(String value) {
    switch (value) {
      case 'google': return AppSupportedAuthProvider.google;
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
  }) = _ThirdPartyLoginBody;

  factory ThirdPartyLoginBody.google({required String idToken}) {
    return ThirdPartyLoginBody(
      provider: ThirdPartyAuthProvider.google,
      idToken: idToken,
      accessToken: const None(),
    );
  }
}
