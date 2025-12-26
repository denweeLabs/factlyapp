import 'package:denwee/core/ui/widget/animations/animate_do/core/core_animate_do.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';

/// Wrap your page with [RouteAwareAnimated] & provide RouteObserver and you can animate your widgets while page is being pushed/popped
class RouteAwareAnimated extends StatefulWidget {
  const RouteAwareAnimated({
    super.key,
    required this.builder,
    required this.observer,
    this.duration,
    this.reverseDuration,
    this.resetOnPop = true,
  });

  final Duration? duration;
  final Duration? reverseDuration;
  final RouteObserver<ModalRoute<void>> observer;
  final Widget Function(BuildContext, AnimationController) builder;
  final bool resetOnPop;

  @override
  State<RouteAwareAnimated> createState() => _RouteAwareAnimatedState();
}

class _RouteAwareAnimatedState extends State<RouteAwareAnimated>
    with TickerProviderStateMixin, RouteAware {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? RouteAwareAnimationValues.defaultDuration[AnimateDoDirection.forward]!,
      reverseDuration: widget.reverseDuration ?? RouteAwareAnimationValues.defaultDuration[AnimateDoDirection.backward]!,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.observer.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    widget.observer.unsubscribe(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didPushNext() {
    _controller.forward();
  }

  @override
  void didPopNext() {
    widget.resetOnPop ? _controller.reset() : _controller.reverse();
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, _controller);
}
