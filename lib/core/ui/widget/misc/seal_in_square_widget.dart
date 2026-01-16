import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/widget/animations/animated_icons/seal_animated_icon_widget.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SealInSquare extends StatelessWidget {
  const SealInSquare({super.key, this.padding, this.size, this.onTap});

  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final int? size;

  @override
  Widget build(BuildContext context) {
    return BounceTapAnimation(
      onTap: () {
        onTap?.call();
        HapticUtil.heavy();
      },
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: const RoundedSuperellipseBorder(
            borderRadius: BorderRadius.all(Radius.circular(44.0)),
          ),
          color: context.primaryContainer,
          shadows: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 12.0),
              spreadRadius: -5.0,
              blurRadius: 15.0,
            ),
          ],
        ),
        child: ClipRSuperellipse(
          borderRadius: BorderRadius.all(Radius.circular(44.0)),
          child: Stack(
            children: [
              Positioned(
                right: -50,
                bottom: -50,
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: padding ?? EdgeInsets.all(34.w).copyWith(left: 42.w),
                child: size == null
                    ? const SealAnimatedIcon(animate: true, isLoop: true, size: 68)
                    : SealAnimatedIcon(animate: true, isLoop: true, size: size!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
