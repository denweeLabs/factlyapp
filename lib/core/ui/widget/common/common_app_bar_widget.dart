import 'package:denwee/core/ui/theme/app_colors.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/buttons/back_button_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    super.key,
    this.onBack,
    this.title,
    this.action,
    this.backgroundColor,
    this.showBackButton = true,
  });

  final String? title;
  final VoidCallback? onBack;
  final Widget? action;
  final Color? backgroundColor;
  final bool showBackButton;

  static final _basicHeight = 72.h;

  static double widgetHeight(BuildContext context) {
    return context.topPadding + _basicHeight;
  }

  bool get hasTitle => title != null && title!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final topPadding = context.topPadding;

    return Container(
      height: widgetHeight(context),
      width: double.maxFinite,
      padding: EdgeInsets.only(top: topPadding),
      decoration: BoxDecoration(
        color: backgroundColor ?? context.theme.colorScheme.background,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (hasTitle)
            Center(
              child: BackdropSurfaceContainer.ellipse(
                blur: 0.0,
                color: context.isLightTheme ? context.lightPrimaryContainer : null,
                borderColor: context.isLightTheme ? Colors.black12 : AppColors.white08,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  child: Text(
                    title!,
                    style: h5.copyWith(color: context.textColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          if (action != null) _buildAction(),
          if (showBackButton) _buildBackButton(),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: AppBackButton(
        onTap: onBack,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
      ),
    );
  }

  Widget _buildAction() {
    return Align(
      alignment: Alignment.centerRight,
      child: action!,
    );
  }
}
