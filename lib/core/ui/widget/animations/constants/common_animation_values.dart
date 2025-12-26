import 'package:denwee/core/ui/widget/animations/animate_do/core/core_animate_do.dart';
import 'package:flutter/material.dart';

class CommonAnimationValues {
  static const commonFadeCurve = Curves.ease;
  static const commonBlurCurve = Curves.linearToEaseOut;
  static const commonSlideCurve = Curves.fastEaseInToSlowEaseOut;
  static const commonScaleCurve = CommonAnimationValues.mediumElasticOut;

  static const commonFadeDuration = Duration(milliseconds: 1000);
  static const commonFadeScaleDuration = Duration(milliseconds: 1000);
  static const commonFadeSlideDuration = Duration(milliseconds: 1200);
  static const commonFadeSlideScaleDuration = Duration(milliseconds: 1200);

  static const Curve fastEaseInToSlowEaseOutBack = ThreePointCubic(
    Offset(0.056, 0.03),
    Offset(0.108, 0.285),
    Offset(0.198, 0.541),
    Offset(0.3655, 1.2),
    Offset(0.4465, 1.08),
  );
  static const Curve lightElasticOut = ElasticOutCurve(0.8);
  static const Curve lightMediumElasticOut = ElasticOutCurve(0.73);
  static const Curve mediumElasticOut = ElasticOutCurve(0.65);
  static const Curve harderElasticOut = ElasticOutCurve(0.5);
  static const Curve slowedEaseInOutQuad = Cubic(0.42, 0.2, 0.45, 1.0);

  static const themeChangeAnimationDuration = CustomAnimationDurations.low;
  static const themeChangeAnimationCurve = Curves.ease;
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

class AutomatedAnimationValues {
  static const defaultSlideCurve = <AnimateDoDirection, Curve>{
    AnimateDoDirection.forward: CustomAnimationCurves.fasterEaseInToSlowEaseOut,
    AnimateDoDirection.backward: Curves.easeInSine,
  };
  static const defaultFadeCurve = <AnimateDoDirection, Curve>{
    AnimateDoDirection.forward: Curves.fastEaseInToSlowEaseOut,
    AnimateDoDirection.backward: Curves.fastEaseInToSlowEaseOut,
  };
  static const defaultElasticInCurve = <AnimateDoDirection, Curve>{
    AnimateDoDirection.forward: CustomAnimationCurves.highElasticIn,
    AnimateDoDirection.backward: CustomAnimationCurves.lowElasticIn,
  };
  static const defaultElasticOutCurve = <AnimateDoDirection, Curve>{
    AnimateDoDirection.forward: CustomAnimationCurves.highElasticOut,
    AnimateDoDirection.backward: CustomAnimationCurves.lowElasticOut,
  };
  static const defaultDuration = <AnimateDoDirection, Duration>{
    AnimateDoDirection.forward: CustomAnimationDurations.mediumHigh,
    AnimateDoDirection.backward: CustomAnimationDurations.medium,
  };
  static const defaultSlideOffsets = <SlideDirection, double>{
    SlideDirection.down2Top: 80,
    SlideDirection.top2Down: 80,
    SlideDirection.left2Right: 80,
    SlideDirection.right2Left: 80,
  };
}

class RouteAwareAnimationValues {
  static const defaultSlideCurve = <AnimateDoDirection, Curve>{
    AnimateDoDirection.forward: Curves.easeInOutSine,
    AnimateDoDirection.backward: Curves.easeInQuart,
  };
  static const defaultFadeCurve = <AnimateDoDirection, Curve>{
    AnimateDoDirection.forward: Curves.ease,
    AnimateDoDirection.backward: Curves.ease,
  };
  static const defaultElasticInCurve = <AnimateDoDirection, Curve>{
    AnimateDoDirection.forward: CustomAnimationCurves.highElasticIn,
    AnimateDoDirection.backward: CustomAnimationCurves.lowElasticIn,
  };
  static const defaultElasticOutCurve = <AnimateDoDirection, Curve>{
    AnimateDoDirection.forward: CustomAnimationCurves.highElasticOut,
    AnimateDoDirection.backward: CustomAnimationCurves.lowElasticOut,
  };
  static const defaultDuration = <AnimateDoDirection, Duration>{
    AnimateDoDirection.forward: CustomAnimationDurations.low,
    AnimateDoDirection.backward: CustomAnimationDurations.lowMedium,
  };
  static const defaultSlideOffsets = <SlideDirection, double>{
    SlideDirection.down2Top: 100,
    SlideDirection.top2Down: 100,
    SlideDirection.left2Right: 100,
    SlideDirection.right2Left: 100,
  };
}
