import 'package:denwee/core/backgrounds/data/model/background_asset_dto.dart';
import 'package:denwee/core/backgrounds/data/model/background_style_dto.dart';
import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_category.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'available_background_dto.g.dart';

@JsonSerializable()
@immutable
class AvailableBackgroundDto {
  final int id;
  final int price;
  @JsonKey(name: 'category_id') final int categoryId;
  @JsonKey(name: 'is_premium_only') final bool isPremiumOnly;
  final BackgroundAssetDto asset;
  final BackgroundStyleDto style;

  const AvailableBackgroundDto({
    required this.id,
    required this.price,
    required this.categoryId,
    required this.isPremiumOnly,
    required this.asset,
    required this.style,
  });

  factory AvailableBackgroundDto.fromDomain(AvailableBackground background) {
    return AvailableBackgroundDto(
      id: background.id.value,
      price: background.price,
      categoryId: background.category.id.value,
      isPremiumOnly: background.isPremiumOnly,
      asset: BackgroundAssetDto.fromDomain(background.asset),
      style: BackgroundStyleDto.fromDomain(background.style),
    );
  }

  AvailableBackground toDomainWithCategory(BackgroundCategory category) {
    return AvailableBackground(
      id: UniqueId.fromValue(id),
      price: price,
      category: category,
      isPremiumOnly: isPremiumOnly,
      type: AvailableBackgroundType.fromString(asset.type),
      asset: asset.toDomain(),
      style: style.toDomain(),
    );
  }

  factory AvailableBackgroundDto.fromJson(Map<String, dynamic> json) =>
      _$AvailableBackgroundDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableBackgroundDtoToJson(this);
}