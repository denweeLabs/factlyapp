import 'package:denwee/presentation/shared/utils/animations_util.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/core/core_animation_mixin.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/core/core_fade_slide.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';

extension FadeOutUpExtension on Widget {
  Widget autoFadeOutUp({
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
      slideTo: -Offset(0.0, slideTo ?? CommonAnimationValues.slideOffset),
      fadeFrom: 1.0,
      fadeTo: 0.0,
      manualTrigger: manualTrigger,
      animate: animate,
      onFinish: onFinish,
      child: this,
    );
  }

  Widget ecFadeOutUp({
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
      curve ?? CommonAnimationValues.ecSlideForwardCurve,
    );

    return CoreFadeSlide(
      animate: controller.isForwardOrCompleted,
      externalController: controller,
      onFinish: onFinish,
      slideCurve: thisSlideCurve,
      slideReverseCurve: CommonAnimationValues.ecSlideReverseCurve,
      fadeCurve: CommonAnimationValues.ecFadeDownForwardCurve,
      fadeReverseCurve: CommonAnimationValues.ecFadeDownReverseCurve,
      slideFrom: Offset.zero,
      slideTo: -Offset(0.0, slideTo ?? CommonAnimationValues.ecSlideOffset),
      fadeFrom: 1.0,
      fadeTo: 0.0,
      delay: null,
      duration: Duration.zero,
      reverseDuration: Duration.zero,
      child: this,
    );
  }
}
