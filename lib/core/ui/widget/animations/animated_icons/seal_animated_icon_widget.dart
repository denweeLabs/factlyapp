import 'package:animate_do/animate_do.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/animations/lottie_animation_widget.dart';
import 'package:flutter/material.dart';

class SealAnimatedIcon extends StatefulWidget {
  const SealAnimatedIcon({
    super.key,
    required this.animate,
    required this.isLoop,
    this.size = 13,
  });

  final bool animate;
  final bool isLoop;
  final int size;

  @override
  State<SealAnimatedIcon> createState() => _SealAnimatedIconState();
}

class _SealAnimatedIconState extends State<SealAnimatedIcon>
    with SingleTickerProviderStateMixin {
  static const duration = Duration(milliseconds: 8000);

  late final controller = AnimationController(
    vsync: this,
    duration: duration,
  );
  late final animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.05, 0.5, curve: Curves.ease),
    ),
  );

  @override
  void initState() {
    super.initState();
    if (widget.animate) animate();
  }

  @override
  void didUpdateWidget(covariant SealAnimatedIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate != oldWidget.animate) {
      widget.animate ? animate() : controller.stop();
    }
  }

  void animate() async {
    if (widget.isLoop) {
      controller.repeat();
      return;
    }
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LottieAnimation(
      path: AppConstants.assets.animations.seal,
      controller: animation,
      size: widget.size,
    ).shakeY(
      from: 2,
      infinite: true,
      curve: Curves.easeInOutCirc,
      duration: duration,
    );
  }
}
