import 'package:denwee/core/ui/theme/app_colors.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemOverlayRestyle extends StatelessWidget {
  const SystemOverlayRestyle({
    super.key,
    required this.child,
    this.customType,
    this.navigationBarColor,
    this.systemNavigationBarContrastEnforced,
  });

  final Widget child;
  final ThemeType? customType;
  final Color? navigationBarColor;
  final bool? systemNavigationBarContrastEnforced;

  static SystemUiOverlayStyle themeBased(
    BuildContext context, {
    Color? navigationBarColor,
    Color? backgroundColor,
    bool? systemNavigationBarContrastEnforced,
  }) {
    return context.theme.brightness == Brightness.light
        ? SystemOverlayRestyle.commonLightStyle(
          context,
          navigationBarColor: navigationBarColor,
          backgroundColor: backgroundColor,
          systemNavigationBarContrastEnforced: systemNavigationBarContrastEnforced,
        )
        : SystemOverlayRestyle.commonDarkStyle(
          context,
          navigationBarColor: navigationBarColor,
          backgroundColor: backgroundColor,
          systemNavigationBarContrastEnforced: systemNavigationBarContrastEnforced,
        );
  }

  static SystemUiOverlayStyle commonLightStyle(
    BuildContext context, {
    Color? navigationBarColor,
    Color? backgroundColor,
    bool? systemNavigationBarContrastEnforced,
  }) {
    return SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: navigationBarColor ?? (backgroundColor ?? context.theme.colorScheme.background),
      systemNavigationBarDividerColor: navigationBarColor ?? (backgroundColor ?? context.theme.colorScheme.background),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
      systemNavigationBarContrastEnforced: systemNavigationBarContrastEnforced,
    );
  }

  static SystemUiOverlayStyle commonDarkStyle(
    BuildContext context, {
    Color? navigationBarColor,
    Color? backgroundColor,
    bool? systemNavigationBarContrastEnforced,
  }) {
    return SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: navigationBarColor ?? (backgroundColor ?? context.theme.colorScheme.background),
      systemNavigationBarDividerColor: navigationBarColor ?? (backgroundColor ?? context.theme.colorScheme.background),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
      systemNavigationBarContrastEnforced: systemNavigationBarContrastEnforced,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (customType != null) {
      final backgroundColor = AppColors.primaryBackground[customType];

      return AnnotatedRegion(
        value:
            customType == ThemeType.light
                ? SystemOverlayRestyle.commonLightStyle(
                  context,
                  navigationBarColor: navigationBarColor,
                  backgroundColor: backgroundColor,
                  systemNavigationBarContrastEnforced: systemNavigationBarContrastEnforced,
                )
                : SystemOverlayRestyle.commonDarkStyle(
                  context,
                  navigationBarColor: navigationBarColor,
                  backgroundColor: backgroundColor,
                  systemNavigationBarContrastEnforced: systemNavigationBarContrastEnforced,
                ),
        child: child,
      );
    }
    return AnnotatedRegion(
      value: SystemOverlayRestyle.themeBased(
        context,
        navigationBarColor: navigationBarColor,
        systemNavigationBarContrastEnforced: systemNavigationBarContrastEnforced,
      ),
      child: child,
    );
  }
}
