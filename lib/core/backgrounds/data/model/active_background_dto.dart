import 'package:denwee/core/backgrounds/data/model/background_asset_dto.dart';
import 'package:denwee/core/backgrounds/data/model/background_style_dto.dart';
import 'package:denwee/core/backgrounds/domain/entity/active_background.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'active_background_dto.g.dart';

@JsonSerializable()
@immutable
class ActiveBackgroundDto {
  @JsonKey(name: 'background_id') final int backgroundId;
  final BackgroundAssetDto asset;
  final BackgroundStyleDto style;

  const ActiveBackgroundDto({
    required this.backgroundId,
    required this.asset,
    required this.style,
  });

  factory ActiveBackgroundDto.fromDomain(ActiveBackground active) {
    return ActiveBackgroundDto(
      backgroundId: active.id.value,
      asset: BackgroundAssetDto.fromDomain(active.asset),
      style: BackgroundStyleDto.fromDomain(active.style),
    );
  }

  ActiveBackground toDomain() {
    return ActiveBackground(
      id: UniqueId.fromValue(backgroundId),
      asset: asset.toDomain(),
      style: style.toDomain(),
    );
  }

  factory ActiveBackgroundDto.fromJson(Map<String, dynamic> json) =>
      _$ActiveBackgroundDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveBackgroundDtoToJson(this);
}
