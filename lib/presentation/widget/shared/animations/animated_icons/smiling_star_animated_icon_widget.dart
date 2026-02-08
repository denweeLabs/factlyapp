import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/widget/shared/animations/lottie_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SmilingStarAnimatedIcon extends StatefulWidget {
  const SmilingStarAnimatedIcon({
    super.key,
    required this.animate,
    this.size = 13,
  });

  final bool animate;
  final int size;

  @override
  State<SmilingStarAnimatedIcon> createState() => _SmilingStarAnimatedIconState();
}

class _SmilingStarAnimatedIconState extends State<SmilingStarAnimatedIcon> with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 4000),
  );
  late final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(parent: controller, curve: const Interval(0.1, 0.5, curve: Curves.easeInToLinear)),
  );

  @override
  void initState() {
    super.initState();
    if (widget.animate) animate();
  }

  @override
  void didUpdateWidget(covariant SmilingStarAnimatedIcon oldWidget) {
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
      path: AppConstants.assets.animations.smilingStar,
      controller: animation,
      size: widget.size,
    );
  }
}
