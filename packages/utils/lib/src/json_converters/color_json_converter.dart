import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class ColorJsonConverterNoAlpha extends JsonConverter<Color, String> {
  const ColorJsonConverterNoAlpha();

  @override
  Color fromJson(String json) {
    final hex = json.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  @override
  String toJson(Color object) {
    final argb = object.toARGB32();
    final hex = argb.toRadixString(16).padLeft(8, '0');
    return '#${hex.substring(2).toUpperCase()}';
  }
}