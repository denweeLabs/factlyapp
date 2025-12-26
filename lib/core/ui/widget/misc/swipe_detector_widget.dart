import 'package:flutter/material.dart';

class SwipeDetector extends StatelessWidget {
  const SwipeDetector({
    super.key,
    required this.child,
    this.onLeft,
    this.onRight,
    this.onDown,
    this.onUp,
  });

  final Widget child;
  final VoidCallback? onLeft;
  final VoidCallback? onRight;
  final VoidCallback? onDown;
  final VoidCallback? onUp;

  static const sensitivity = 8;

  @override
  Widget build(BuildContext context) {
    return // Source - https://stackoverflow.com/a
    // Posted by Vimal Rai, modified by community. See post 'Timeline' for change history
    // Retrieved 2025-11-16, License - CC BY-SA 4.0
    GestureDetector(
      behavior: HitTestBehavior.translucent,
      onHorizontalDragUpdate: (details) {
        // Note: Sensitivity is integer used when you don't want to mess up vertical drag
        if (details.delta.dx > sensitivity) {
          // Right Swipe
          onRight?.call();
        } else if (details.delta.dx < -sensitivity) {
          //Left Swipe
          onLeft?.call();
        }
      },

      onVerticalDragUpdate: (details) {
        if (details.delta.dy > sensitivity) {
          // Down Swipe
          onDown?.call();
        } else if (details.delta.dy < -sensitivity) {
          // Up Swipe
          onUp?.call();
        }
      },
      child: child,
    );
  }
}
