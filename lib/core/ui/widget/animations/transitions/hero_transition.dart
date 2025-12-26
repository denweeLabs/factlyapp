import 'package:flutter/material.dart';
import 'package:heroine/heroine.dart';

class HeroTransition extends StatelessWidget {
  const HeroTransition({
    super.key,
    required this.tag,
    required this.child,
    this.isEnabled = true,
    this.flightShuttleBuilder,
    this.spring,
  });

  final String tag;
  final Widget child;
  final bool isEnabled;
  final Motion? spring;
  final HeroineShuttleBuilder? flightShuttleBuilder;

  // static const defaultSpring = Spring.withDamping(
  //   // dampingFraction: 1.5,
  //   // durationSeconds: 0.3,
  //   dampingFraction: 1.0,
  //   durationSeconds: 0.6,
  // );

  @override
  Widget build(BuildContext context) {
    if (!isEnabled) return child;
    
    return Heroine(
      tag: tag,
      motion: spring ?? Motion.smoothSpring(),
      flightShuttleBuilder: flightShuttleBuilder ?? const FlipShuttleBuilder(),
      child: child,
    );
  }
}
