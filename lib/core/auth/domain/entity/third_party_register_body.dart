import 'package:dartz/dartz.dart';
import 'package:denwee/core/auth/domain/entity/third_party_login_body.dart';
import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'third_party_register_body.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class ThirdPartyRegisterBody with _$ThirdPartyRegisterBody {
  const factory ThirdPartyRegisterBody({
    required ThirdPartyAuthProvider provider,
    required String idToken,
    required Option<String> accessToken,
    required UserPreferences preferences,
  }) = _ThirdPartyRegisterBody;

  factory ThirdPartyRegisterBody.google({
    required String idToken,
    required UserPreferences preferences,
  }) {
    return ThirdPartyRegisterBody(
      provider: ThirdPartyAuthProvider.google,
      idToken: idToken,
      accessToken: const None(),
      preferences: preferences,
    );
  }
}
