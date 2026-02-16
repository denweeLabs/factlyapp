import 'package:denwee/presentation/widget/shared/animations/tap_animations/widget_hover_animation_provider.dart';
import 'package:flutter/material.dart';

class BounceTapAnimation extends StatelessWidget {
  const BounceTapAnimation({
    super.key,
    this.onTap,
    this.onLongTap,
    this.enableHapticFeedback = true,
    this.minScale = defaultMinScale,
    required this.child,
  });

  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final Widget child;
  final bool enableHapticFeedback;
  final double minScale;

  static const defaultMinScale = 0.94;
  static const defaultScaleCurve = Curves.easeOutSine;

  @override
  Widget build(BuildContext context) {
    return WidgetHoverAnimationProvider(
      onTap: onTap,
      onLongTap: onLongTap,
      enableHapticFeedback: enableHapticFeedback,
      builder: (context, animation) {
        final scale = Tween(begin: 1.0, end: minScale).animate(
          CurvedAnimation(parent: animation, curve: defaultScaleCurve));

        return ScaleTransition(scale: scale, child: child);
      },
    );
  }
}
