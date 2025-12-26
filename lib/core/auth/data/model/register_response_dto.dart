import 'package:denwee/core/profile/data/model/profile_dto.dart';
import 'package:denwee/core/auth/domain/entity/register_result.dart';
import 'package:denwee/core/user_preferences/data/model/user_preferences_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class RegisterResponseDto {
  @JsonKey(name: 'access_token')
  final String accessToken;
  final ProfileDto profile;
  final UserPreferencesDto preferences;

  const RegisterResponseDto({
    required this.accessToken,
    required this.profile,
    required this.preferences,
  });

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseDtoFromJson(json);

  RegisterResult toResult() => RegisterResult(
        profile: profile.toDomain(),
        preferences: preferences.toDomain(),
      );
}
