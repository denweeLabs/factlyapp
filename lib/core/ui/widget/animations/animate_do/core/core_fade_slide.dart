import 'package:denwee/core/ui/widget/animations/animate_do/core/core_animate_do.dart';
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
class CoreFadeSlide extends StatefulWidget {
  final Widget child;
  final Duration? delay;
  final Duration duration;
  final Duration reverseDuration;
  final Curve slideCurve;
  final Curve slideReverseCurve;
  final Curve fadeCurve;
  final Curve fadeReverseCurve;
  final Offset slideFrom;
  final Offset slideTo;
  final double fadeFrom;
  final double fadeTo;
  final Function(AnimationController)? controllerProvider;
  final AnimationController? externalController;
  final bool manualTrigger;
  final bool animate;
  final bool forceComplete;
  final Function(AnimateDoDirection direction)? onFinish;

  const CoreFadeSlide({
    required this.child,
    required this.delay,
    required this.duration,
    required this.reverseDuration,
    required this.slideCurve,
    required this.slideReverseCurve,
    required this.fadeCurve,
    required this.fadeReverseCurve,
    required this.slideFrom,
    required this.slideTo,
    required this.fadeFrom,
    required this.fadeTo,
    this.controllerProvider,
    this.externalController,
    this.manualTrigger = false,
    this.animate = true,
    this.forceComplete = true,
    this.onFinish,
    super.key,
  });

  @override
  CoreFadeSlideState createState() => CoreFadeSlideState();
}

class CoreFadeSlideState extends State<CoreFadeSlide>
    with SingleTickerProviderStateMixin, AnimateDoState {
    
  late Animation<Offset> slide;
  late Animation<double> opacity;

  Duration get delay {
    return widget.delay ?? Duration.zero;
  }

  @override
  void dispose() {
    disposed = true;
    if (widget.externalController == null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = widget.externalController ??
        AnimationController(
          duration: widget.duration,
          reverseDuration: widget.reverseDuration,
          vsync: this,
        );

    slide = Tween<Offset>(begin: widget.slideFrom, end: widget.slideTo)
        .animate(CurvedAnimation(
      parent: controller,
      curve: widget.slideCurve,
      reverseCurve: widget.slideReverseCurve,
    ));

    opacity = Tween<double>(begin: widget.fadeFrom, end: widget.fadeTo)
        .animate(CurvedAnimation(
      parent: controller,
      curve: widget.fadeCurve,
      reverseCurve: widget.fadeReverseCurve,
    ));

    if (widget.externalController == null) {
      configAnimation(
        delay: delay,
        animate: widget.animate,
        manualTrigger: widget.manualTrigger,
        infinite: false,
        onFinish: widget.onFinish,
        controllerCallback: widget.controllerProvider,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.externalController == null) {
      buildAnimation(
        delay: delay,
        animate: widget.animate,
        manualTrigger: widget.manualTrigger,
        infinite: false,
        onFinish: widget.onFinish,
        controllerCallback: widget.controllerProvider,
        forceComplete: widget.forceComplete,
      );
    }

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: slide.value,
          child: Opacity(
            opacity: opacity.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}