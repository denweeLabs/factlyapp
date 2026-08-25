// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_anonymously_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginAnonymouslyResponseDto _$LoginAnonymouslyResponseDtoFromJson(
  Map<String, dynamic> json,
) => LoginAnonymouslyResponseDto(
  accessToken: json['access_token'] as String,
  userId: json['user_id'] as String,
  profile: ProfileDto.fromJson(json['profile'] as Map<String, dynamic>),
  preferences: UserPreferencesDto.fromJson(
    json['preferences'] as Map<String, dynamic>,
  ),
  statistics: UserStatisticsDto.fromJson(
    json['statistics'] as Map<String, dynamic>,
  ),
);
