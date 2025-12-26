import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';

class CircularRevealPageRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget Function(BuildContext) builder;

  CircularRevealPageRouteBuilder({
    super.settings,
    required this.builder,
    Duration duration = CustomAnimationDurations.lowMedium,
    Duration reverseDuration = CustomAnimationDurations.low,
    super.opaque,
    super.barrierColor,
    super.barrierDismissible,
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          pageBuilder: (context, _, _) => builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final reveal = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOutQuart,
            ));

            final fade = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            ));

            return FadeTransition(
              opacity: fade,
              child: CircularRevealAnimation(
                animation: reveal,
                centerAlignment: Alignment.center,
                child: child,
              ),
            );
          },
        );
}
