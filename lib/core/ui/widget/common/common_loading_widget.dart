import 'dart:math' as math;

import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum LoadingType { rotatingDots, stretchedDots }

extension LoadingAnimationControllerX on AnimationController {
  T eval<T>(Tween<T> tween, {Curve curve = Curves.linear}) =>
      tween.transform(curve.transform(value));

  double evalDouble({
    double from = 0,
    double to = 1,
    double begin = 0,
    double end = 1,
    Curve curve = Curves.linear,
  }) {
    return eval(
      Tween<double>(begin: from, end: to),
      curve: Interval(begin, end, curve: curve),
    );
  }
}

class CommonLoading extends StatelessWidget {
  const CommonLoading({
    super.key,
    this.size = 22,
    this.color,
    this.type = LoadingType.rotatingDots,
  });

  final int size;
  final Color? color;
  final LoadingType type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LoadingType.rotatingDots:
        return RepaintBoundary(
          child: FourRotatingDots(
            color: color ?? context.iconColor,
            size: size.w,
          ),
        );

      case LoadingType.stretchedDots:
        return RepaintBoundary(
          child: StretchedDots(
            color: color ?? context.iconColor,
            size: size.w,
          ),
        );
    }
  }
}

class FourRotatingDots extends StatefulWidget {
  final double size;
  final Color color;

  const FourRotatingDots({
    super.key,
    required this.color,
    required this.size,
  });

  @override
  _FourRotatingDotsState createState() => _FourRotatingDotsState();
}

