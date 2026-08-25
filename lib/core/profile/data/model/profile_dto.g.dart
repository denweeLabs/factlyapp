// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) => ProfileDto(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String?,
  name: json['name'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  isAnonymous: json['is_anonymous'] as bool? ?? false,
  unlockedBackgrounds:
      (json['unlocked_background_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  authProvider: _authProviderFromJson(json['raw_app_meta_data']),
);

Map<String, dynamic> _$ProfileDtoToJson(ProfileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': ?instance.email,
      'name': ?instance.name,
      'avatar_url': ?instance.avatarUrl,
      'created_at': ?instance.createdAt?.toIso8601String(),
      'is_anonymous': instance.isAnonymous,
      'unlocked_background_ids': instance.unlockedBackgrounds,
      'raw_app_meta_data': _authProviderToJson(instance.authProvider),
    };
