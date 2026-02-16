import 'package:denwee/presentation/shared/utils/animations_util.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/core/core_fade_scale.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
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
    bool manualTrigger = false,
    bool animate = true,
    bool forceComplete = true,
    int? sequencePos,
    double scaleFrom = 0.0,
  }) {
    return CoreFadeScale(
      delay: sequencePos != null ? AnimationsUtil.sequenceDelayProvider(sequencePos) : delay,
      duration: duration ?? CommonAnimationValues.forwardDuration,
      reverseDuration: reverseDuration ?? CommonAnimationValues.reverseDuration,
      scaleCurve: scaleCurve ?? CommonAnimationValues.scaleUpForwardCurve,
      scaleReverseCurve: scaleReverseCurve ?? CommonAnimationValues.scaleUpReverseCurve,
      fadeCurve: fadeCurve ?? CommonAnimationValues.fadeUpForwardCurve,
      fadeReverseCurve: fadeReverseCurve ?? CommonAnimationValues.fadeUpReverseCurve,
      scaleFrom: scaleFrom,
      scaleTo: 1.0,
      fadeFrom: 0.0,
      fadeTo: 1.0,
      manualTrigger: manualTrigger,
      animate: animate,
      forceComplete: forceComplete,
      child: this,
    );
  }
}
