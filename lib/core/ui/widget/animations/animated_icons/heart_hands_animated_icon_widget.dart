import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/animations/lottie_animation_widget.dart';
import 'package:flutter/material.dart';

class HeartHandsAnimatedIcon extends StatefulWidget {
  const HeartHandsAnimatedIcon({
    super.key,
    required this.animate,
    this.onInit,
    this.size = 14,
  });

  final bool animate;
  final int size;
  final void Function(AnimationController)? onInit;

  @override
  State<HeartHandsAnimatedIcon> createState() => _HeartHandsAnimatedIconState();
}

class _HeartHandsAnimatedIconState extends State<HeartHandsAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3000),
  );

  @override
  void initState() {
    super.initState();
    if (widget.animate) animate();
    widget.onInit?.call(controller);
  }

  @override
  void didUpdateWidget(covariant HeartHandsAnimatedIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate != oldWidget.animate) {
      widget.animate ? animate() : controller.stop();
    }
  }

  void animate() {
    controller
      ..value = 0
      ..animateTo(0.5);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: LottieAnimation(
        path: AppConstants.assets.animations.heartHands,
        controller: controller,
        size: widget.size,
      ),
    );
  }
}
