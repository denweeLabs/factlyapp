import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatelessWidget {
  const LottieAnimation({
    required this.path,
    required this.size,
    this.controller,
    super.key,
    this.repeat = true,
    this.animate = true,
    this.errorWidget,
    this.onLoaded,
  });

  final String path;
  final int size;
  final bool repeat;
  final bool animate;
  final Widget? errorWidget;
  final Animation<double>? controller;
  final void Function(Duration duration)? onLoaded;

  @override
  Widget build(BuildContext context) {
    final iconSize = size.w;

    return SizedBox(
      height: iconSize,
      width: iconSize,
      child: Lottie.asset(
        path,
        repeat: repeat,
        animate: animate,
        controller: controller,
        onLoaded: (comp) {
          onLoaded?.call(comp.duration);
        },
      ),
    );
  }
}
