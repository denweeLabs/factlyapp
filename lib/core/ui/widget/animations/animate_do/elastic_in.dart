import 'package:denwee/core/ui/utils/animations_util.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/core/core_animate_do.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/core/core_fade_scale.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';

extension ElasticInExtension on Widget {
  Widget autoElasticIn({
    Duration? delay,
    Duration? duration,
    Duration? reverseDuration,
    Curve? scaleCurve,
    Curve? scaleReverseCurve,
    Curve? fadeCurve,
    Curve? fadeReverseCurve,
    Function(AnimationController)? controllerProvider,
    bool manualTrigger = false,
    bool animate = true,
    bool forceComplete = true,
    Function(AnimateDoDirection direction)? onFinish,
    int? sequencePos,
    double scaleFrom = 0.0,
  }) {
    return CoreFadeScale(
      delay: sequencePos != null ? AnimationsUtil.sequenceDelayProvider(sequencePos) : delay,
      duration: duration ?? AutomatedAnimationValues.defaultDuration[AnimateDoDirection.forward]!,
      reverseDuration: reverseDuration ?? AutomatedAnimationValues.defaultDuration[AnimateDoDirection.backward]!,
      scaleCurve: scaleCurve ?? AutomatedAnimationValues.defaultElasticOutCurve[AnimateDoDirection.forward]!,
      scaleReverseCurve: scaleReverseCurve ?? AutomatedAnimationValues.defaultElasticOutCurve[AnimateDoDirection.backward]!,
      fadeCurve: fadeCurve ?? AutomatedAnimationValues.defaultFadeCurve[AnimateDoDirection.forward]!,
      fadeReverseCurve: fadeReverseCurve ?? AutomatedAnimationValues.defaultFadeCurve[AnimateDoDirection.backward]!,
      scaleFrom: scaleFrom,
      scaleTo: 1.0,
      fadeFrom: 0.0,
      fadeTo: 1.0,
      controllerProvider: controllerProvider,
      manualTrigger: manualTrigger,
      animate: animate,
      onFinish: onFinish,
      forceComplete: forceComplete,
      child: this,
    );
  }
}
