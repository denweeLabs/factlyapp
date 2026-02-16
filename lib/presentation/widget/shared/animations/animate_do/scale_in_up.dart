import 'package:denwee/presentation/shared/utils/animations_util.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/core/core_animation_mixin.dart';
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
    bool manualTrigger = false,
    bool animate = true,
    Function(AnimateDoDirection direction)? onFinish,
    int? sequencePos,
  }) {
    return CoreFadeScaleSlide(
      delay: sequencePos != null ? AnimationsUtil.sequenceDelayProvider(sequencePos) : delay,
      duration: duration ?? CommonAnimationValues.forwardDuration,
      reverseDuration: reverseDuration ?? CommonAnimationValues.reverseDuration,
      slideCurve: slideCurve ?? CommonAnimationValues.slideForwardCurve,
      slideReverseCurve: slideReverseCurve ?? CommonAnimationValues.slideReverseCurve,
      scaleCurve: scaleCurve ?? CommonAnimationValues.scaleUpForwardCurve,
      scaleReverseCurve: scaleReverseCurve ?? CommonAnimationValues.scaleUpReverseCurve,
      fadeCurve: fadeCurve ?? CommonAnimationValues.fadeUpForwardCurve,
      fadeReverseCurve: fadeReverseCurve ?? CommonAnimationValues.fadeUpReverseCurve,
      slideFrom: Offset(0.0, slideFrom ?? CommonAnimationValues.slideOffset),
      slideTo: Offset.zero,
      scaleFrom: 0.85,
      scaleTo: 1.0,
      fadeFrom: 0.0,
      fadeTo: 1.0,
      manualTrigger: manualTrigger,
      animate: animate,
      onFinish: onFinish,
      child: this,
    );
  }
}
