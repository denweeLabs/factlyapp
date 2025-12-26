import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({super.key, this.onTap, this.isChecked = false});

  final bool isChecked;
  final void Function()? onTap;

  static const size = Size(54.0, 34.0);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isChecked
        ? context.theme.colorScheme.secondary
        : context.secondaryContainer;
    final thumbAlignment =
        isChecked ? Alignment.centerRight : Alignment.centerLeft;

    return RepaintBoundary(
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox.fromSize(
          size: size,
          child: DecoratedBox(
            decoration: ShapeDecoration(
              shape: const RoundedSuperellipseBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                side: BorderSide(color: Colors.black12),
              ),
              color: backgroundColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: AnimatedAlign(
                alignment: thumbAlignment,
                curve: CustomAnimationCurves.fasterEaseInToSlowEaseOut,
                duration: CustomAnimationDurations.low,
                child: _buildThumb(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThumb(BuildContext context) {
    final thumbColor = isChecked
        ? context.lightPrimaryContainer
        : context.theme.colorScheme.secondary;

    return SizedBox(
      width: size.height,
      height: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: thumbColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
