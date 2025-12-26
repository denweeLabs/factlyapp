import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_language.freezed.dart';

@freezed
abstract class AppLanguage with _$AppLanguage {
  const factory AppLanguage({
    required Locale locale,
    required String nativeName,
    required String englishName,
  }) = _AppLanguage;
}
