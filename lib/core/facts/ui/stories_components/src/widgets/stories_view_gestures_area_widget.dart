import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoriesViewGesturesArea extends StatelessWidget {
  const StoriesViewGesturesArea({
    super.key,
    required this.ignorePointer,
    required this.onHold,
    required this.onRelease,
    required this.onLeft,
    required this.onRight,
  });

  final bool ignorePointer;
  final VoidCallback onHold;
  final VoidCallback onRelease;
  final VoidCallback onLeft;
  final VoidCallback onRight;

  static final sideAreaWidth = 75.w;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignorePointer,
      child: Stack(
        children: [

          // Center touch area
          Align(
            heightFactor: 0.6,
            alignment: Alignment.center,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTapDown: (_) => onHold(),
              onTapUp: (_) => onRelease(),
              onTapCancel: () => onRelease(),
            ),
          ),

          // Left touch area
          Align(
            alignment: Alignment.centerLeft,
            heightFactor: 1,
            child: SizedBox(
              width: sideAreaWidth,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onLeft,
              ),
            ),
          ),

          // Right touch area
          Align(
            alignment: Alignment.centerRight,
            heightFactor: 1,
            child: SizedBox(
              width: sideAreaWidth,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onRight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
