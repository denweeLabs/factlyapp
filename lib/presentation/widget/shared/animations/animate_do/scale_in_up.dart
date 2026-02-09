import 'package:denwee/presentation/shared/utils/animations_util.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/core/core_animate_do.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/core/core_fade_scale_slide.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';

extension ScaleInUpExtension on Widget {
  Widget autoScaleInUp({
    Duration? delay,
    Duration? duration,
    Duration? reverseDuration,
    Curve? slideCurve,
    Curve? slideReverseCurve,
    Curve? scaleCurve,
    Curve? scaleReverseCurve,
    Curve? fadeCurve,
    Curve? fadeReverseCurve,
    double? slideFrom,
    Function(AnimationController)? controllerProvider,
    bool manualTrigger = false,
    bool animate = true,
    Function(AnimateDoDirection direction)? onFinish,
    int? sequencePos,
  }) {
    return CoreFadeScaleSlide(
      delay: sequencePos != null ? AnimationsUtil.sequenceDelayProvider(sequencePos) : delay,
      duration: duration ?? AutomatedAnimationValues.defaultDuration[AnimateDoDirection.forward]!,
      reverseDuration: reverseDuration ?? AutomatedAnimationValues.defaultDuration[AnimateDoDirection.backward]!,
      slideCurve: slideCurve ?? AutomatedAnimationValues.defaultSlideCurve[AnimateDoDirection.forward]!,
      slideReverseCurve: slideReverseCurve ?? AutomatedAnimationValues.defaultSlideCurve[AnimateDoDirection.backward]!,
      scaleCurve: scaleCurve ?? AutomatedAnimationValues.defaultSlideCurve[AnimateDoDirection.forward]!,
      scaleReverseCurve: scaleReverseCurve ?? AutomatedAnimationValues.defaultSlideCurve[AnimateDoDirection.backward]!,
      fadeCurve: fadeCurve ?? AutomatedAnimationValues.defaultFadeCurve[AnimateDoDirection.forward]!,
      fadeReverseCurve: fadeReverseCurve ?? AutomatedAnimationValues.defaultFadeCurve[AnimateDoDirection.backward]!,
      slideFrom: Offset(0.0, (slideFrom ?? AutomatedAnimationValues.defaultSlideOffsets[SlideDirection.down2Top]!)),
      slideTo: Offset.zero,
      scaleFrom: 0.85,
      scaleTo: 1.0,
      fadeFrom: 0.0,
      fadeTo: 1.0,
      controllerProvider: controllerProvider,
      manualTrigger: manualTrigger,
      animate: animate,
      onFinish: onFinish,
      child: this,
    );
  }
}
