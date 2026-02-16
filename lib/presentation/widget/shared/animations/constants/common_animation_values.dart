import 'package:flutter/material.dart';

class CommonAnimationValues {
  ///
  ///
  /// Theme change values (check app.dart)
  static const themeChangeAnimationDuration = CustomAnimationDurations.low;
  static const themeChangeAnimationCurve = Curves.ease;

  ///
  ///
  /// Values used in auto animations (e.g. autoFadeIn(), autoElasticIn())
  static const forwardDuration = Duration(milliseconds: 1500);
  static const reverseDuration = Duration(milliseconds: 1200);

  static const slideForwardCurve = ThreePointCubic(
    Offset(0.056, 0.03),
    Offset(0.108, 0.285),
    Offset(0.198, 0.541),
    Offset(0.3655, 1.0),
    Offset(0.4465, 1.0),
  );
  static const slideReverseCurve = Curves.easeInSine;

  static const scaleUpForwardCurve = ElasticOutCurve(0.50);
  static const scaleUpReverseCurve = ElasticOutCurve(0.75);
  static const scaleDownForwardCurve = ElasticInCurve(0.50);
  static const scaleDownReverseCurve = ElasticInCurve(0.75);

  static const fadeUpForwardCurve = Curves.fastEaseInToSlowEaseOut;
  static const fadeUpReverseCurve = Curves.fastEaseInToSlowEaseOut;
  static const fadeDownForwardCurve = Curves.fastEaseInToSlowEaseOut;
  static const fadeDownReverseCurve = Curves.fastEaseInToSlowEaseOut;

  static const slideOffset = 80.0;


  ///
  ///
  /// Values used in animations with external controller (e.g. ecFadeOutDown(), ecFadeOut())
  static const ecForwardDuration = Duration(milliseconds: 600);
  static const ecReverseDuration = Duration(milliseconds: 900);

  static const ecFadeDownForwardCurve = Curves.ease;
  static const ecFadeDownReverseCurve = Curves.ease;

  static const ecSlideForwardCurve = Curves.easeInOutSine;
  static const ecSlideReverseCurve = Curves.easeInQuart;

  static const ecScaleDownForwardCurve = ElasticInCurve(0.5);
  static const ecScaleDownReverseCurve = ElasticInCurve(0.75);

  static const ecSlideOffset = 100.0;
}

class CustomAnimationDurations {
  static const high = Duration(milliseconds: 1800);
  static const mediumHigh = Duration(milliseconds: 1500);
  static const medium = Duration(milliseconds: 1200);
  static const lowMedium = Duration(milliseconds: 900);
  static const low = Duration(milliseconds: 600);
  static const ultraLow = Duration(milliseconds: 400);
}

class CustomAnimationCurves {
  static const highElasticOut = ElasticOutCurve(0.5);
  static const mediumElasticOut = ElasticOutCurve(0.65);
  static const lowElasticOut = ElasticOutCurve(0.75);
  static const highElasticIn = ElasticInCurve(0.5);
  static const mediumElasticIn = ElasticInCurve(0.65);
  static const lowElasticIn = ElasticInCurve(0.75);
  static const fasterEaseInToSlowEaseOut = ThreePointCubic(
    Offset(0.056, 0.03),
    Offset(0.108, 0.285),
    Offset(0.198, 0.541),
    Offset(0.3655, 1.0),
    Offset(0.4465, 1.0),
  );
  static const instant = Interval(0.0, 0.0);
}
