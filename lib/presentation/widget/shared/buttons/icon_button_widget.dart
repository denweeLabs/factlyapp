import 'package:denwee/presentation/widget/shared/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
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
    this.ignoreIconColor = false,
  });

  final String iconPath;
  final VoidCallback? onTap;
  final double size;
  final Color? color;
  final EdgeInsets? padding;
  final bool ignoreIconColor;

  @override
  Widget build(BuildContext context) {
    return BounceTapAnimation(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.all(14.h),
        child: CommonAppIcon(
          path: iconPath,
          size: size,
          color: color,
          ignoreIconColor: ignoreIconColor,
        ),
      ),
    );
  }
}
