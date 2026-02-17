import 'package:denwee/presentation/widget/shared/animations/tap_animations/widget_hover_animation_provider.dart';
import 'package:flutter/material.dart';

class BounceTapFadeAnimation extends StatelessWidget {
  const BounceTapFadeAnimation({
    super.key,
    this.onTap,
    this.onLongTap,
    this.enableHapticFeedback = true,
    this.minScale = defaultMinScale,
    this.minFade = defaultMinFade,
    required this.child,
  });

  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final Widget child;
  final bool enableHapticFeedback;
  final double minScale;
  final double minFade;

  static const defaultMinScale = 0.94;
  static const defaultMinFade = 0.60;
  static const defaultScaleCurve = Curves.easeOutSine;
  static const defaultFadeCurve = Curves.easeInOutSine;

  @override
  Widget build(BuildContext context) {
    return WidgetHoverAnimationProvider(
      onTap: onTap,
      onLongTap: onLongTap,
      enableHapticFeedback: enableHapticFeedback,
      builder: (context, animation) {
        final scale = Tween(begin: 1.0, end: minScale).animate(
          CurvedAnimation(parent: animation, curve: defaultScaleCurve));

        final fade = Tween(begin: 1.0, end: minFade).animate(
          CurvedAnimation(parent: animation, curve: const Interval(0.5, 1.0, curve: defaultFadeCurve)));

        return FadeTransition(
          opacity: fade,
          child: ScaleTransition(scale: scale, child: child),
        );
      },
    );
  }
}
