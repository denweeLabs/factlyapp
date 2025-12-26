import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LessResponsiveScrollPhysics extends ScrollPhysics {
  const LessResponsiveScrollPhysics({super.parent});

  @override
  LessResponsiveScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return LessResponsiveScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    assert(() {
      if (value == position.pixels) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary('$runtimeType.applyBoundaryConditions() was called redundantly.'),
          ErrorDescription(
            'The proposed new position, $value, is exactly equal to the current position of the '
            'given ${position.runtimeType}, ${position.pixels}.\n'
            'The applyBoundaryConditions method should only be called when the value is '
            'going to actually change the pixels, otherwise it is redundant.',
          ),
          DiagnosticsProperty<ScrollPhysics>(
            'The physics object in question was',
            this,
            style: DiagnosticsTreeStyle.errorProperty,
          ),
          DiagnosticsProperty<ScrollMetrics>(
            'The position object in question was',
            position,
            style: DiagnosticsTreeStyle.errorProperty,
          ),
        ]);
      }
      return true;
    }());
    if (value < position.pixels && position.pixels <= position.minScrollExtent) {
      // Underscroll.
      return value - position.pixels;
    }
    if (position.maxScrollExtent <= position.pixels && position.pixels < value) {
      // Overscroll.
      return value - position.pixels;
    }
    if (value < position.minScrollExtent && position.minScrollExtent < position.pixels) {
      // Hit top edge.
      return value - position.minScrollExtent;
    }
    if (position.pixels < position.maxScrollExtent && position.maxScrollExtent < value) {
      // Hit bottom edge.
      return value - position.maxScrollExtent;
    }
    
    return 0.0;
  }

  // Reduce drag sensitivity
  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    return offset * 0.8; // lower value = less responsive to drag
  }

  // Control deceleration
  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    // Reduce fling speed so it stops sooner
    final reducedVelocity = velocity * 0.9;
    return super.createBallisticSimulation(position, reducedVelocity);
  }
}