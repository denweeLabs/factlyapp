import 'dart:ui';
import 'package:flutter/material.dart';

class AnimatedSwitchers {
  static Widget fadeBlurXTransition(
    Widget child,
    Animation<double> animation, {
    double blurX = 20.0,
    double blurY = 5.0,
  }) {
    return FadeTransition(
      key: ValueKey<Key?>(child.key),
      opacity: animation,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final x = blurX - blurX * animation.value;
          final y = blurY - blurY * animation.value;

          return ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: x,
              sigmaY: y,
            ),
            child: child!,
          );
        },
        child: child,
      ),
    );
  }
  static Widget fadeBlurXYTransition(
    Widget child,
    Animation<double> animation, {
    double blurX = 20.0,
    double blurY = 20.0,
  }) {
    return FadeTransition(
      key: ValueKey<Key?>(child.key),
      opacity: animation,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final x = blurX - blurX * animation.value;
          final y = blurY - blurY * animation.value;

          return ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: x,
              sigmaY: y,
            ),
            child: child!,
          );
        },
        child: child,
      ),
    );
  }
}
