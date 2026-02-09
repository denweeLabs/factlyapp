import 'package:flutter/material.dart';

class StoriesInterestBackgroundImage extends StatelessWidget {
  const StoriesInterestBackgroundImage({
    super.key,
    required this.size,
    required this.path,
  });

  final Size size;
  final String path;

  @override
  Widget build(BuildContext context) {
    final cacheHeight = size.height.toInt() + 64;

    return Image.asset(
      path,
      fit: BoxFit.cover,
      width: size.width,
      height: size.height,
      cacheHeight: cacheHeight,
    );
  }
}

class StoriesInterestBackgroundAnimatedImage extends StatefulWidget {
  const StoriesInterestBackgroundAnimatedImage({
    required this.path,
    required this.size,
    super.key,
  });

  final String path;
  final Size size;

  @override
  State<StoriesInterestBackgroundAnimatedImage> createState() =>
      StoriesInterestBackgroundAnimatedImageState();
}

class StoriesInterestBackgroundAnimatedImageState
    extends State<StoriesInterestBackgroundAnimatedImage>
    with TickerProviderStateMixin {
  static const appearDuration = Duration(milliseconds: 1100);

  late final appearController = AnimationController(
    vsync: this,
    duration: appearDuration,
  );
  late final appearScale = Tween<double>(
    begin: 1.04,
    end: 1.0,
  ).animate(CurvedAnimation(parent: appearController, curve: Curves.easeOut));
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
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: appearController,
        builder: (context, child) =>
            Transform.scale(scale: appearScale.value, child: child),
        child: StoriesInterestBackgroundImage(
          path: widget.path,
          size: widget.size,
        ),
      ),
    );
  }
}
