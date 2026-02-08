import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/backdrop_surface_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoriesScrollupButton extends StatelessWidget {
  const StoriesScrollupButton({super.key, required this.onTap});

  final VoidCallback onTap;

  static final size = 46.w;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropSurfaceContainer.circle(
        onTap: onTap,
        size: Size.square(size),
        color: context.lightPrimaryContainer,
        hoverColor: Colors.white70,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CommonAppIcon(
              path: AppConstants.assets.icons.arrowUpIos,
              color: context.darkIconColor,
              size: 26,
            ),
          ),
        ),
      ),
    );
  }
}
