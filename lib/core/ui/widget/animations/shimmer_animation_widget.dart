import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerAnimation extends StatelessWidget {
  const ShimmerAnimation({
    super.key,
    this.isEnabled = true,
    this.duration,
    this.interval,
  });

  final bool isEnabled;
  final Duration? duration;
  final Duration? interval;

  static const defaultDuration = Duration(milliseconds: 2000);
  static const defaultInterval = Duration(milliseconds: 3000);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Shimmer(
        enabled: isEnabled,
        colorOpacity: 0.3,
        color: Colors.white,
        duration: duration ?? defaultDuration,
        interval: interval ?? defaultInterval,
        child: const SizedBox.shrink(),
      ),
    );
  }
}
