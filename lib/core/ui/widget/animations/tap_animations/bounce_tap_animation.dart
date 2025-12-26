import 'package:denwee/core/ui/widget/animations/tap_animations/core_tap_bounce_animation.dart';
import 'package:flutter/material.dart';

class BounceTapAnimation extends StatelessWidget {
  const BounceTapAnimation({
    super.key,
    this.child,
    this.onTap,
    this.minScale = CoreTapBounceAnimation.defaultMinScale,
    this.isHaptics = true,
    this.alignment = Alignment.center,
  });

  final Widget? child;
  final VoidCallback? onTap;
  final double minScale;
  final bool isHaptics;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return CoreTapBounceAnimation(
      minScale: minScale,
      onTap: onTap,
      ignoreScale: onTap == null,
      isHaptics: isHaptics,
      alignment: alignment,
      builder: (_, __) => child ?? const SizedBox.shrink(),
    );
  }
}