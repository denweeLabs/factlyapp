// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_data_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberDataResponseDto _$MemberDataResponseDtoFromJson(
  Map<String, dynamic> json,
) => MemberDataResponseDto(
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
