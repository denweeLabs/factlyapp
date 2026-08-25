// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_backgrounds_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableBackgroundsResponseDto _$AvailableBackgroundsResponseDtoFromJson(
  Map<String, dynamic> json,
) => AvailableBackgroundsResponseDto(
  categories: (json['categories'] as List<dynamic>)
      .map((e) => BackgroundCategoryDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  backgrounds: (json['backgrounds'] as List<dynamic>)
      .map((e) => AvailableBackgroundDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  activeBackground: json['active_background'] == null
      ? null
      : ActiveBackgroundDto.fromJson(
          json['active_background'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$AvailableBackgroundsResponseDtoToJson(
  AvailableBackgroundsResponseDto instance,
) => <String, dynamic>{
  'categories': instance.categories,
  'backgrounds': instance.backgrounds,
  'active_background': ?instance.activeBackground,
};
