// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_background_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableBackgroundDto _$AvailableBackgroundDtoFromJson(
  Map<String, dynamic> json,
) => AvailableBackgroundDto(
  id: (json['id'] as num).toInt(),
  price: (json['price'] as num).toInt(),
  categoryId: (json['category_id'] as num).toInt(),
  isPremiumOnly: json['is_premium_only'] as bool,
  asset: BackgroundAssetDto.fromJson(json['asset'] as Map<String, dynamic>),
  style: BackgroundStyleDto.fromJson(json['style'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AvailableBackgroundDtoToJson(
  AvailableBackgroundDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'price': instance.price,
  'category_id': instance.categoryId,
  'is_premium_only': instance.isPremiumOnly,
  'asset': instance.asset,
  'style': instance.style,
};
