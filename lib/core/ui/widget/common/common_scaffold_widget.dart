import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_colors.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in_up.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/misc/system_overlay_restyle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum CommonBackgroundStyle {
  colored,
  coloredReversed,
  themeBased,
  solid,
  ofDarkTheme,
  ofLightTheme,
}

extension _CommonBackgroundStyleX on CommonBackgroundStyle {
  LinearGradient? gradient(BuildContext context) {
    switch (this) {
      case CommonBackgroundStyle.themeBased:
        return AppConstants.style.colors.commonBackgroundGradient(context);
      case CommonBackgroundStyle.colored:
        return AppConstants.style.colors.commonColoredGradient(context);
      case CommonBackgroundStyle.coloredReversed:
        return AppConstants.style.colors.commonColoredGradientReversed(context);
      case CommonBackgroundStyle.solid:
        return null;
      case CommonBackgroundStyle.ofDarkTheme:
        return AppConstants.style.colors.commonBackgroundGradient(
          context,
          color1: AppColors.primaryBackground[ThemeType.dark],
          color2: AppColors.secondaryBackground[ThemeType.dark],
        );
      case CommonBackgroundStyle.ofLightTheme:
        return AppConstants.style.colors.commonBackgroundGradient(
          context,
          color1: AppColors.primaryBackground[ThemeType.light],
          color2: AppColors.secondaryBackground[ThemeType.light],
        );
    }
  }

  Color? color(BuildContext context) {
    switch (this) {
      case CommonBackgroundStyle.themeBased:
      case CommonBackgroundStyle.colored:
      case CommonBackgroundStyle.coloredReversed:
      case CommonBackgroundStyle.ofDarkTheme:
      case CommonBackgroundStyle.ofLightTheme:
        return null;
      case CommonBackgroundStyle.solid:
        return context.theme.colorScheme.background;
    }
  }

  Color decorationIconColor(BuildContext context) {
    switch (this) {
      case CommonBackgroundStyle.themeBased:
      case CommonBackgroundStyle.solid:
        return context.isLightTheme ? AppColors.black02 : AppColors.white01;
      case CommonBackgroundStyle.colored:
      case CommonBackgroundStyle.coloredReversed:
        return AppColors.icon[ThemeType.light]!.withValues(alpha: 0.04);
      case CommonBackgroundStyle.ofDarkTheme:
        return AppColors.icon[ThemeType.dark]!.withValues(alpha: 0.04);
      case CommonBackgroundStyle.ofLightTheme:
        return AppColors.icon[ThemeType.light]!.withValues(alpha: 0.04);
    }
  }

  // system navigation bar
  Color? navigationBarColor(BuildContext context) {
    switch (this) {
      case CommonBackgroundStyle.themeBased:
        return context.theme.colorScheme.background;
      case CommonBackgroundStyle.colored:
        return context.theme.colorScheme.secondary;
      case CommonBackgroundStyle.coloredReversed:
        return context.theme.colorScheme.primary;
      case CommonBackgroundStyle.solid:
        return null;
      case CommonBackgroundStyle.ofDarkTheme:
        return AppColors.primaryBackground[ThemeType.dark];
      case CommonBackgroundStyle.ofLightTheme:
        return AppColors.primaryBackground[ThemeType.light];
    }
  }
}

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({
    super.key,
    required this.body,
    this.style = CommonBackgroundStyle.themeBased,
    this.iconPath,
    this.systemOverlayType,
    this.iconAppearDelay = CustomAnimationDurations.ultraLow,
    this.overlappedWidget,
    this.navigationBarColor,
    this.systemNavigationBarContrastEnforced = true,
  });

  final Widget body;
  final CommonBackgroundStyle style;
  final String? iconPath;
  final ThemeType? systemOverlayType;
  final Duration iconAppearDelay;
  final Widget? overlappedWidget;
  final Color? navigationBarColor;
  final bool systemNavigationBarContrastEnforced;

  @override
  Widget build(BuildContext context) {
    final gradient = style.gradient(context);
    final color = style.color(context);
    final decorationIconColor = style.decorationIconColor(context);

    return SystemOverlayRestyle(
      customType: systemOverlayType,
      navigationBarColor:
          navigationBarColor ?? style.navigationBarColor(context),
      systemNavigationBarContrastEnforced: systemNavigationBarContrastEnforced,
      child: _buildParentBody(
        context: context,
        gradient: gradient,
        color: color,
        decorationIconColor: decorationIconColor,
      ),
    );
  }

  Widget _buildParentBody({
    required BuildContext context,
    required LinearGradient? gradient,
    required Color? color,
    required Color decorationIconColor,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: gradient, color: color),
      child: Material(
        type: MaterialType.transparency,
        child: Stack(
          children: [
            _buildIcon(
              context: context,
              decorationIconColor: decorationIconColor,
            ),
            body,
            if (overlappedWidget != null) overlappedWidget!,
          ],
        ),
      ),
    );
  }

  Widget _buildIcon({
    required BuildContext context,
    required Color decorationIconColor,
  }) {
    final hasIcon = iconPath != null && iconPath!.isNotEmpty;

    return Positioned(
      right: -108.w,
      bottom: -28.h,
      child: AnimatedSwitcher(
        duration: CustomAnimationDurations.low,
        child: !hasIcon
            ? const SizedBox.shrink(key: ValueKey(false))
            : CommonAppIcon(
                key: ValueKey(iconPath!),
                path: iconPath!,
                color: decorationIconColor,
                size: 282.r,
              ).autoFadeInUp(delay: iconAppearDelay),
      ),
    );
  }
}
