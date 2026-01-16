import 'dart:ui';

import 'package:denwee/core/facts/ui/stories_components/src/widgets/stories_interest_background_image_widget.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/misc/fading_edge_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoriesViewBackground extends StatelessWidget {
  const StoriesViewBackground({
    super.key,
    required this.imagePath,
    required this.scrollFraction,
    this.isAnimated = true,
  });

  final String imagePath;
  final ValueListenable<double> scrollFraction;
  final bool isAnimated;

  static final topFadeHeight = 1.sh * 0.25;
  static final screenSize = Size(1.sw, 1.sh);
  static const minFade = 0.77;
  static const maxFade = 0.94;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ValueListenableBuilder(
            valueListenable: scrollFraction,
            builder: (context, scrollFraction, child) {
              final opacity = lerpDouble(minFade, maxFade, scrollFraction)!;

              return DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  color: context.darkPrimaryContainer.withValues(
                    alpha: opacity,
                  ),
                ),
                child: child!,
              );
            },
            child: AnimatedSwitcher(
              switchInCurve: Curves.ease,
              switchOutCurve: Curves.ease,
              duration: CustomAnimationDurations.low,
              child: isAnimated
                  ? StoriesInterestBackgroundAnimatedImage(
                      path: imagePath,
                      size: screenSize,
                      key: ValueKey(imagePath),
                    )
                  : StoriesInterestBackgroundImage(
                      size: screenSize,
                      path: imagePath,
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
