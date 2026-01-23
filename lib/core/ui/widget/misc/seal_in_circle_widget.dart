import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/widget/animations/animated_icons/seal_animated_icon_widget.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SealInCircle extends StatelessWidget {
  const SealInCircle({
    super.key,
    this.padding,
    this.size,
    this.onTap,
    this.backgroundColor,
    this.hideShadow = false,
  });

  final EdgeInsets? padding;
  final int? size;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final bool hideShadow;

  @override
  Widget build(BuildContext context) {
    return BounceTapAnimation(
      onTap: () {
        onTap?.call();
        HapticUtil.heavy();
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ?? context.primaryContainer,
          boxShadow: hideShadow ? null : [AppConstants.style.colors.commonShadow],
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.all(26.w).copyWith(left: 34.w),
          child: size == null
              ? const SealAnimatedIcon(
                  animate: true,
                  isLoop: true,
                  size: 78,
                )
              : SealAnimatedIcon(
                  animate: true,
                  isLoop: true,
                  size: size!,
                ),
        ),
      ),
    );
  }
}
