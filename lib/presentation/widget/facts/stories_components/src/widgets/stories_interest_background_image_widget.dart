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

  @override
  void initState() {
    appearController.forward();
    super.initState();
  }

  @override
  void dispose() {
    appearController.dispose();
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
