import 'package:flutter/material.dart';

class FadingEdges {
  final double top;
  final double bottom;
  const FadingEdges({this.top = 30.0, this.bottom = 60.0});
  const FadingEdges.top(double value) : top = value, bottom = 0.0;
  const FadingEdges.bottom(double value) : top = 0.0, bottom = value;
  const FadingEdges.symmetric(double value) : top = value, bottom = value;
}

class SolidVerticalFadingEdge extends StatelessWidget {
  const SolidVerticalFadingEdge({
    super.key,
    required this.child,
    this.size = const FadingEdges(),
    this.enabled = true,
    required this.backgroundColor,
  });

  final Widget child;
  final FadingEdges size;
  final bool enabled;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;

    final colors = [backgroundColor, backgroundColor.withValues(alpha: 0)];

    return Stack(
      children: [
        child,

        // Top fade
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: size.top,
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: colors,
                ),
              ),
            ),
          ),
        ),

        // Bottom fade
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: size.bottom,
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: colors,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
