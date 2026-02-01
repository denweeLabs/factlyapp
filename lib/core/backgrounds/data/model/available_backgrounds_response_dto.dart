import 'package:dartz/dartz.dart';
import 'package:denwee/core/backgrounds/data/model/active_background_dto.dart';
import 'package:denwee/core/backgrounds/data/model/available_background_dto.dart';
import 'package:denwee/core/backgrounds/data/model/background_category_dto.dart';
import 'package:denwee/core/backgrounds/domain/entity/active_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'available_backgrounds_response_dto.g.dart';

@JsonSerializable(includeIfNull: false)
@immutable
class AvailableBackgroundsResponseDto {
  final List<BackgroundCategoryDto> categories;
  final List<AvailableBackgroundDto> backgrounds;
  @JsonKey(name: 'active_background') final ActiveBackgroundDto? activeBackground;

  const AvailableBackgroundsResponseDto({
    required this.categories,
    required this.backgrounds,
    required this.activeBackground,
  });

  List<AvailableBackground> backgroundsToDomain() {
    return backgrounds.mapWithCategories(categories);
  }

  Option<ActiveBackground> activeBackgroundToDomain() {
    return optionOf(activeBackground?.toDomain());
  }

  factory AvailableBackgroundsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AvailableBackgroundsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AvailableBackgroundsResponseDtoToJson(this);
}

extension ListOfAvailableBackgroundDtosX on List<AvailableBackgroundDto> {
  List<AvailableBackground> mapWithCategories(
    List<BackgroundCategoryDto> categories,
  ) {
    return map((b) {
      final category = categories.firstWhere((c) => c.id == b.categoryId);
      return b.toDomainWithCategory(category.toDomain());
    }).toList();
  }
}
