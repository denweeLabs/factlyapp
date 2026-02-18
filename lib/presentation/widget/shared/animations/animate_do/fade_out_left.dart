import 'package:denwee/presentation/shared/utils/animations_util.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/core/core_animation_mixin.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/core/core_fade_slide.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';

extension FadeOutLeftExtension on Widget {
  Widget autoFadeOutLeft({
    Duration? delay,
    Duration? duration,
    Duration? reverseDuration,
    Curve? slideCurve,
    Curve? slideReverseCurve,
    Curve? fadeCurve,
    Curve? fadeReverseCurve,
    double? slideTo,
    bool manualTrigger = false,
    bool animate = true,
    Function(AnimateDoDirection direction)? onFinish,
    int? sequencePos,
  }) {
    return CoreFadeSlide(
      delay: sequencePos != null ? AnimationsUtil.sequenceDelayProvider(sequencePos) : delay,
      duration: duration ?? CommonAnimationValues.forwardDuration,
      reverseDuration: reverseDuration ?? CommonAnimationValues.reverseDuration,
      slideCurve: slideCurve ?? CommonAnimationValues.slideForwardCurve,
      slideReverseCurve: slideReverseCurve ?? CommonAnimationValues.slideReverseCurve,
      fadeCurve: fadeCurve ?? CommonAnimationValues.fadeDownForwardCurve,
      fadeReverseCurve: fadeReverseCurve ?? CommonAnimationValues.fadeDownReverseCurve,
      slideFrom: Offset.zero,
      slideTo: -Offset(slideTo ?? CommonAnimationValues.slideOffset, 0.0),
      fadeFrom: 1.0,
      fadeTo: 0.0,
      manualTrigger: manualTrigger,
      animate: animate,
      onFinish: onFinish,
      child: this,
    );
  }
}
