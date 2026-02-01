import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_style.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'apply_background_body.freezed.dart';

@freezed
abstract class ApplyBackgroundBody with _$ApplyBackgroundBody {
  const factory ApplyBackgroundBody({
    required UniqueId backgroundId,
    required BackgroundStyle style,
  }) = _ApplyBackgroundBody;

  factory ApplyBackgroundBody.fromAvailableBackground(
    AvailableBackground background,
  ) {
    return ApplyBackgroundBody(
      backgroundId: background.id,
      style: background.style,
    );
  }
}
