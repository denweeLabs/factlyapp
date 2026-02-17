import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/buttons/back_button_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/surface_container_widget.dart';
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
    final effectiveBackgroundColor =
        backgroundColor ?? context.theme.colorScheme.background;

    return SizedBox.fromSize(
      size: Size.fromHeight(widgetHeight(context)),
      child: ColoredBox(
        color: effectiveBackgroundColor,
        child: Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              if (hasTitle)
                Center(
                  child: SurfaceContainer.ellipse(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 8.h,
                      ),
                      child: Text(
                        title!,
                        style: h5.copyWith(
                          color: context.textColor,
                          fontFamily:
                              AppConstants.style.textStyle.secondaryFontFamiliy,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              if (action != null) _buildAction(),
              if (showBackButton) _buildBackButton(),
            ],
          ),
        ),
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
    return Align(alignment: Alignment.centerRight, child: action!);
  }
}
