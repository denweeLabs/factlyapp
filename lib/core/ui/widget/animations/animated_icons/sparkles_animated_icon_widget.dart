import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/animations/lottie_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SparklesAnimatedIcon extends StatefulWidget {
  const SparklesAnimatedIcon({
    super.key,
    required this.animate,
    this.size = 14,
    this.delay,
  });

  final bool animate;
  final Duration? delay;
  final int size;

  @override
  State<SparklesAnimatedIcon> createState() => _SparklesAnimatedIconState();
}

class _SparklesAnimatedIconState extends State<SparklesAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 10000),
  );
  late final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(0.7, 1.0, curve: Curves.easeInOut),
    ),
  );

  @override
  void initState() {
    super.initState();
    if (widget.animate && widget.delay == null) {
      animate();
    } else if (widget.delay != null) {
      Future.delayed(widget.delay!, animate);
    }
  }

  @override
  void didUpdateWidget(covariant SparklesAnimatedIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate != oldWidget.animate) {
      widget.animate ? animate() : controller.stop();
    }
  }

  void animate() async {
    controller.loop();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LottieAnimation(
      path: AppConstants.assets.animations.sparkles,
      controller: animation,
      size: widget.size,
    );
  }
}
