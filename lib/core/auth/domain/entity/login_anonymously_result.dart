import 'package:denwee/core/profile/domain/entity/profile.dart';
import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_anonymously_result.freezed.dart';

@freezed
abstract class LoginAnonymouslyResult with _$LoginAnonymouslyResult {
  const factory LoginAnonymouslyResult({
    required Profile profile,
    required UserPreferences preferences,
  }) = _LoginAnonymouslyResult;
}
