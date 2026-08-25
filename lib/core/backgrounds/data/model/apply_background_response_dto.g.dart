// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_background_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyBackgroundResponseDto _$ApplyBackgroundResponseDtoFromJson(
  Map<String, dynamic> json,
) => ApplyBackgroundResponseDto(
  backgroundId: (json['background_id'] as num).toInt(),
  starsBalance: (json['stars_balance'] as num).toInt(),
  unlockedBackgroundIds: (json['unlocked_background_ids'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  selectedBackgroundId: (json['selected_background_id'] as num).toInt(),
  purchased: json['purchased'] as bool,
  asset: BackgroundAssetDto.fromJson(json['asset'] as Map<String, dynamic>),
  style: BackgroundStyleDto.fromJson(json['style'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ApplyBackgroundResponseDtoToJson(
  ApplyBackgroundResponseDto instance,
) => <String, dynamic>{
  'background_id': instance.backgroundId,
  'stars_balance': instance.starsBalance,
  'unlocked_background_ids': instance.unlockedBackgroundIds,
  'selected_background_id': instance.selectedBackgroundId,
  'purchased': instance.purchased,
  'asset': instance.asset,
  'style': instance.style,
};
