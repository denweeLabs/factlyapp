import 'package:dartz/dartz.dart';
import 'package:flutter/painting.dart';

extension EitherX<L, R> on Either<L, R> {
  (L?, R?) getEntries() {
    final left = fold((l) => l, (_) => null);
    final right = fold((_) => null, (r) => r);
    return (left, right);
  }
}

extension DurationX on Duration {
  Duration get half => Duration(
        milliseconds: inMilliseconds ~/ 2,
      );
}

extension LocaleX on Locale {
  Locale get onlyLangCode => Locale(languageCode);
  bool get isEn => languageCode == 'en';
  bool get isRu => languageCode == 'ru';
}
