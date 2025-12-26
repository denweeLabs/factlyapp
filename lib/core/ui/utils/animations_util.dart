import 'package:flutter/material.dart';

class AnimationsUtil {
  static Duration sequenceDelayProvider(int sequencePos) {
    const stepMs = 200;
    return Duration(milliseconds: sequencePos * stepMs);
  }

  static Curve sequenceForwardCurveProvider(
    int? sequencePos,
    int? sequenceTotal,
    Curve parentCurve,
  ) {
    if (sequencePos == null || sequenceTotal == null || sequenceTotal < 1) {
      return parentCurve;
    }
    final begin = (sequencePos / sequenceTotal) / 3;
    return Interval(begin, 1.0, curve: parentCurve);
  }
}
