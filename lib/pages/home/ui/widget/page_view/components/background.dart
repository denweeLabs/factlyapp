import 'dart:ui';

import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/misc/fading_edge_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FactBackgroundImage extends StatelessWidget {
  const FactBackgroundImage({
    super.key,
    required this.imagePath,
    required this.scrollOffset,
    required this.pageHeight,
  });

  final String imagePath;
  final ValueNotifier<double> scrollOffset;
  final double pageHeight;

  static final topFadeHeight = 1.sh * 0.25;

  @override
  Widget build(BuildContext context) {
    final screenSize = Size(1.sw, 1.sh);

    return Stack(
      children: [
        Positioned.fill(
          child: ValueListenableBuilder(
            valueListenable: scrollOffset,
            builder: (context, scrollOffset, child) {
              final fraction = (scrollOffset / pageHeight).clamp(0.0, 1.0);
              final opacity = lerpDouble(0.65, 0.9, fraction)!;

              return DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  color: context.darkPrimaryContainer.withValues(alpha: opacity),
                ),
                child: child!,
              );
            },
            child: AnimatedSwitcher(
              switchInCurve: Curves.ease,
              switchOutCurve: Curves.ease,
              duration: CustomAnimationDurations.low,
              child: _Image(
                path: imagePath,
                size: screenSize,
                key: ValueKey(imagePath),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: topFadeHeight,
          child: const IgnorePointer(
            child: FadingSingleEdge(
              axis: Axis.vertical,
              child: ColoredBox(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }
}

class _Image extends StatefulWidget {
  const _Image({
    required this.path,
    required this.size,
    super.key,
  });

  final String path;
  final Size size;

  @override
  State<_Image> createState() => _ImageState();
}

class _ImageState extends State<_Image> with TickerProviderStateMixin {
  static const appearDuration = Duration(milliseconds: 1500);
  // static const movementDuration = Duration(milliseconds: 45000);
  // static const movementPreDelayDuration = Duration(milliseconds: 3500);

  late final appearController = AnimationController(
    vsync: this,
    duration: appearDuration,
  );
  late final appearScale = Tween<double>(begin: 1.04, end: 1.0).animate(
    CurvedAnimation(
      parent: appearController,
      curve: Curves.easeOut,
    ),
  );
  late final appearBlur = Tween<double>(begin: 5.0, end: 0.0).animate(
    CurvedAnimation(
      parent: appearController,
      curve: Curves.fastEaseInToSlowEaseOut,
    ),
  );

  // late final movementController = AnimationController(
  //   vsync: this,
  //   duration: movementDuration,
  // );
  // late final movementScale = Tween<double>(begin: 1.0, end: 1.3).animate(
  //   CurvedAnimation(
  //     parent: movementController,
  //     curve: Curves.easeOutSine,
  //     reverseCurve: Curves.easeIn,
  //   ),
  // );
  // late final movementScaleAlignment =
  //     Tween<Alignment>(begin: Alignment(0.0, 0.0), end: Alignment(-0.25, 0.65))
  //         .animate(
  //   CurvedAnimation(
  //     parent: movementController,
  //     curve: Curves.easeInOutQuad,
  //     reverseCurve: Curves.easeIn,
  //   ),
  // );

  @override
  void initState() {
    appearController.forward();
    // Future.delayed(movementPreDelayDuration, () {
    //   if (mounted) {
    //     movementController.loop(reverse: true);
    //   }
    // });
    super.initState();
  }

  @override
  void dispose() {
    appearController.dispose();
    // movementController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appearController,
      builder: (context, child) => Transform.scale(
        scale: appearScale.value,
        child: child,
      ),
      child: Image(
        image: AssetImage(widget.path),
        fit: BoxFit.cover,
        width: widget.size.width,
        height: widget.size.height,
      ),
    );
  }
}
