import 'package:denwee/presentation/widget/shared/animations/animate_do/core/core_animation_mixin.dart';
import 'package:flutter/material.dart';

/// [key]: optional widget key reference
/// [child]: mandatory, widget to animate
/// [duration]: how much time the animation should take
/// [delay]: delay before the animation starts
/// [controller]: optional/mandatory, exposes the animation controller created by Animate_do
/// [manualTrigger]: boolean that indicates if you want to trigger the animation manually with the controller
/// [animate]: For a State controller property, if you re-render changing it from false to true, the animation will be fired immediately
/// [onFinish]: callback that returns the direction of the animation, [AnimateDoDirection.forward] or [AnimateDoDirection.backward]
/// [curve]: curve for the animation
class CoreFadeScaleSlide extends StatefulWidget {
  final Widget child;
  final Duration? delay;
  final Duration duration;
  final Duration reverseDuration;
  final Curve scaleCurve;
  final Curve scaleReverseCurve;
  final Curve slideCurve;
  final Curve slideReverseCurve;
  final Curve fadeCurve;
  final Curve fadeReverseCurve;
  final double scaleFrom;
  final double scaleTo;
  final Offset slideFrom;
  final Offset slideTo;
  final double fadeFrom;
  final double fadeTo;
  final AnimationController? externalController;
  final bool manualTrigger;
  final bool animate;
  final bool forceComplete;
  final Function(AnimateDoDirection direction)? onFinish;

  const CoreFadeScaleSlide({
    super.key,
    required this.child,
    required this.delay,
    required this.duration,
    required this.reverseDuration,
    required this.scaleCurve,
    required this.scaleReverseCurve,
    required this.slideCurve,
    required this.slideReverseCurve,
    required this.fadeCurve,
    required this.fadeReverseCurve,
    required this.scaleFrom,
    required this.scaleTo,
    required this.slideFrom,
    required this.slideTo,
    required this.fadeFrom,
    required this.fadeTo,
    this.externalController,
    this.manualTrigger = false,
    this.animate = true,
    this.forceComplete = true,
    this.onFinish,
  });

  @override
  State<CoreFadeScaleSlide> createState() => _CoreFadeScaleSlideState();
}

class _CoreFadeScaleSlideState extends State<CoreFadeScaleSlide>
    with SingleTickerProviderStateMixin, CoreAnimationMixin<CoreFadeScaleSlide> {
  late final Animation<double> scale;
  late final Animation<Offset> slide;
  late final Animation<double> opacity;

  @override
  void initState() {
    super.initState();

    initCoreAnimation(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      externalController: widget.externalController,
      onFinish: widget.onFinish,
    );

    scale = Tween<double>(
      begin: widget.scaleFrom,
      end: widget.scaleTo,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: widget.scaleCurve,
        reverseCurve: widget.scaleReverseCurve,
      ),
    );

    slide = Tween<Offset>(
      begin: widget.slideFrom,
      end: widget.slideTo,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: widget.slideCurve,
        reverseCurve: widget.slideReverseCurve,
      ),
    );

    opacity = Tween<double>(
      begin: widget.fadeFrom,
      end: widget.fadeTo,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: widget.fadeCurve,
        reverseCurve: widget.fadeReverseCurve,
      ),
    );

    startAnimationIfNeeded(
      animate: widget.animate,
      manualTrigger: widget.manualTrigger,
      delay: widget.delay,
    );
  }

  @override
  void didUpdateWidget(covariant CoreFadeScaleSlide oldWidget) {
    super.didUpdateWidget(oldWidget);

    handleAnimateUpdate(
      oldAnimate: oldWidget.animate,
      animate: widget.animate,
      forceComplete: widget.forceComplete,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        return Transform.translate(
          offset: slide.value,
          child: Transform.scale(
            scale: scale.value,
            child: Opacity(
              opacity: opacity.value,
              child: child,
            ),
          ),
        );
      },
      child: widget.child,
    );
  }
}