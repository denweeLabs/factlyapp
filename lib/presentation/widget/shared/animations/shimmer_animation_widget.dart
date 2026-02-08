import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerAnimation extends StatelessWidget {
  const ShimmerAnimation({
    super.key,
    this.isEnabled = true,
    this.duration,
    this.interval,
    this.color,
    this.colorOpacity = 0.3,
  });

  final bool isEnabled;
  final Duration? duration;
  final Duration? interval;
  final Color? color;
  final double colorOpacity;

  static const defaultDuration = Duration(milliseconds: 2000);
  static const defaultInterval = Duration(milliseconds: 3000);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Shimmer(
        enabled: isEnabled,
        colorOpacity: colorOpacity,
        color: color ?? Colors.white,
        duration: duration ?? defaultDuration,
        interval: interval ?? defaultInterval,
        child: const SizedBox.shrink(),
      ),
    );
  }
}
