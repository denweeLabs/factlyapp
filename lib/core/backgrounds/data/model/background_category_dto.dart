import 'package:denwee/core/backgrounds/domain/entity/background_category.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'background_category_dto.g.dart';

@JsonSerializable()
@immutable
class BackgroundCategoryDto {
  final int id;
  final String title;

  const BackgroundCategoryDto({
    required this.id,
    required this.title,
  });

  factory BackgroundCategoryDto.fromDomain(BackgroundCategory category) {
    return BackgroundCategoryDto(
      id: category.id.value,
      title: category.title,
    );
  }

  BackgroundCategory toDomain() {
    return BackgroundCategory(
      id: UniqueId.fromValue(id),
      title: title,
    );
  }

  factory BackgroundCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$BackgroundCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BackgroundCategoryDtoToJson(this);
}