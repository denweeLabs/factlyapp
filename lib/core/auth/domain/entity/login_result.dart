import 'package:denwee/core/profile/domain/entity/profile.dart';
import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_result.freezed.dart';

@freezed
abstract class LoginResult with _$LoginResult {
  const factory LoginResult({
    required Profile profile,
    required UserPreferences preferences,
  }) = _LoginResult;
}
