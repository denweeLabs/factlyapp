import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommonSkeletonItem extends StatelessWidget {
  const CommonSkeletonItem({
    super.key,
    required this.isEnabled,
    required this.child,
    this.ignorePointers = true,
    this.color,
  });

  final bool isEnabled;
  final bool ignorePointers;
  final Color? color;
  final Widget child;

  static const defaultEffect = ShimmerEffect(
    baseColor: Colors.white12,
    highlightColor: Colors.white24,
    duration: CustomAnimationDurations.lowMedium,
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  ShimmerEffect get effect {
    if (color != null) {
      return ShimmerEffect(
        baseColor: color!.withValues(alpha: .12),
        highlightColor: color!.withValues(alpha: .24),
        duration: defaultEffect.duration,
        begin: defaultEffect.begin,
        end: defaultEffect.end,
      );
    }
    return defaultEffect;
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isEnabled,
      ignorePointers: ignorePointers,
      effect: effect,
      child: child,
    );
  }
}
