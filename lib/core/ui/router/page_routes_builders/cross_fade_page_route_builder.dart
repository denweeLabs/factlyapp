import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';

class CrossFadePageRouteBuilder<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  CrossFadePageRouteBuilder({
    super.settings,
    required this.builder,
    Duration duration = CustomAnimationDurations.low,
    Duration reverseDuration = CustomAnimationDurations.ultraLow,
    super.opaque,
    super.barrierColor,
    super.barrierDismissible,
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          pageBuilder: (context, _, _) => builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOutCubic,
                reverseCurve: Curves.easeInOutCubic,
              ),
            );
            return FadeTransition(
              opacity: fade,
              child: child,
            );
          },
        );
}
