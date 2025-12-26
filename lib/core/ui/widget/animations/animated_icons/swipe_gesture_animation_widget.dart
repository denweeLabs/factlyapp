import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/animations/lottie_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SwipeGestureAnimation extends StatefulWidget {
  const SwipeGestureAnimation({
    super.key,
    required this.delay,
    this.size = 160,
  });

  final Duration delay;
  final int size;

  @override
  State<SwipeGestureAnimation> createState() => _SwipeGestureAnimationState();
}

class _SwipeGestureAnimationState extends State<SwipeGestureAnimation>
    with SingleTickerProviderStateMixin {
  static const duration = Duration(milliseconds: 1600);

  late final controller = AnimationController(vsync: this, duration: duration);

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      controller.loop();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LottieAnimation(
      path: AppConstants.assets.animations.swipeUp,
      controller: controller,
      size: widget.size,
    );
  }
}
