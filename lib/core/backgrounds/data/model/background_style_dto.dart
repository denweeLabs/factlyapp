import 'package:denwee/core/backgrounds/domain/entity/background_style.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:utils/utils.dart';

part 'background_style_dto.g.dart';

@JsonSerializable()
@immutable
class BackgroundStyleDto {
  @JsonKey(name: 'text_font') final String textFont;
  @JsonKey(name: 'text_size') final int textSize;
  @JsonKey(name: 'text_color') final String textColor;
  @JsonKey(name: 'background_fade') final double backgroundFade;
  @JsonKey(name: 'background_fade_color') final String backgroundFadeColor;

  const BackgroundStyleDto({
    required this.textFont,
    required this.textSize,
    required this.textColor,
    required this.backgroundFade,
    required this.backgroundFadeColor,
  });

  factory BackgroundStyleDto.fromDomain(BackgroundStyle style) {
    return BackgroundStyleDto(
      textFont: style.textFont,
      textSize: style.textSize,
      textColor: const ColorJsonConverterNoAlpha().toJson(
        style.textColor,
      ),
      backgroundFade: style.backgroundFade,
      backgroundFadeColor: const ColorJsonConverterNoAlpha().toJson(
        style.backgroundFadeColor,
      ),
    );
  }

  BackgroundStyle toDomain() {
    return BackgroundStyle(
      textFont: textFont,
      textSize: textSize,
      textColor: const ColorJsonConverterNoAlpha().fromJson(textColor),
      backgroundFade: backgroundFade,
      backgroundFadeColor: const ColorJsonConverterNoAlpha().fromJson(backgroundFadeColor),
    );
  }

  factory BackgroundStyleDto.fromJson(Map<String, dynamic> json) =>
      _$BackgroundStyleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BackgroundStyleDtoToJson(this);
}