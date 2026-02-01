import 'package:denwee/core/backgrounds/data/model/background_asset_dto.dart';
import 'package:denwee/core/backgrounds/data/model/background_style_dto.dart';
import 'package:denwee/core/backgrounds/domain/entity/active_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/apply_background_result.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apply_background_response_dto.g.dart';

@JsonSerializable()
@immutable
class ApplyBackgroundResponseDto {
  @JsonKey(name: 'background_id') final int backgroundId;
  @JsonKey(name: 'stars_balance') final int starsBalance;
  @JsonKey(name: 'unlocked_background_ids') final List<int> unlockedBackgroundIds;
  @JsonKey(name: 'selected_background_id') final int selectedBackgroundId;
  final bool purchased;
  final BackgroundAssetDto asset;
  final BackgroundStyleDto style;

  const ApplyBackgroundResponseDto({
    required this.backgroundId,
    required this.starsBalance,
    required this.unlockedBackgroundIds,
    required this.selectedBackgroundId,
    required this.purchased,
    required this.asset,
    required this.style,
  });

  factory ApplyBackgroundResponseDto.fromDomain(ApplyBackgroundResult result) {
    return ApplyBackgroundResponseDto(
      starsBalance: result.starsBalance,
      purchased: result.isPurchased,
      unlockedBackgroundIds: result.unlockedBackgroundIds.map((e) => e.value).toList(),
      backgroundId: result.activeBackground.id.value,
      selectedBackgroundId: result.activeBackground.id.value,
      asset: BackgroundAssetDto.fromDomain(result.activeBackground.asset),
      style: BackgroundStyleDto.fromDomain(result.activeBackground.style),
    );
  }

  ApplyBackgroundResult toDomain() {
    return ApplyBackgroundResult(
      starsBalance: starsBalance,
      isPurchased: purchased,
      unlockedBackgroundIds: unlockedBackgroundIds.map(UniqueId.fromValue).toList(),
      activeBackground: ActiveBackground(
        id: UniqueId.fromValue(backgroundId),
        asset: asset.toDomain(),
        style: style.toDomain(),
      ),
    );
  }

  factory ApplyBackgroundResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ApplyBackgroundResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ApplyBackgroundResponseDtoToJson(this);
}
