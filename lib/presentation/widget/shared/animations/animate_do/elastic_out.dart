import 'package:denwee/presentation/shared/utils/animations_util.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/core/core_animation_mixin.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/core/core_fade_scale.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';

extension ElasticOutExtension on Widget {
  Widget autoElasticOut({
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
  }) {
    return CoreFadeScale(
      delay: sequencePos != null ? AnimationsUtil.sequenceDelayProvider(sequencePos) : delay,
      duration: duration ?? CommonAnimationValues.forwardDuration,
      reverseDuration: reverseDuration ?? CommonAnimationValues.reverseDuration,
      scaleCurve: scaleCurve ?? CommonAnimationValues.scaleDownForwardCurve,
      scaleReverseCurve: scaleReverseCurve ?? CommonAnimationValues.scaleDownReverseCurve,
      fadeCurve: fadeCurve ?? CommonAnimationValues.fadeDownForwardCurve,
      fadeReverseCurve: fadeReverseCurve ?? CommonAnimationValues.fadeDownReverseCurve,
      scaleFrom: 1.0,
      scaleTo: 0.0,
      fadeFrom: 1.0,
      fadeTo: 0.0,
      manualTrigger: manualTrigger,
      animate: animate,
      forceComplete: forceComplete,
      child: this,
    );
  }

  Widget routeAwareElasticOut({
    required AnimationController controller,
    Function(AnimateDoDirection direction)? onFinish,
    Curve? curve,
    int? sequencePos,
    int? sequenceTotal,
  }) {
    final thisScaleCurve = AnimationsUtil.sequenceForwardCurveProvider(
      sequencePos,
      sequenceTotal,
      curve ?? CommonAnimationValues.ecScaleDownForwardCurve,
    );

    return CoreFadeScale(
      animate: controller.isForwardOrCompleted,
      externalController: controller,
      scaleCurve: thisScaleCurve,
      scaleReverseCurve: CommonAnimationValues.ecScaleDownReverseCurve,
      fadeCurve: CommonAnimationValues.ecFadeDownForwardCurve,
      fadeReverseCurve: CommonAnimationValues.ecFadeDownReverseCurve,
      scaleFrom: 1.0,
      scaleTo: 0.0,
      fadeFrom: 1.0,
      fadeTo: 0.0,
      delay: null,
      duration: Duration.zero,
      reverseDuration: Duration.zero,
      child: this,
    );
  }
}
