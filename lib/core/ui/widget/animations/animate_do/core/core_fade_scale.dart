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
class CoreFadeScale extends StatefulWidget {
  final Widget child;
  final Duration? delay;
  final Duration duration;
  final Duration reverseDuration;
  final Curve scaleCurve;
  final Curve scaleReverseCurve;
  final Curve fadeCurve;
  final Curve fadeReverseCurve;
  final double scaleFrom;
  final double scaleTo;
  final double fadeFrom;
  final double fadeTo;
  final Function(AnimationController)? controllerProvider;
  final AnimationController? externalController;
  final bool manualTrigger;
  final bool animate;
  final Function(AnimateDoDirection direction)? onFinish;
  final bool forceComplete;

  const CoreFadeScale({
    required this.child,
    required this.delay,
    required this.duration,
    required this.reverseDuration,
    required this.scaleCurve,
    required this.scaleReverseCurve,
    required this.fadeCurve,
    required this.fadeReverseCurve,
    required this.scaleFrom,
    required this.scaleTo,
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
  CoreFadeScaleState createState() => CoreFadeScaleState();
}

class CoreFadeScaleState extends State<CoreFadeScale>
    with SingleTickerProviderStateMixin, AnimateDoState {
    
  late Animation<double> scale;
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

    scale = Tween<double>(begin: widget.scaleFrom, end: widget.scaleTo)
        .animate(CurvedAnimation(
      parent: controller,
      curve: widget.scaleCurve,
      reverseCurve: widget.scaleReverseCurve,
    ));

    opacity = Tween<double>(begin: widget.fadeFrom, end: widget.fadeTo)
        .animate(CurvedAnimation(
      parent: controller,
      curve: widget.fadeCurve,
      reverseCurve: widget.fadeReverseCurve,
    ));

    configAnimation(
      delay: delay,
      animate: widget.animate,
      manualTrigger: widget.manualTrigger,
      infinite: false,
      onFinish: widget.onFinish,
      controllerCallback: widget.controllerProvider,
    );
  }

  @override
  Widget build(BuildContext context) {
    buildAnimation(
      delay: delay,
      animate: widget.animate,
      manualTrigger: widget.manualTrigger,
      infinite: false,
      onFinish: widget.onFinish,
      controllerCallback: widget.controllerProvider,
      forceComplete: widget.forceComplete,
    );

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: scale.value,
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