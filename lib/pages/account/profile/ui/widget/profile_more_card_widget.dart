import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
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
      color: context.primaryContainer,
      hoverColor: context.secondaryContainer,
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
              style: bodyM.copyWith(color: context.textColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
