import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';

class FadeSlideupPageRouteBuilder<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  FadeSlideupPageRouteBuilder({
    super.settings,
    required this.builder,
    Duration duration = CustomAnimationDurations.lowMedium,
    Duration reverseDuration = CustomAnimationDurations.ultraLow,
    double slideBegin = 0.07,
    super.barrierDismissible,
    super.barrierColor,
  }) : super(
          opaque: false,
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          pageBuilder: (context, _, _) => builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final fade = Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: const Interval(0.0, 0.6, curve: Curves.ease),
                reverseCurve: Curves.easeInOutQuint,
              ),
            );

            final slide = Tween<Offset>(
              begin: Offset(0.0, slideBegin),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: CustomAnimationCurves.fasterEaseInToSlowEaseOut,
                reverseCurve: Curves.easeInOut,
              ),
            );

            return SlideTransition(
              position: slide,
              child: FadeTransition(
                opacity: fade,
                child: child,
              ),
            );
          },
        );
}
