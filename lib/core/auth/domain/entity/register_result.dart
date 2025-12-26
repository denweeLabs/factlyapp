import 'package:denwee/core/profile/domain/entity/profile.dart';
import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_result.freezed.dart';

@freezed
abstract class RegisterResult with _$RegisterResult {
  const factory RegisterResult({
    required Profile profile,
    required UserPreferences preferences,
  }) = _RegisterResult;
}
