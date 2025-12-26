import 'package:denwee/core/ui/utils/animations_util.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/core/core_animate_do.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/core/core_fade_scale.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
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
    Function(AnimationController)? controllerProvider,
    bool manualTrigger = false,
    bool animate = true,
    bool forceComplete = true,
    Function(AnimateDoDirection direction)? onFinish,
    int? sequencePos,
  }) {
    return CoreFadeScale(
      delay: sequencePos != null ? AnimationsUtil.sequenceDelayProvider(sequencePos) : delay,
      duration: duration ?? AutomatedAnimationValues.defaultDuration[AnimateDoDirection.forward]!,
      reverseDuration: reverseDuration ?? AutomatedAnimationValues.defaultDuration[AnimateDoDirection.backward]!,
      scaleCurve: scaleCurve ?? AutomatedAnimationValues.defaultElasticInCurve[AnimateDoDirection.forward]!,
      scaleReverseCurve: scaleReverseCurve ?? AutomatedAnimationValues.defaultElasticInCurve[AnimateDoDirection.backward]!,
      fadeCurve: fadeCurve ?? AutomatedAnimationValues.defaultFadeCurve[AnimateDoDirection.forward]!,
      fadeReverseCurve: fadeReverseCurve ?? AutomatedAnimationValues.defaultFadeCurve[AnimateDoDirection.backward]!,
      scaleFrom: 1.0,
      scaleTo: 0.0,
      fadeFrom: 1.0,
      fadeTo: 0.0,
      controllerProvider: controllerProvider,
      manualTrigger: manualTrigger,
      animate: animate,
      onFinish: onFinish,
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
      curve ?? RouteAwareAnimationValues.defaultElasticInCurve[AnimateDoDirection.forward]!,
    );

    return CoreFadeScale(
      animate: controller.isForwardOrCompleted,
      externalController: controller,
      onFinish: onFinish,
      scaleCurve: thisScaleCurve,
      scaleReverseCurve: RouteAwareAnimationValues.defaultElasticInCurve[AnimateDoDirection.backward]!,
      fadeCurve: RouteAwareAnimationValues.defaultFadeCurve[AnimateDoDirection.forward]!,
      fadeReverseCurve: RouteAwareAnimationValues.defaultFadeCurve[AnimateDoDirection.backward]!,
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
