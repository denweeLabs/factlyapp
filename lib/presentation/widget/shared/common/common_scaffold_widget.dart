import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_colors.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in_up.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/system_overlay_restyle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum CommonBackgroundStyle {
  colored,
  coloredReversed,
  themeBased,
}

extension _CommonBackgroundStyleX on CommonBackgroundStyle {
  LinearGradient? gradient(BuildContext context) {
    switch (this) {
      case CommonBackgroundStyle.themeBased:
        return null;
      case CommonBackgroundStyle.colored:
        return AppConstants.style.colors.commonColoredGradient(context);
      case CommonBackgroundStyle.coloredReversed:
        return AppConstants.style.colors.commonColoredGradientReversed(context);
    }
  }

  Color? color(BuildContext context) {
    switch (this) {
      case CommonBackgroundStyle.themeBased:
        return context.theme.colorScheme.background;
      case CommonBackgroundStyle.colored:
      case CommonBackgroundStyle.coloredReversed:
        return null;
    }
  }

  Color decorationIconColor(BuildContext context) {
    switch (this) {
      case CommonBackgroundStyle.themeBased:
        return context.isLightTheme
            ? context.darkPrimaryContainer.withValues(alpha: 0.03)
            : context.darkPrimaryContainer.withValues(alpha: 0.3);
      case CommonBackgroundStyle.colored:
      case CommonBackgroundStyle.coloredReversed:
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
        return null;
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
    this.backgroundColor,
    this.systemNavigationBarContrastEnforced = true,
  });

  final Widget body;
  final CommonBackgroundStyle style;
  final String? iconPath;
  final ThemeType? systemOverlayType;
  final Duration iconAppearDelay;
  final Widget? overlappedWidget;
  final Color? navigationBarColor;
  final Color? backgroundColor;
  final bool systemNavigationBarContrastEnforced;

  @override
  Widget build(BuildContext context) {
    final gradient = style.gradient(context);
    final color = backgroundColor ?? style.color(context) ?? Colors.transparent;
    final decorationIconColor = style.decorationIconColor(context);

    final content = gradient == null
        ? _buildWithScaffold(
            context: context,
            color: color,
            decorationIconColor: decorationIconColor,
          )
        : _buildWithGradient(
            context: context,
            gradient: gradient,
            decorationIconColor: decorationIconColor,
          );

    return SystemOverlayRestyle(
      customType: systemOverlayType,
      navigationBarColor: navigationBarColor ?? style.navigationBarColor(context),
      systemNavigationBarContrastEnforced: systemNavigationBarContrastEnforced,
      child: content,
    );
  }

  Widget _buildWithScaffold({
    required BuildContext context,
    required Color color,
    required Color decorationIconColor,
  }) {
    return Scaffold(
      backgroundColor: color,
      body: Stack(
        children: [
          _buildIcon(
            context: context,
            decorationIconColor: decorationIconColor,
          ),
          RepaintBoundary(child: body),
          if (overlappedWidget != null) overlappedWidget!,
        ],
      ),
    );
  }

  Widget _buildWithGradient({
    required BuildContext context,
    required LinearGradient gradient,
    required Color decorationIconColor,
  }) {
    return Stack(
      fit: StackFit.expand,
      children: [
        RepaintBoundary(
          child: DecoratedBox(
            decoration: BoxDecoration(gradient: gradient),
          ),
        ),
        Material(
          type: MaterialType.transparency,
          child: Stack(
            children: [
              _buildIcon(
                context: context,
                decorationIconColor: decorationIconColor,
              ),
              RepaintBoundary(child: body),
              if (overlappedWidget != null) overlappedWidget!,
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIcon({
    required BuildContext context,
    required Color decorationIconColor,
  }) {
    if (iconPath == null || iconPath!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Positioned(
      right: -108.w,
      bottom: -28.h,
      child: RepaintBoundary(
        child: AnimatedSwitcher(
          duration: CustomAnimationDurations.low,
          child: KeyedSubtree(
            key: ValueKey(iconPath!),
            child: CommonAppIcon(
              path: iconPath!,
              color: decorationIconColor,
              size: 296.r,
            ).autoFadeInUp(delay: iconAppearDelay),
          ),
        ),
      ),
    );
  }
}