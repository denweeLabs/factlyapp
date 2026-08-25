// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseDto _$LoginResponseDtoFromJson(Map<String, dynamic> json) =>
    LoginResponseDto(
      accessToken: json['access_token'] as String,
      userId: json['user_id'] as String,
      profile: ProfileDto.fromJson(json['profile'] as Map<String, dynamic>),
      preferences: UserPreferencesDto.fromJson(
        json['preferences'] as Map<String, dynamic>,
      ),
      statistics: UserStatisticsDto.fromJson(
        json['statistics'] as Map<String, dynamic>,
      ),
      subscription: GetUserSubscriptionResponseDto.fromJson(
        json['subscription'] as Map<String, dynamic>,
      ),
      archivedFactIds: (json['archived_fact_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );
