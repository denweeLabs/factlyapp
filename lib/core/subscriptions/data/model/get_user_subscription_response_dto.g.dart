// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_subscription_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserSubscriptionResponseDto _$GetUserSubscriptionResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetUserSubscriptionResponseDto(
  active: json['active'] == null
      ? null
      : UserSubscriptionDto.fromJson(json['active'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetUserSubscriptionResponseDtoToJson(
  GetUserSubscriptionResponseDto instance,
) => <String, dynamic>{'active': ?instance.active};
