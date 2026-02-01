import 'package:denwee/core/backgrounds/domain/entity/background_asset.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_style.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_background.freezed.dart';

@freezed
abstract class ActiveBackground with _$ActiveBackground {
  const factory ActiveBackground({
    required UniqueId id,
    required BackgroundAsset asset,
    required BackgroundStyle style,
  }) = _ActiveBackground;
}
