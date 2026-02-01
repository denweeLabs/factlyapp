import 'package:dartz/dartz.dart';
import 'package:flutter/painting.dart';

extension EitherX<L, R> on Either<L, R> {
  (L?, R?) getEntries() {
    final left = fold((l) => l, (_) => null);
    final right = fold((_) => null, (r) => r);
    return (left, right);
  }
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
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
