import 'package:denwee/core/misc/domain/entity/theme_coloration.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/core_tap_bounce_animation.dart';
import 'package:flutter/material.dart';

class ColorationItemBubble extends StatelessWidget {
  const ColorationItemBubble({
    super.key,
    required this.coloration,
    required this.isSelected,
    required this.onTap,
    required this.index,
    // this.size = 0.24,
    required this.size,
    this.offset = const Offset(0.0, 0.14),
  });

  final ThemeColoration coloration;
  final bool isSelected;
  final void Function(ThemeColoration) onTap;
  final double size;
  final Offset offset;
  final int index;

  @override
  Widget build(BuildContext context) {
    // final thisSize = size.sw;
    final scale = isSelected ? 1.12 : 0.96;
    final slide = isSelected ? Offset.zero : offset;

    final scaleCurve = isSelected
        ? const Interval(0.15, 1.0, curve: CustomAnimationCurves.lowElasticOut)
        : const Interval(0.0, 0.6, curve: Curves.fastEaseInToSlowEaseOut);

    return Center(
      child: RepaintBoundary.wrap(
        CoreTapBounceAnimation(
          minScale: 1.04,
          isHaptics: false,
          onTap: () => onTap(coloration),
          builder: (context, isHovered) => AnimatedSlide(
            offset: slide,
            curve: CustomAnimationCurves.fasterEaseInToSlowEaseOut,
            duration: CustomAnimationDurations.low,
            child: AnimatedScale(
              scale: scale,
              curve: scaleCurve,
              duration: CustomAnimationDurations.mediumHigh,
              child: SizedBox.square(
                dimension: size,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4.0),
                    gradient: AppConstants.style.colors.commonColoredGradient(
                      context,
                      color1: coloration.primary,
                      color2: coloration.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        index,
      ),
    );
  }
}
