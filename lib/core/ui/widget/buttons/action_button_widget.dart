import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppActionButton extends StatelessWidget {
  const AppActionButton({
    super.key,
    required this.iconPath,
    this.size = defaultSize,
    this.iconSize = 32,
    this.onTap,
    this.color,
    this.hoverColor,
    this.iconColor,
  });

  final String iconPath;
  final VoidCallback? onTap;
  final int size;
  final int iconSize;
  final Color? color;
  final Color? hoverColor;
  final Color? iconColor;

  static const defaultSize = 62;

  @override
  Widget build(BuildContext context) {
    return BackdropSurfaceContainer.ellipse(
      onTap: onTap,
      color: color ?? context.theme.colorScheme.primary,
      hoverColor: hoverColor ?? context.theme.colorScheme.secondary,
      borderRadius: BorderRadius.all(AppConstants.style.radius.actionButton),
      size: Size.square(size.w),
      child: Center(
        child: CommonAppIcon(
          path: iconPath,
          color: iconColor ?? context.lightIconColor,
          size: iconSize.toDouble(),
        ),
      ),
    );
  }
}
