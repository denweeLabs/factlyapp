import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_fade_animation.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/core_tap_bounce_animation.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.iconPath,
    this.onTap,
    this.size = 24,
    this.color,
    this.padding,
    this.bounceMinScale = CoreTapBounceAnimation.defaultMinScale,
  });

  final String iconPath;
  final VoidCallback? onTap;
  final double size;
  final Color? color;
  final EdgeInsets? padding;
  final double bounceMinScale;

  @override
  Widget build(BuildContext context) {
    return BounceTapFadeAnimation(
      onTap: onTap,
      minScale: bounceMinScale,
      child: Padding(
        padding: padding ?? EdgeInsets.all(14.h),
        child: CommonAppIcon(
          path: iconPath,
          size: size,
          color: color,
        ),
      ),
    );
  }
}
