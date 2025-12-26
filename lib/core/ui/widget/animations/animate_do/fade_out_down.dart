import 'package:denwee/core/ui/utils/animations_util.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/core/core_animate_do.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/core/core_fade_slide.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';

extension FadeOutDownExtension on Widget {
  Widget autoFadeOutDown({
    Duration? delay,
    Duration? duration,
    Duration? reverseDuration,
    Curve? slideCurve,
    Curve? slideReverseCurve,
    Curve? fadeCurve,
    Curve? fadeReverseCurve,
    double? slideTo,
    Function(AnimationController)? controllerProvider,
    bool manualTrigger = false,
    bool animate = true,
    bool forceComplete = true,
    Function(AnimateDoDirection direction)? onFinish,
    int? sequencePos,
  }) {
    return CoreFadeSlide(
      delay: sequencePos != null ? AnimationsUtil.sequenceDelayProvider(sequencePos) : delay,
      duration: duration ?? AutomatedAnimationValues.defaultDuration[AnimateDoDirection.forward]!,
      reverseDuration: reverseDuration ?? AutomatedAnimationValues.defaultDuration[AnimateDoDirection.backward]!,
      slideCurve: slideCurve ?? AutomatedAnimationValues.defaultSlideCurve[AnimateDoDirection.forward]!,
      slideReverseCurve: slideReverseCurve ?? AutomatedAnimationValues.defaultSlideCurve[AnimateDoDirection.backward]!,
      fadeCurve: fadeCurve ?? AutomatedAnimationValues.defaultFadeCurve[AnimateDoDirection.forward]!,
      fadeReverseCurve: fadeReverseCurve ?? AutomatedAnimationValues.defaultFadeCurve[AnimateDoDirection.backward]!,
      slideFrom: Offset.zero,
      slideTo: Offset(0.0, (slideTo ?? AutomatedAnimationValues.defaultSlideOffsets[SlideDirection.top2Down]!)),
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

  Widget routeAwareFadeOutDown({
    required AnimationController controller,
    Function(AnimateDoDirection direction)? onFinish,
    Curve? curve,
    double? slideTo,
    int? sequencePos,
    int? sequenceTotal,
  }) {
    final thisSlideCurve = AnimationsUtil.sequenceForwardCurveProvider(
      sequencePos,
      sequenceTotal,
      curve ?? RouteAwareAnimationValues.defaultSlideCurve[AnimateDoDirection.forward]!,
    );

    return CoreFadeSlide(
      animate: controller.isForwardOrCompleted,
      externalController: controller,
      onFinish: onFinish,
      slideCurve: thisSlideCurve,
      slideReverseCurve: RouteAwareAnimationValues.defaultSlideCurve[AnimateDoDirection.backward]!,
      fadeCurve: RouteAwareAnimationValues.defaultFadeCurve[AnimateDoDirection.forward]!,
      fadeReverseCurve: RouteAwareAnimationValues.defaultFadeCurve[AnimateDoDirection.backward]!,
      slideFrom: Offset.zero,
      slideTo: Offset(0.0, (slideTo ?? RouteAwareAnimationValues.defaultSlideOffsets[SlideDirection.top2Down]!)),
      fadeFrom: 1.0,
      fadeTo: 0.0,
      delay: null,
      duration: Duration.zero,
      reverseDuration: Duration.zero,
      child: this,
    );
  }
}
