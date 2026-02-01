import 'package:denwee/core/backgrounds/domain/entity/active_background.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'apply_background_result.freezed.dart';

@freezed
abstract class ApplyBackgroundResult with _$ApplyBackgroundResult {
  const factory ApplyBackgroundResult({
    required ActiveBackground activeBackground,
    required bool isPurchased,
    required int starsBalance,
    required List<UniqueId> unlockedBackgroundIds,
  }) = _ApplyBackgroundResult;
}
