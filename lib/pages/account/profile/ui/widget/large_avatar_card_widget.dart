import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LargeAvatarCard extends StatelessWidget {
  const LargeAvatarCard({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  static final width = 0.56.sw;
  static final height = 0.28.sh;

  static final outerRadius = 40.r;

  @override
  Widget build(BuildContext context) {
    return BounceTapAnimation(
      minScale: 1.08,
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: AppConstants.style.colors.commonColoredGradient(context),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(outerRadius),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              color: context.primaryContainer.withValues(alpha: 0.1),
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: CommonAppIcon(
                path: AppConstants.assets.icons.galleryAddLinear,
                color: context.lightIconColor,
                size: 34,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
