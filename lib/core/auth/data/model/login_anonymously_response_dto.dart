import 'package:denwee/core/auth/domain/entity/login_anonymously_result.dart';
import 'package:denwee/core/profile/data/model/profile_dto.dart';
import 'package:denwee/core/statistics/data/model/user_statistics_dto.dart';
import 'package:denwee/core/user_preferences/data/model/user_preferences_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_anonymously_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class LoginAnonymouslyResponseDto {
  @JsonKey(name: 'access_token') final String accessToken;
  @JsonKey(name: 'user_id') final String userId;
  final ProfileDto profile;
  final UserPreferencesDto preferences;
  final UserStatisticsDto statistics;

  const LoginAnonymouslyResponseDto({
    required this.accessToken,
    required this.userId,
    required this.profile,
    required this.preferences,
    required this.statistics,
  });

  factory LoginAnonymouslyResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginAnonymouslyResponseDtoFromJson(json);

  LoginAnonymouslyResult toResult() => LoginAnonymouslyResult(
        userId: userId,
        profile: profile.toDomain(),
        preferences: preferences.toDomain(),
        statistics: statistics.toDomain(),
      );
}
