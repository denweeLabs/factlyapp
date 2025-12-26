import 'dart:ui';

import 'package:denwee/core/misc/domain/entity/i_entity.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_coloration.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class ThemeColoration with _$ThemeColoration implements IEntity {
  const factory ThemeColoration({
    required UniqueId id,
    required Color primary,
    required Color secondary,
  }) = _ThemeColoration;
}
