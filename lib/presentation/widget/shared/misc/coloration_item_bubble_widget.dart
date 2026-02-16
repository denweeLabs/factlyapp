import 'package:denwee/core/misc/domain/entity/theme_coloration.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/animations/tap_animations/bounce_tap_animation.dart';
import 'package:flutter/material.dart';

class ColorationItemBubble extends StatelessWidget {
  const ColorationItemBubble({
    super.key,
    required this.coloration,
    required this.isSelected,
    required this.onTap,
    required this.index,
    required this.size,
    this.offset = const Offset(0.0, 0.14),
  });

  final ThemeColoration coloration;
  final bool isSelected;
  final void Function(ThemeColoration) onTap;
  final double size;
  final Offset offset;
  final int index;

  static const minScale = 1.04;

  @override
  Widget build(BuildContext context) {
    final scale = isSelected ? 1.12 : 0.96;
    final slide = isSelected ? Offset.zero : offset;

    final scaleCurve = isSelected
        ? const Interval(0.15, 1.0, curve: CustomAnimationCurves.lowElasticOut)
        : const Interval(0.0, 0.6, curve: Curves.fastEaseInToSlowEaseOut);

    return Center(
      child: RepaintBoundary.wrap(
        BounceTapAnimation(
          minScale: minScale,
          onTap: () => onTap(coloration),
          child: AnimatedSlide(
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
