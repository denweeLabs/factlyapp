import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';

class FadeLoopAnimation extends StatelessWidget {
  const FadeLoopAnimation({
    super.key,
    this.child,
    this.control = Control.loop,
    this.enabled = true,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 1500),
  });

  final Widget? child;
  final Control control;
  final bool enabled;
  final Duration delay;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child ?? const SizedBox.shrink();
    
    return CustomAnimationBuilder<double>(
      control: control,
      delay: delay,
      duration: duration,
      curve: Curves.easeInOutCirc,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        final animationValue = value >= 0.5 ? 1.0 - value : value;
        return Opacity(opacity: 1.0 - animationValue, child: child);
      },
      child: child,
    );
  }
}
