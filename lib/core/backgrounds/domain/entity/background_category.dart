import 'package:denwee/core/misc/domain/entity/i_entity.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'background_category.freezed.dart';

@freezed
abstract class BackgroundCategory with _$BackgroundCategory implements IEntity {
  const factory BackgroundCategory({
    required UniqueId id,
    required String title,
  }) = _BackgroundCategory;
}
