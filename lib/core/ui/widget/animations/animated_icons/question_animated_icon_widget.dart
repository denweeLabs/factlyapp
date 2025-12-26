import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/animations/lottie_animation_widget.dart';
import 'package:flutter/material.dart';

class QuestionAnimatedIcon extends StatefulWidget {
  const QuestionAnimatedIcon({
    super.key,
    required this.animate,
    this.size = 14,
    this.initValue,
    this.onInit,
  });

  final bool animate;
  final int size;
  final double? initValue;
  final void Function(AnimationController)? onInit;

  @override
  State<QuestionAnimatedIcon> createState() => _QuestionAnimatedIconState();
}

class _QuestionAnimatedIconState extends State<QuestionAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2800),
    value: widget.initValue,
  );

  @override
  void initState() {
    super.initState();
    if (widget.animate) animate();
    widget.onInit?.call(controller);
  }

  @override
  void didUpdateWidget(covariant QuestionAnimatedIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate != oldWidget.animate) {
      widget.animate ? animate() : controller.stop();
    }
  }

  void animate() {
    controller
      ..value = 1
      ..animateBack(0.5);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LottieAnimation(
      path: AppConstants.assets.animations.question,
      controller: controller,
      size: widget.size,
    );
  }
}
