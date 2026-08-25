// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseDto _$RegisterResponseDtoFromJson(Map<String, dynamic> json) =>
    RegisterResponseDto(
      accessToken: json['access_token'] as String,
      userId: json['user_id'] as String,
      profile: ProfileDto.fromJson(json['profile'] as Map<String, dynamic>),
      preferences: UserPreferencesDto.fromJson(
        json['preferences'] as Map<String, dynamic>,
      ),
    );
