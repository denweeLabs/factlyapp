import 'dart:ui';

import 'package:denwee/core/ui/widget/animations/constants/animation_bipos.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

part 'common_fade_animation.dart';
part 'common_fade_blur_animation.dart';
part 'common_fade_slide_animation.dart';
part 'common_fade_scale_animation.dart';

extension CommonAnimationsX on Widget {
  Widget fadeSlide({
    bool animate = true,
    bool ignoreAnimation = false,
    bool useLegacy = false,
    required BiPos<double> fades,
    required BiPos<Offset> offsets,
    Duration delay = Duration.zero,
    Duration duration = CommonAnimationValues.commonFadeSlideDuration,
    Duration reverseDuration = CommonAnimationValues.commonFadeSlideDuration,
    Curve fadeCurve = CommonAnimationValues.commonFadeCurve,
    Curve offsetCurve = CommonAnimationValues.commonSlideCurve,
    Curve reverseOffsetCurve = CommonAnimationValues.commonSlideCurve,
    VoidCallback? onCompleted,
  }) {
    if (ignoreAnimation) return this;

    if (!useLegacy) {
      final transition = <Effect>[
        FadeEffect(
          delay: delay,
          curve: fadeCurve,
          duration: duration,
          begin: fades.onTrue,
          end: fades.onFalse,
        ),
        SlideEffect(
          delay: delay,
          curve: offsetCurve,
          duration: duration,
          begin: offsets.onTrue,
          end: offsets.onFalse,
        ),
      ];
      return this.animate(
        key: key,
        target: animate ? 1.0 : 0.0,
        effects: transition,
        onComplete: (_) => onCompleted?.call(), 
      );
    }

    return CommonFadeSlide(
      key: key,
      animate: animate,
      fades: fades,
      offsets: offsets,
      delay: delay,
      duration: duration,
      reverseDuration: reverseDuration,
      fadeCurve: fadeCurve,
      offsetCurve: offsetCurve,
      reverseOffsetCurve: reverseOffsetCurve,
      onCompleted: onCompleted,
      child: this,
    );
  }

  Widget fadeScale({
    bool animate = true,
    bool useLegacy = false,
    required BiPos<double> fades,
    required BiPos<double> scales,
    Duration delay = Duration.zero,
    Duration duration = CommonAnimationValues.commonFadeScaleDuration,
    Duration reverseDuration = CommonAnimationValues.commonFadeScaleDuration,
    Curve fadeCurve = CommonAnimationValues.commonFadeCurve,
    Curve scaleCurve = CommonAnimationValues.commonScaleCurve,
    Curve reverseScaleCurve = CommonAnimationValues.commonScaleCurve,
    VoidCallback? onCompleted,
  }) {
    if (!useLegacy) {
      final transition = <Effect>[
        FadeEffect(
          delay: delay,
          curve: fadeCurve,
          duration: duration,
          begin: fades.onTrue,
          end: fades.onFalse,
        ),
        ScaleEffect(
          delay: delay,
          curve: scaleCurve,
          duration: duration,
          begin: Offset(scales.onTrue, scales.onTrue),
          end: Offset(scales.onFalse, scales.onFalse),
        ),
      ];
      return this.animate(
        target: animate ? 1.0 : 0.0,
        effects: transition,
        onComplete: (_) => onCompleted?.call(),
      );
    }

    return CommonFadeScale(
      animate: animate,
      fades: fades,
      scales: scales,
      delay: delay,
      duration: duration,
      reverseDuration: reverseDuration,
      fadeCurve: fadeCurve,
      scaleCurve: scaleCurve,
      reverseScaleCurve: reverseScaleCurve,
      child: this,
    );
  }

  Widget fade({
    Key? key,
    bool animate = true,
    bool useLegacy = false,
    required BiPos<double> fades,
    Duration delay = Duration.zero,
    Duration duration = CommonAnimationValues.commonFadeDuration,
    Duration reverseDuration = CommonAnimationValues.commonFadeDuration,
    Curve curve = CommonAnimationValues.commonFadeCurve,
  }) {
    if (!useLegacy) {
      final transition = <Effect>[
        FadeEffect(
          delay: delay,
          curve: curve,
          duration: duration,
          begin: fades.onTrue,
          end: fades.onFalse,
        ),
      ];
      return this.animate(
        key: key,
        target: animate ? 1.0 : 0.0,
        effects: transition,
      );
    }

    return CommonFade(
      key: key,
      animate: animate,
      fades: fades,
      delay: delay,
      curve: curve,
      duration: duration,
      reverseDuration: reverseDuration,
      child: this,
    );
  }

  Widget fadeBlur({
    bool animate = true,
    required BiPos<double> fades,
    required BiPos<Offset> blurs,
    Duration delay = Duration.zero,
    Duration duration = CommonAnimationValues.commonFadeDuration,
    Duration reverseDuration = CommonAnimationValues.commonFadeDuration,
    Curve fadeCurve = CommonAnimationValues.commonFadeCurve,
    Curve blurCurve = CommonAnimationValues.commonBlurCurve,
  }) {
    final transition = <Effect>[
      FadeEffect(
        delay: delay,
        curve: fadeCurve,
        duration: duration,
        begin: fades.onTrue,
        end: fades.onFalse,
      ),
      BlurEffect(
        delay: delay,
        curve: blurCurve,
        duration: duration,
        begin: blurs.onTrue,
        end: blurs.onFalse,
      ),
    ];
    return this.animate(
      target: animate ? 1.0 : 0.0,
      effects: transition,
    );
  }

  Widget fadeScaleRotation({
    bool animate = true,
    required BiPos<double> fades,
    required BiPos<double> scales,
    required BiPos<double> rotations,
    Duration delay = Duration.zero,
    Duration duration = CommonAnimationValues.commonFadeDuration,
    Duration reverseDuration = CommonAnimationValues.commonFadeDuration,
    Curve fadeCurve = CommonAnimationValues.commonFadeCurve,
    Curve scaleCurve = CommonAnimationValues.commonScaleCurve,
  }) {
    final transition = <Effect>[
      FadeEffect(
        delay: delay,
        curve: fadeCurve,
        duration: duration,
        begin: fades.onTrue,
        end: fades.onFalse,
      ),
      ScaleEffect(
        delay: delay,
        curve: scaleCurve,
        duration: duration,
        begin: Offset(scales.onTrue, scales.onTrue),
        end: Offset(scales.onFalse, scales.onFalse),
      ),
      RotateEffect(
        delay: delay,
        curve: scaleCurve,
        duration: duration,
        begin: rotations.onTrue,
        end: rotations.onFalse,
      ),
    ];
    return this.animate(
      target: animate ? 1.0 : 0.0,
      effects: transition,
    );
  }
}

mixin CommonAnimationsMixin {
  late AnimationController controller;
  bool disposed = false;

  void buildAnimation({required Duration delay, required bool animate}) {
    if (animate) {
      Future.delayed(delay, () {
        if (disposed) return;
        animate ? controller.forward() : controller.reverse();
      });
    }
    if (!animate) {
      if (disposed) return;
      controller.animateBack(0);
    }
  }
}
