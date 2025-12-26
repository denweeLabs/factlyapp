import 'package:flutter/material.dart';

extension _AxisX on Axis {
  Alignment get alignmentBegin =>
      this == Axis.horizontal ? Alignment.centerLeft : Alignment.topCenter;
  Alignment get alignmentEnd =>
      this == Axis.horizontal ? Alignment.centerRight : Alignment.bottomCenter;
}

class FadingEdge extends StatelessWidget {
  const FadingEdge({
    super.key,
    required this.child,
    required this.axis,
    this.stops = kDefaultFadeStops,
    this.colors = kDefaultFadeColors,
    this.enabled = true,
  });

  final Widget child;
  final Axis axis;
  final List<double> stops;
  final List<Color> colors;
  final bool enabled;

  static const kDefaultFadeStops = [0.0, 0.05, 0.95, 1.0];
  static const kDefaultFadeColors = [
    Colors.black,
    Colors.transparent,
    Colors.transparent,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;

    final gradient = LinearGradient(
      begin: axis.alignmentBegin,
      end: axis.alignmentEnd,
      colors: colors,
      stops: stops,
    );

    return ShaderMask(
      shaderCallback: gradient.createShader,
      blendMode: BlendMode.dstOut,
      child: child,
    );
  }
}

class FadingSingleEdge extends StatelessWidget {
  const FadingSingleEdge({
    super.key,
    required this.child,
    required this.axis,
    this.colors = kDefaultFadeColors,
    this.enabled = true,
  });

  final Widget child;
  final Axis axis;
  final List<Color> colors;
  final bool enabled;

  static const kDefaultFadeColors = [
    Colors.black,
    Colors.transparent,
  ];

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;

    final gradient = LinearGradient(
      begin: axis.alignmentBegin,
      end: axis.alignmentEnd,
      colors: colors,
    );

    return ShaderMask(
      shaderCallback: gradient.createShader,
      blendMode: BlendMode.dstIn,
      child: child,
    );
  }
}
