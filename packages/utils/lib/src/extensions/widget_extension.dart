import 'package:flutter/material.dart';

extension WidgetListExtension on List<Widget> {
  List<Widget> insertBetween(Widget separator) {
    if (isEmpty) return this;
    final result = <Widget>[];
    for (int i = 0; i < length; i++) {
      result.add(this[i]);
      if (i != length - 1) result.add(separator);
    }
    return result;
  }
}

extension BoxShadowX on BoxShadow {
  BoxShadow withTapResponse(bool isHovered) {
    return BoxShadow(
      color: color,
      spreadRadius: spreadRadius,
      offset: isHovered ? Offset.zero : offset,
      blurRadius: isHovered ? 0.0 : blurRadius,
    );
  }
}
