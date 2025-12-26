import 'package:denwee/core/ui/utils/animations_util.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/core/core_animate_do.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/core/core_fade.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';

extension FadeOutExtension on Widget {
  Widget autoFadeOut({
    Duration? delay,
    Duration? duration,
    Duration? reverseDuration,
    Curve? fadeCurve,
    Curve? fadeReverseCurve,
    Function(AnimationController)? controllerProvider,
    bool manualTrigger = false,
    bool animate = true,
    Function(AnimateDoDirection direction)? onFinish,
    int? sequencePos,
  }) {
    return CoreFade(
      delay: sequencePos != null ? AnimationsUtil.sequenceDelayProvider(sequencePos) : delay,
      duration: duration ?? AutomatedAnimationValues.defaultDuration[AnimateDoDirection.forward]!,
      reverseDuration: reverseDuration ?? AutomatedAnimationValues.defaultDuration[AnimateDoDirection.backward]!,
      fadeCurve: fadeCurve ?? AutomatedAnimationValues.defaultFadeCurve[AnimateDoDirection.forward]!,
      fadeReverseCurve: fadeReverseCurve ?? AutomatedAnimationValues.defaultFadeCurve[AnimateDoDirection.backward]!,
      fadeFrom: 1.0,
      fadeTo: 0.0,
      controllerProvider: controllerProvider,
      manualTrigger: manualTrigger,
      animate: animate,
      onFinish: onFinish,
      child: this,
    );
  }

  Widget routeAwareFadeOut({
    required AnimationController controller,
    Function(AnimateDoDirection direction)? onFinish,
    Curve? curve,
    int? sequencePos,
    int? sequenceTotal,
  }) {
    final thisFadeCurve = AnimationsUtil.sequenceForwardCurveProvider(
      sequencePos,
      sequenceTotal,
      curve ?? RouteAwareAnimationValues.defaultFadeCurve[AnimateDoDirection.forward]!,
    );

    return CoreFade(
      animate: controller.isForwardOrCompleted,
      externalController: controller,
      onFinish: onFinish,
      fadeCurve: thisFadeCurve,
      fadeReverseCurve: RouteAwareAnimationValues.defaultFadeCurve[AnimateDoDirection.backward]!,
      fadeFrom: 1.0,
      fadeTo: 0.0,
      delay: null,
      duration: Duration.zero,
      reverseDuration: Duration.zero,
      child: this,
    );
  }
}
