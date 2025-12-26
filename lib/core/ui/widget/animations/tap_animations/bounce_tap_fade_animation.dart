import 'package:denwee/core/ui/widget/animations/tap_animations/core_tap_bounce_animation.dart';
import 'package:flutter/material.dart';

class BounceTapFadeAnimation extends StatelessWidget {
  const BounceTapFadeAnimation({
    super.key,
    this.child,
    this.onTap,
    this.minScale = CoreTapBounceAnimation.defaultMinScale,
    this.alignment = Alignment.center,
  });

  final Widget? child;
  final VoidCallback? onTap;
  final double minScale;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return CoreTapBounceAnimation(
      minScale: minScale,
      onTap: onTap,
      ignoreScale: onTap == null,
      alignment: alignment,
      builder: (_, isHovered) => AnimatedOpacity(
        opacity: isHovered ? 0.6 : 1.0,
        duration: CoreTapBounceAnimation.duration,
        curve: CoreTapBounceAnimation.curve,
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}