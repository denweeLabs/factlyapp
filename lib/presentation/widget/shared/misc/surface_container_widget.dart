import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_colors.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/shimmer_animation_widget.dart';
import 'package:denwee/presentation/widget/shared/animations/tap_animations/bounce_tap_with_builder_animation.dart';
import 'package:flutter/material.dart';

enum SurfaceContainerType {
  circle,
  ellipse,
}

class SurfaceContainer extends StatelessWidget {
  static const _defaultBorderRadius = BorderRadius.all(Radius.circular(28));
  static const _defaultElevation = 0.0;

  const SurfaceContainer.circle({
    super.key,
    this.onTap,
    this.onLongTap,
    this.color,
    this.gradient,
    this.hoverColor,
    this.borderColor,
    this.size,
    this.elevation = _defaultElevation,
    this.isShimmering = false,
    required this.child,
  }) : borderRadius = null,
       type = SurfaceContainerType.circle;

  const SurfaceContainer.ellipse({
    super.key,
    this.onTap,
    this.onLongTap,
    this.borderRadius,
    this.color,
    this.gradient,
    this.hoverColor,
    this.borderColor,
    this.size,
    this.elevation = _defaultElevation,
    this.isShimmering = false,
    required this.child,
  }) : type = SurfaceContainerType.ellipse;

  final SurfaceContainerType type;
  final BorderRadius? borderRadius;
  final Size? size;
  final Color? color;
  final Gradient? gradient;
  final Color? hoverColor;
  final Color? borderColor;
  final bool isShimmering;
  final double elevation;
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;

  ShapeBorder _effectiveShapeBorder(Color borderColor) {
    switch (type) {
      case SurfaceContainerType.circle:
        return OvalBorder(side: BorderSide(color: borderColor));
      case SurfaceContainerType.ellipse:
        return RoundedSuperellipseBorder(
          borderRadius: borderRadius ?? _defaultBorderRadius,
          side: BorderSide(color: borderColor),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBaseColor = color ?? context.lightSurfaceContainerTernanry;
    final effectiveHoverColor = hoverColor ?? (context.isLightTheme ? AppColors.black04 : AppColors.white08);
    final effectiveBorderColor = borderColor ?? (context.isLightTheme ? Colors.black12 : Colors.white10);
    final effectiveShape = _effectiveShapeBorder(effectiveBorderColor);

    return BounceTapWithBuilderAnimation(
      onTap: onTap,
      onLongTap: onLongTap,
      builder: (context, animation) => _buildSurface(
        context: context,
        animation: animation,
        baseColor: effectiveBaseColor,
        hoverColor: effectiveHoverColor,
        shape: effectiveShape,
      ),
    );
  }

  Widget _buildSurface({
    required BuildContext context,
    required Animation<double> animation,
    required Color baseColor,
    required Color hoverColor,
    required ShapeBorder shape,
  }) {
    return SizedBox.fromSize(
      size: size,
      child: PhysicalShape(
        elevation: elevation,
        clipper: ShapeBorderClipper(shape: shape),
        clipBehavior: isShimmering ? Clip.hardEdge : Clip.none,
        color: Colors.transparent,
        shadowColor: AppConstants.style.colors.commonShadow.color,
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            if (gradient != null) {
              return DecoratedBox(
                decoration: ShapeDecoration(shape: shape, gradient: gradient),
                child: child,
              );
            }

            final animationValue = const Interval(0.5, 1.0).transform(animation.value);
            final backgroundColor = Color.lerp(baseColor, hoverColor, animationValue)!;

            return DecoratedBox(
              decoration: ShapeDecoration(shape: shape, color: backgroundColor),
              child: child,
            );
          },
          child: Stack(
            children: [
              child,
              if (isShimmering) const Positioned.fill(
                child: ShimmerAnimation(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
