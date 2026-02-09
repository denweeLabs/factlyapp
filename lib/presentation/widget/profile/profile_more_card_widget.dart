import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/backdrop_surface_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMoreCard extends StatelessWidget {
  const ProfileMoreCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final String icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BackdropSurfaceContainer.ellipse(
      onTap: onTap,
      useShadow: true,
      color: context.primaryContainer,
      hoverColor: context.primaryContainer,
      borderColor: context.theme.dividerColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 22.w,
          vertical: 24.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppIcon(
              path: icon,
              size: 28,
              color: context.theme.colorScheme.secondary,
            ),
            const Spacer(),
            Text(
              title,
              style: bodyM.copyWith(
                color: context.textColor,
                fontFamily: AppConstants.style.textStyle.secondaryFontFamiliy,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
