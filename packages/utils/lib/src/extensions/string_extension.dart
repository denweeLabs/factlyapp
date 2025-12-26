import 'package:utils/src/functions/helper_functions.dart';

extension StringExtension on String {
  // bool containLetter() {
  //   return contains(RegExp(r'[a-zA-Z]'));
  // }

  // bool containDigit() {
  //   return contains(RegExp(r'[0-9]'));
  // }

  // bool containSymbol() {
  //   return contains(
  //       RegExp(r'[@$()*+,-./:;<>=?\[\]\^_`~{}#?%&!\"\\|\u2018\u2019\u0027]'));
  // }

  String get capitalizeFirstLetter => capitalizeFirstCharacter(this);
}
