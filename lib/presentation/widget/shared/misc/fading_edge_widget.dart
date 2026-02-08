import 'package:flutter/material.dart';

extension _AxisX on Axis {
  Alignment get alignmentBegin =>
      this == Axis.horizontal ? Alignment.centerLeft : Alignment.topCenter;
  Alignment get alignmentEnd =>
      this == Axis.horizontal ? Alignment.centerRight : Alignment.bottomCenter;
}

class FadingEdge extends StatefulWidget {
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
  State<FadingEdge> createState() => _FadingEdgeState();
}

class _FadingEdgeState extends State<FadingEdge> {
  late final gradient = LinearGradient(
    begin: widget.axis.alignmentBegin,
    end: widget.axis.alignmentEnd,
    colors: widget.colors,
    stops: widget.stops,
  );

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;

    return ShaderMask(
      shaderCallback: gradient.createShader,
      blendMode: BlendMode.dstOut,
      child: widget.child,
    );
  }
}

class FadingSingleEdge extends StatefulWidget {
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

  static const kDefaultFadeColors = [Colors.black, Colors.transparent];

  @override
  State<FadingSingleEdge> createState() => _FadingSingleEdgeState();
}

class _FadingSingleEdgeState extends State<FadingSingleEdge> {
  late final gradient = LinearGradient(
    begin: widget.axis.alignmentBegin,
    end: widget.axis.alignmentEnd,
    colors: widget.colors,
  );

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;

    return ShaderMask(
      shaderCallback: gradient.createShader,
      blendMode: BlendMode.dstIn,
      child: widget.child,
    );
  }
}
