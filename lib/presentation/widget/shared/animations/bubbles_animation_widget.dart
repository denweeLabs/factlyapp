import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

class BubblesAnimation extends StatelessWidget {
  const BubblesAnimation({
    super.key,
    this.bubblesCount = 15,
    this.opacity = 20,
    this.color,
    this.sizeFactor = 0.05,
  });

  final int bubblesCount;
  final int opacity;
  final double sizeFactor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final thisColor = color ?? Colors.white;

    return RepaintBoundary(
      child: FloatingBubbles.alwaysRepeating(
        noOfBubbles: bubblesCount,
        colorsOfBubbles: [thisColor.withAlpha(30)],
        sizeFactor: sizeFactor,
        opacity: opacity,
        speed: BubbleSpeed.slow,
      ),
    );
  }
}
