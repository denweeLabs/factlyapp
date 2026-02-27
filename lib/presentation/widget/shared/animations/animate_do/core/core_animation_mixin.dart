import 'package:flutter/material.dart';

enum AnimateDoDirection {
  forward,
  backward,
}

mixin CoreAnimationMixin<T extends StatefulWidget>
    on State<T>, SingleTickerProviderStateMixin<T> {
  late final AnimationController controller;

  bool _isExternal = false;

  void initCoreAnimation({
    required Duration duration,
    required Duration reverseDuration,
    required AnimationController? externalController,
    Function(AnimateDoDirection direction)? onFinish,
  }) {
    _isExternal = externalController != null;

    controller = externalController ??
        AnimationController(
          vsync: this,
          duration: duration,
          reverseDuration: reverseDuration,
        );

    if (onFinish != null) {
      controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          onFinish(AnimateDoDirection.forward);
        } else if (status == AnimationStatus.dismissed) {
          onFinish(AnimateDoDirection.backward);
        }
      });
    }
  }

  void startAnimationIfNeeded({
    required bool animate,
    required bool manualTrigger,
    Duration? delay,
  }) {
    if (_isExternal) return;
    
    if (!animate || manualTrigger) return;

    final hasDelay = delay != null && delay > Duration.zero;

    if (hasDelay) {
      Future.delayed(delay, () {
        if (!mounted || controller.isAnimating) return;
        controller.forward();
      });
    } else {
      controller.forward();
    }
  }

  void handleAnimateUpdate({
    required bool oldAnimate,
    required bool animate,
    required bool forceComplete,
    required Duration? delay,
  }) {
    if (_isExternal) return;
    
    if (oldAnimate == animate) return;

    final hasDelay = delay != null && delay > Duration.zero;

    if (animate) {
      if (hasDelay) {
        Future.delayed(delay, () {
          if (!mounted || controller.isAnimating) return;
          controller.forward();
        });
      } else {
        controller.forward();
      }
      return;
    }

    if (forceComplete) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        controller.value = 1.0;
        controller.animateBack(0.0);
      });
    } else {
      controller.animateBack(0.0);
    }
  }

  @override
  void dispose() {
    if (!_isExternal) {
      controller.dispose();
    }
    super.dispose();
  }
}