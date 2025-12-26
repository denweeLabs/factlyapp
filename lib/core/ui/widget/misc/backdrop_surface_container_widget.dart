import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/widgets_util.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/core_tap_bounce_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum BackdropSurfaceContainerType {
  circle,
  ellipse,
}

class BackdropSurfaceContainer extends StatelessWidget {
  static const defaultBackdropBlur = 0.0;
  
  const BackdropSurfaceContainer._({
    required this.type,
    required this.child,
    required this.blur,
    this.borderRadius,
    this.color,
    this.hoverColor,
    this.borderColor,
    this.size,
    this.onTap,
    this.onLongTap,
    super.key,
  });

  const BackdropSurfaceContainer.circle({
    Key? key,
    VoidCallback? onTap,
    VoidCallback? onLongTap,
    double blur = defaultBackdropBlur,
    Color? color,
    Color? hoverColor,
    Color? borderColor,
    Size? size,
    required Widget child,
  }) : this._(
          key: key,
          onTap: onTap,
          onLongTap: onLongTap,
          type: BackdropSurfaceContainerType.circle,
          blur: blur,
          color: color,
          hoverColor: hoverColor,
          borderColor: borderColor,
          size: size,
          child: child,
        );

  const BackdropSurfaceContainer.ellipse({
    Key? key,
    VoidCallback? onTap,
    VoidCallback? onLongTap,
    BorderRadius? borderRadius,
    Color? color,
    Color? hoverColor,
    Color? borderColor,
    Size? size,
    double blur = defaultBackdropBlur,
    required Widget child,
  }) : this._(
          key: key,
          type: BackdropSurfaceContainerType.ellipse,
          borderRadius: borderRadius,
          onTap: onTap,
          onLongTap: onLongTap,
          color: color,
          hoverColor: hoverColor,
          borderColor: borderColor,
          size: size,
          blur: blur,
          child: child,
        );

  final BackdropSurfaceContainerType type;
  final BorderRadius? borderRadius;
  final Size? size;
  final Color? color;
  final Color? hoverColor;
  final Color? borderColor;
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final double blur;

  static final defaultBorderRadius = BorderRadius.all(Radius.circular(28.r));

  @override
  Widget build(BuildContext context) {
    if (onTap == null && onLongTap == null) {
      return _build(context: context, isHovered: false);
    }
    
    return CoreTapBounceAnimation(
      onTap: onTap,
      onLongTap: onLongTap,
      builder: (context, isHovered) => _build(
        context: context,
        isHovered: isHovered,
      ),
    );
  }

  Widget _build({
    required BuildContext context,
    required bool isHovered,
  }) {
    switch (type) {
      case BackdropSurfaceContainerType.circle:
        final thisBackgroundColor = _getBackgroundColor(context, isHovered);
        final thisShape = borderColor == null
            ? const OvalBorder(side: BorderSide(color: Colors.black12))
            : OvalBorder(side: BorderSide(color: borderColor!));

        return SizedBox.fromSize(
          size: size,
          child: WidgetsUtil.maybeBackdrop(
            blur: blur,
            shape: BoxShape.circle,
            child: TweenAnimationBuilder<Color?>(
              tween: ColorTween(
                begin: thisBackgroundColor,
                end: thisBackgroundColor,
              ),
              curve: CoreTapBounceAnimation.curve,
              duration: CoreTapBounceAnimation.duration,
              builder: (_, color, child) => DecoratedBox(
                decoration: ShapeDecoration(color: color, shape: thisShape),
                child: child,
              ),
              child: child,
            ),
          ),
        );

      case BackdropSurfaceContainerType.ellipse:
        final thisBorderRadius = borderRadius ?? defaultBorderRadius;
        final thisBackgroundColor = _getBackgroundColor(context, isHovered);
        final thisShape = borderColor == null
            ? RoundedSuperellipseBorder(
                borderRadius: thisBorderRadius,
                side: const BorderSide(color: Colors.black12))
            : RoundedSuperellipseBorder(
                borderRadius: thisBorderRadius,
                side: BorderSide(color: borderColor!));

        return SizedBox.fromSize(
          size: size,
          child: WidgetsUtil.maybeBackdrop(
            blur: blur,
            shape: BoxShape.rectangle,
            borderRadius: thisBorderRadius,
            child: TweenAnimationBuilder<Color?>(
              tween: ColorTween(
                begin: thisBackgroundColor,
                end: thisBackgroundColor,
              ),
              curve: CoreTapBounceAnimation.curve,
              duration: CoreTapBounceAnimation.duration,
              builder: (_, color, child) => DecoratedBox(
                decoration: ShapeDecoration(color: color, shape: thisShape),
                child: child,
              ),
              child: child,
            ),
          ),
        );
    }
  }

  Color _getBackgroundColor(BuildContext context, bool isHovered) {
    if (isHovered) return hoverColor ?? Colors.white12;
    return color ?? context.lightSurfaceContainerTernanry;
  }
}
