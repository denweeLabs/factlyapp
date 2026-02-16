import 'package:denwee/presentation/shared/utils/animations_util.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/core/core_animation_mixin.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/core/core_fade_slide.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';

extension FadeInRightExtension on Widget {
  Widget autoFadeInRight({
    Duration? delay,
    Duration? duration,
    Duration? reverseDuration,
    Curve? slideCurve,
    Curve? slideReverseCurve,
    Curve? fadeCurve,
    Curve? fadeReverseCurve,
    double? slideFrom,
    bool manualTrigger = false,
    bool animate = true,
    bool forceComplete = true,
    Function(AnimateDoDirection direction)? onFinish,
    int? sequencePos,
  }) {
    return CoreFadeSlide(
      delay: sequencePos != null ? AnimationsUtil.sequenceDelayProvider(sequencePos) : delay,
      duration: duration ?? CommonAnimationValues.forwardDuration,
      reverseDuration: reverseDuration ?? CommonAnimationValues.reverseDuration,
      slideCurve: slideCurve ?? CommonAnimationValues.slideForwardCurve,
      slideReverseCurve: slideReverseCurve ?? CommonAnimationValues.slideReverseCurve,
      fadeCurve: fadeCurve ?? CommonAnimationValues.fadeUpForwardCurve,
      fadeReverseCurve: fadeReverseCurve ?? CommonAnimationValues.fadeUpReverseCurve,
      slideFrom: -Offset(slideFrom ?? CommonAnimationValues.slideOffset, 0.0),
      slideTo: Offset.zero,
      fadeFrom: 0.0,
      fadeTo: 1.0,
      forceComplete: forceComplete,
      manualTrigger: manualTrigger,
      animate: animate,
      onFinish: onFinish,
      child: this,
    );
  }
}
