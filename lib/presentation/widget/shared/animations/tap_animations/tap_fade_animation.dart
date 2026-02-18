import 'package:denwee/presentation/widget/shared/animations/tap_animations/widget_hover_animation_provider.dart';
import 'package:flutter/material.dart';

class TapFadeAnimation extends StatelessWidget {
  const TapFadeAnimation({
    super.key,
    this.onTap,
    this.onLongTap,
    this.enableHapticFeedback = true,
    this.minFade = defaultMinFade,
    required this.child,
  });

  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final Widget child;
  final bool enableHapticFeedback;
  final double minFade;

  static const defaultMinFade = 0.60;
  static const defaultFadeCurve = Curves.easeInOutSine;

  @override
  Widget build(BuildContext context) {
    return WidgetHoverAnimationProvider(
      onTap: onTap,
      onLongTap: onLongTap,
      enableHapticFeedback: enableHapticFeedback,
      builder: (context, animation) {
        final fade = Tween(begin: 1.0, end: minFade).animate(
          CurvedAnimation(parent: animation, curve: defaultFadeCurve));

        return FadeTransition(opacity: fade, child: child);
      },
    );
  }
}
