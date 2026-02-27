import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/presentation/widget/shared/common/common_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundSelectionCardBody extends StatelessWidget {
  const BackgroundSelectionCardBody({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.onLongTap,
    required this.lettersStyle,
    required this.isApplying,
    required this.child,
    this.width = defaultWidth,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onLongTap;
  final TextStyle lettersStyle;
  final bool isApplying;
  final double width;
  final Widget child;

  static const defaultWidth = 124.0;
  static const padding = EdgeInsets.all(5.0);
  static const borderRadius = BorderRadius.all(Radius.circular(24));
  static const selectedBorderRadius = BorderRadius.all(Radius.circular(28));
  static const clipper = ShapeBorderClipper(
    shape: RoundedSuperellipseBorder(borderRadius: borderRadius),
  );

  @override
  Widget build(BuildContext context) {
    return BounceTapAnimation(
      onTap: onTap,
      onLongTap: onLongTap,
      child: SizedBox.fromSize(
        size: Size.fromWidth(width.w),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: padding,
              child: PhysicalShape(
                elevation: 0.0,
                clipper: clipper,
                color: context.secondaryContainer,
                clipBehavior: Clip.hardEdge,
                child: child,
              ),
            ),
            if (isSelected)
              DecoratedBox(
                decoration: ShapeDecoration(
                  shape: RoundedSuperellipseBorder(
                    borderRadius: selectedBorderRadius,
                    side: BorderSide(
                      color: context.iconColorTernary,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            Center(
              child: RepaintBoundary(
                child: AnimatedSwitcher(
                  switchInCurve: Curves.easeInOutQuad,
                  switchOutCurve: Curves.easeInOutQuad,
                  duration: CustomAnimationDurations.ultraLow,
                  child: isApplying
                      ? const CommonLoading(
                          key: ValueKey(false),
                          color: Colors.white,
                        )
                      : Text(
                          'Aa',
                          key: const ValueKey(true),
                          style: lettersStyle,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
