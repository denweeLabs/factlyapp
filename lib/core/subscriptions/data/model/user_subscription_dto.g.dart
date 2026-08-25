// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_subscription_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSubscriptionDto _$UserSubscriptionDtoFromJson(Map<String, dynamic> json) =>
    UserSubscriptionDto(
      packageId: json['package_id'] as String,
      expiresAt: DateTime.parse(json['expires_at'] as String),
    );

Map<String, dynamic> _$UserSubscriptionDtoToJson(
  UserSubscriptionDto instance,
) => <String, dynamic>{
  'package_id': instance.packageId,
  'expires_at': instance.expiresAt.toIso8601String(),
};
