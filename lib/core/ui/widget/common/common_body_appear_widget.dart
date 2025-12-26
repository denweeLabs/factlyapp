import 'package:denwee/core/ui/widget/animations/common_animations/common_animations.dart';
import 'package:denwee/core/ui/widget/animations/constants/animation_bipos.dart';
import 'package:flutter/material.dart';

class CommonPageBodyAppear extends StatelessWidget {
  const CommonPageBodyAppear({
    super.key,
    required this.child,
    this.isAnimated = true,
  });

  final Widget child;
  final bool isAnimated;

  @override
  Widget build(BuildContext context) {
    return child.fadeSlide(
      animate: isAnimated,
      fades: const BiPos(0.0, 1.0),
      offsets: const BiPos(Offset(0.0, 0.05), Offset.zero),
      delay: const Duration(milliseconds: 150),
    );
  }
}
