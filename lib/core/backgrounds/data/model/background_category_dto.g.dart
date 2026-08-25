// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundCategoryDto _$BackgroundCategoryDtoFromJson(
  Map<String, dynamic> json,
) => BackgroundCategoryDto(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
);

Map<String, dynamic> _$BackgroundCategoryDtoToJson(
  BackgroundCategoryDto instance,
) => <String, dynamic>{'id': instance.id, 'title': instance.title};
