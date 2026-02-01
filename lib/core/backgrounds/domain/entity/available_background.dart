import 'package:denwee/core/backgrounds/domain/entity/background_asset.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_category.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_style.dart';
import 'package:denwee/core/misc/domain/entity/i_entity.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_background.freezed.dart';

enum AvailableBackgroundType {
  image, 
  video;

  static AvailableBackgroundType fromString(String value) {
    switch (value) {
      case 'image': return AvailableBackgroundType.image;
      case 'video': return AvailableBackgroundType.video;
      default: throw 'Unsupported background type';
    }
  }
}

@freezed
abstract class AvailableBackground with _$AvailableBackground implements IEntity {
  const AvailableBackground._();
  const factory AvailableBackground({
    required UniqueId id,
    required int price,
    required bool isPremiumOnly,
    required BackgroundCategory category,
    required AvailableBackgroundType type,
    required BackgroundAsset asset,
    required BackgroundStyle style,
  }) = _AvailableBackground;

  bool get isFree => price <= 0;
}
