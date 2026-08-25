// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreferencesDto _$UserPreferencesDtoFromJson(Map<String, dynamic> json) =>
    UserPreferencesDto(
      interests: (json['interest_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      notificationTime: json['notification_time'] as String,
      notificationsEnabled: json['notifications_enabled'] as bool,
      languageCode: json['language_code'] as String,
      themeMode: json['theme_mode'] as String,
      themeColorationId: (json['theme_coloration_id'] as num).toInt(),
      isHapticsEnabled: json['haptics_enabled'] as bool,
      selectedBackgroundId:
          (json['selected_background_id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$UserPreferencesDtoToJson(UserPreferencesDto instance) =>
    <String, dynamic>{
      'interest_ids': instance.interests,
      'notification_time': instance.notificationTime,
      'notifications_enabled': instance.notificationsEnabled,
      'language_code': instance.languageCode,
      'theme_mode': instance.themeMode,
      'theme_coloration_id': instance.themeColorationId,
      'haptics_enabled': instance.isHapticsEnabled,
      'selected_background_id': instance.selectedBackgroundId,
    };
