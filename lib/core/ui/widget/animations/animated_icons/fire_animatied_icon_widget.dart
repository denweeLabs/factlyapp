import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/lottie_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FireAnimatedIcon extends StatefulWidget {
  const FireAnimatedIcon({
    super.key,
    required this.animate,
    this.size = 14,
    this.onInit,
  });

  final bool animate;
  final int size;
  final void Function(AnimationController)? onInit;

  @override
  State<FireAnimatedIcon> createState() => _FireAnimatedIconState();
}

class _FireAnimatedIconState extends State<FireAnimatedIcon> with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    vsync: this,
    duration: CustomAnimationDurations.lowMedium,
  );

  @override
  void initState() {
    super.initState();
    if (widget.animate) animate();
    widget.onInit?.call(controller);
  }

  @override
  void didUpdateWidget(covariant FireAnimatedIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate != oldWidget.animate) {
      widget.animate ? animate() : controller.stop();
    }
  }

  void animate() {
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
      path: AppConstants.assets.animations.fire,
      controller: controller,
      size: widget.size,
    );
  }
}
