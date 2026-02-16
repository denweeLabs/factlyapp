import 'package:denwee/presentation/shared/utils/animations_util.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/core/core_animation_mixin.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/core/core_fade.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';

extension FadeOutExtension on Widget {
  Widget autoFadeOut({
    Duration? delay,
    Duration? duration,
    Duration? reverseDuration,
    Curve? fadeCurve,
    Curve? fadeReverseCurve,
    bool manualTrigger = false,
    bool animate = true,
    Function(AnimateDoDirection direction)? onFinish,
    int? sequencePos,
  }) {
    return CoreFade(
      delay: sequencePos != null ? AnimationsUtil.sequenceDelayProvider(sequencePos) : delay,
      duration: duration ?? CommonAnimationValues.forwardDuration,
      reverseDuration: reverseDuration ?? CommonAnimationValues.reverseDuration,
      fadeCurve: fadeCurve ?? CommonAnimationValues.fadeDownForwardCurve,
      fadeReverseCurve: fadeReverseCurve ?? CommonAnimationValues.fadeDownReverseCurve,
      fadeFrom: 1.0,
      fadeTo: 0.0,
      manualTrigger: manualTrigger,
      animate: animate,
      onFinish: onFinish,
      child: this,
    );
  }

  Widget ecFadeOut({
    required AnimationController controller,
    Function(AnimateDoDirection direction)? onFinish,
    Curve? curve,
    int? sequencePos,
    int? sequenceTotal,
  }) {
    final thisFadeCurve = AnimationsUtil.sequenceForwardCurveProvider(
      sequencePos,
      sequenceTotal,
      curve ?? CommonAnimationValues.ecFadeDownForwardCurve,
    );

    return CoreFade(
      animate: controller.isForwardOrCompleted,
      externalController: controller,
      onFinish: onFinish,
      fadeCurve: thisFadeCurve,
      fadeReverseCurve: CommonAnimationValues.ecFadeDownReverseCurve,
      fadeFrom: 1.0,
      fadeTo: 0.0,
      delay: null,
      duration: Duration.zero,
      reverseDuration: Duration.zero,
      child: this,
    );
  }
}
