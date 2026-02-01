import 'package:denwee/core/backgrounds/data/model/background_style_dto.dart';
import 'package:denwee/core/backgrounds/domain/entity/apply_background_body.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apply_background_body_dto.g.dart';

@JsonSerializable()
@immutable
class ApplyBackgroundBodyDto {
  @JsonKey(name: 'background_id') final int backgroundId;
  final BackgroundStyleDto style;

  const ApplyBackgroundBodyDto({
    required this.backgroundId,
    required this.style,
  });

  factory ApplyBackgroundBodyDto.fromDomain(ApplyBackgroundBody body) {
    return ApplyBackgroundBodyDto(
      backgroundId: body.backgroundId.value,
      style: BackgroundStyleDto.fromDomain(body.style),
    );
  }

  ApplyBackgroundBody toDomain() {
    return ApplyBackgroundBody(
      backgroundId: UniqueId.fromValue(backgroundId),
      style: style.toDomain(),
    );
  }

  factory ApplyBackgroundBodyDto.fromJson(Map<String, dynamic> json) =>
      _$ApplyBackgroundBodyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ApplyBackgroundBodyDtoToJson(this);
}