class _FourRotatingDotsState extends State<FourRotatingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2200,
      ),
    )..repeat();
  }

  Widget _rotatingDots({
    required bool visible,
    required Color color,
    required double dotSize,
    required double offset,
    required double initialAngle,
    required double finalAngle,
    required Interval interval,
  }) {
    final double angle = _animationController.eval(
      Tween<double>(begin: initialAngle, end: finalAngle),
      curve: interval,
    );
    return Visibility(
      visible: visible,
      child: Transform.rotate(
        angle: angle,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Transform.translate(
              offset: Offset(-offset, 0),
              child: DrawDot.circular(
                dotSize: dotSize,
                color: color,
              ),
            ),
            Transform.translate(
              offset: Offset(offset, 0),
              child: DrawDot.circular(
                dotSize: dotSize,
                color: color,
              ),
            ),
            Transform.translate(
              offset: Offset(0, -offset),
              child: DrawDot.circular(
                dotSize: dotSize,
                color: color,
              ),
            ),
            Transform.translate(
              offset: Offset(0, offset),
              child: DrawDot.circular(
                dotSize: dotSize,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _animatingDots({
    required bool fixedSize,
    required Color color,
    required double dotInitialSize,
    required double initialOffset,
    required double finalOffset,
    required Interval interval,
    double? dotFinalSize,
    required bool visible,
  }) {
    final double dotSize = fixedSize
        ? dotInitialSize
        : _animationController.eval(
            Tween<double>(begin: dotInitialSize, end: dotFinalSize),
            curve: interval,
          );

    return Visibility(
      visible: visible,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Transform.translate(
            offset: _animationController.eval(
              Tween<Offset>(
                begin: Offset(-initialOffset, 0),
                end: Offset(-finalOffset, 0),
              ),
              curve: interval,
            ),
            child: DrawDot.circular(
              dotSize: dotSize,
              color: color,
            ),
          ),
          Transform.translate(
            offset: _animationController.eval(
              Tween<Offset>(
                begin: Offset(initialOffset, 0),
                end: Offset(finalOffset, 0),
              ),
              curve: interval,
            ),
            child: DrawDot.circular(
              dotSize: dotSize,
              color: color,
            ),
          ),
          Transform.translate(
            offset: _animationController.eval(
              Tween<Offset>(
                begin: Offset(0, -initialOffset),
                end: Offset(0, -finalOffset),
              ),
              curve: interval,
            ),
            child: DrawDot.circular(
              dotSize: dotSize,
              color: color,
            ),
          ),
          Transform.translate(
            offset: _animationController.eval(
              Tween<Offset>(
                begin: Offset(0, initialOffset),
                end: Offset(0, finalOffset),
              ),
              curve: interval,
            ),
            child: DrawDot.circular(
              dotSize: dotSize,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    final Color color = widget.color;
    final double dotMaxSize = size * 0.30;
    final double dotMinSize = size * 0.14;
    final double maxOffset = size * 0.35;

    return SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Transform.rotate(
                angle: _animationController.evalDouble(
                  to: math.pi / 8,
                  begin: 0.0,
                  end: 0.18,
                ),
                child: _animatingDots(
                  visible: _animationController.value <= 0.18,
                  fixedSize: true,
                  color: color,
                  dotInitialSize: dotMaxSize,
                  initialOffset: maxOffset,
                  finalOffset: 0,
                  interval: const Interval(
                    0.0,
                    0.18,
                    curve: Curves.easeInQuart,
                  ),
                ),
              ),
              Transform.rotate(
                angle: _animationController.evalDouble(
                  from: math.pi / 8,
                  to: math.pi / 4,
                  begin: 0.18,
                  end: 0.36,
                ),
                child: _animatingDots(
                  visible: _animationController.value >= 0.18 &&
                      _animationController.value <= 0.36,
                  fixedSize: false,
                  color: color,
                  dotInitialSize: dotMaxSize,
                  dotFinalSize: dotMinSize,
                  initialOffset: 0,
                  finalOffset: maxOffset,
                  interval: const Interval(
                    0.18,
                    0.36,
                    curve: Curves.easeOutQuart,
                  ),
                ),
              ),
              _rotatingDots(
                visible: _animationController.value >= 0.36 &&
                    _animationController.value <= 0.60,
                color: color,
                dotSize: dotMinSize,
                initialAngle: math.pi / 4,
                finalAngle: 7 * math.pi / 4,
                interval: const Interval(
                  0.36,
                  0.60,
                  curve: Curves.easeInOutSine,
                ),
                offset: maxOffset,
              ),
              Transform.rotate(
                angle: _animationController.evalDouble(
                  from: 7 * math.pi / 4,
                  to: 2 * math.pi,
                  begin: 0.6,
                  end: 0.78,
                ),
                child: _animatingDots(
                  visible: _animationController.value >= 0.60 &&
                      _animationController.value <= 0.78,
                  fixedSize: false,
                  color: color,
                  dotInitialSize: dotMinSize,
                  dotFinalSize: dotMaxSize,
                  initialOffset: maxOffset,
                  finalOffset: 0,
                  interval: const Interval(
                    0.60,
                    0.78,
                    curve: Curves.easeInQuart,
                  ),
                ),
              ),
              _animatingDots(
                visible: _animationController.value >= 0.78 &&
                    _animationController.value <= 1.0,
                fixedSize: true,
                color: color,
                dotInitialSize: dotMaxSize,
                initialOffset: 0,
                finalOffset: maxOffset,
                interval: const Interval(
                  0.78,
                  0.96,
                  curve: Curves.easeOutQuart,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}


class DrawDot extends StatelessWidget {
  final double width;
  final double height;
  final bool circular;
  final Color color;

  const DrawDot.circular({
    super.key,
    required double dotSize,
    required this.color,
  })  : width = dotSize,
        height = dotSize,
        circular = true;

  const DrawDot.elliptical({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  })  : circular = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: circular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: circular
            ? null
            : BorderRadius.all(Radius.elliptical(width, height)),
      ),
    );
  }
}


class StretchedDots extends StatefulWidget {
  final double size;
  // final int time;
  final Color color;
  final double innerHeight;
  final double dotWidth;

  const StretchedDots({
    super.key,
    required this.size,
    required this.color,
    // required this.time,
  })  : innerHeight = size / 1.3,
        dotWidth = size / 8;

  @override
  State<StretchedDots> createState() => _StretchedDotsState();
}

class _StretchedDotsState extends State<StretchedDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final Cubic firstCurve = Curves.easeInCubic;
  final Cubic seconCurve = Curves.easeOutCubic;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    final double innerHeight = widget.innerHeight;
    final double dotWidth = widget.dotWidth;
    final Color color = widget.color;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) => Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        child: SizedBox(
          height: innerHeight,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  BuildDot(
                    controller: _animationController,
                    innerHeight: innerHeight,
                    firstInterval: Interval(
                      0.0,
                      0.15,
                      curve: firstCurve,
                    ),
                    secondInterval: Interval(
                      0.15,
                      0.30,
                      curve: seconCurve,
                    ),
                    thirdInterval: Interval(
                      0.5,
                      0.65,
                      curve: firstCurve,
                    ),
                    forthInterval: Interval(
                      0.65,
                      0.80,
                      curve: seconCurve,
                    ),
                    dotWidth: dotWidth,
                    color: color,
                  ),
                  BuildDot(
                    controller: _animationController,
                    innerHeight: innerHeight,
                    firstInterval: Interval(
                      0.05,
                      0.20,
                      curve: firstCurve,
                    ),
                    secondInterval: Interval(
                      0.20,
                      0.35,
                      curve: seconCurve,
                    ),
                    thirdInterval: Interval(
                      0.55,
                      0.70,
                      curve: firstCurve,
                    ),
                    forthInterval: Interval(
                      0.70,
                      0.85,
                      curve: seconCurve,
                    ),
                    dotWidth: dotWidth,
                    color: color,
                  ),
                  BuildDot(
                    controller: _animationController,
                    innerHeight: innerHeight,
                    firstInterval: Interval(
                      0.10,
                      0.25,
                      curve: firstCurve,
                    ),
                    secondInterval: Interval(
                      0.25,
                      0.40,
                      curve: seconCurve,
                    ),
                    thirdInterval: Interval(
                      0.60,
                      0.75,
                      curve: firstCurve,
                    ),
                    forthInterval: Interval(
                      0.75,
                      0.90,
                      curve: seconCurve,
                    ),
                    dotWidth: dotWidth,
                    color: color,
                  ),
                  BuildDot(
                    controller: _animationController,
                    innerHeight: innerHeight,
                    firstInterval: Interval(
                      0.15,
                      0.30,
                      curve: firstCurve,
                    ),
                    secondInterval: Interval(
                      0.30,
                      0.45,
                      curve: seconCurve,
                    ),
                    thirdInterval: Interval(
                      0.65,
                      0.80,
                      curve: firstCurve,
                    ),
                    forthInterval: Interval(
                      0.80,
                      0.95,
                      curve: seconCurve,
                    ),
                    dotWidth: dotWidth,
                    color: color,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}


class BuildDot extends StatelessWidget {
  final AnimationController controller;
  final double dotWidth;
  final Color color;
  final double innerHeight;

  final Interval firstInterval;
  final Interval secondInterval;
  final Interval thirdInterval;
  final Interval forthInterval;

  const BuildDot({
    Key? key,
    required this.controller,
    required this.dotWidth,
    required this.color,
    required this.innerHeight,
    required this.firstInterval,
    required this.secondInterval,
    required this.thirdInterval,
    required this.forthInterval,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double offset = innerHeight / 4.85;
    final double height = innerHeight / 1.7;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        controller.value < firstInterval.end
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Transform.translate(
                  offset: controller.eval(
                    Tween<Offset>(begin: Offset.zero, end: Offset(0, -offset)),
                    curve: firstInterval,
                  ),
                  child: RoundedRectangle.vertical(
                    width: dotWidth,
                    // height: height,
                    color: color,
                    height: controller.eval(
                      Tween<double>(begin: dotWidth, end: height),
                      curve: firstInterval,
                    ),
                  ),
                ),
              )
            : Visibility(
                visible: controller.value <= secondInterval.end,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Transform.translate(
                    offset: controller.eval(
                      Tween<Offset>(begin: Offset(0, offset), end: Offset.zero),
                      curve: secondInterval,
                    ),
                    child: RoundedRectangle.vertical(
                      width: dotWidth,
                      color: color,
                      height: controller.eval(
                        Tween<double>(begin: height, end: dotWidth),
                        curve: secondInterval,
                      ),
                    ),
                  ),
                ),
              ),
        controller.value < thirdInterval.end
            ? Visibility(
                visible: controller.value >= secondInterval.end,
                replacement: SizedBox(
                  width: dotWidth,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Transform.translate(
                    offset: controller.eval(
                      Tween<Offset>(begin: Offset.zero, end: Offset(0, offset)),
                      curve: thirdInterval,
                    ),
                    child: RoundedRectangle.vertical(
                      width: dotWidth,
                      height: controller.eval(
                        Tween<double>(begin: dotWidth, end: height),
                        curve: thirdInterval,
                      ),
                      color: color,
                    ),
                  ),
                ),
              )
            : Align(
                alignment: Alignment.bottomCenter,
                child: Transform.translate(
                  offset: controller.eval(
                    Tween<Offset>(begin: Offset(0, -offset), end: Offset.zero),
                    curve: forthInterval,
                  ),
                  child: RoundedRectangle.vertical(
                    width: dotWidth,
                    height: controller.eval(
                      Tween<double>(begin: height, end: dotWidth),
                      curve: forthInterval,
                    ),
                    color: color,
                  ),
                ),
              ),
      ],
    );
  }
}


class RoundedRectangle extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final bool vertical;
  const RoundedRectangle.vertical({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  })  : vertical = true;

  const RoundedRectangle.horizontal({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  })  : vertical = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          vertical ? width : height,
        ),
      ),
    );
  }
}
