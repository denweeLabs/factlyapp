// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_style_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundStyleDto _$BackgroundStyleDtoFromJson(Map<String, dynamic> json) =>
    BackgroundStyleDto(
      textFont: json['text_font'] as String,
      textSize: (json['text_size'] as num).toInt(),
      textColor: json['text_color'] as String,
      backgroundFade: (json['background_fade'] as num).toDouble(),
      backgroundFadeColor: json['background_fade_color'] as String,
    );

Map<String, dynamic> _$BackgroundStyleDtoToJson(BackgroundStyleDto instance) =>
    <String, dynamic>{
      'text_font': instance.textFont,
      'text_size': instance.textSize,
      'text_color': instance.textColor,
      'background_fade': instance.backgroundFade,
      'background_fade_color': instance.backgroundFadeColor,
    };
