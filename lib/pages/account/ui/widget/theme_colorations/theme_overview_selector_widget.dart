import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_colors.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ThemeModeX on ThemeMode {
  LinearGradient bubbleGradient(BuildContext context) {
    switch (this) {
      case ThemeMode.system:
        return LinearGradient(
          colors: [
            AppColors.primaryBackground[ThemeType.light]!,
            AppColors.primaryBackground[ThemeType.dark]!,
          ],
          stops: const [0.5, 0.5],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );

      case ThemeMode.light:
        return LinearGradient(
          colors: [
            AppColors.primaryBackground[ThemeType.light]!,
            AppColors.secondaryBackground[ThemeType.light]!,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        );

      case ThemeMode.dark:
        return LinearGradient(
          colors: [
            AppColors.primaryBackground[ThemeType.dark]!,
            AppColors.secondaryBackground[ThemeType.dark]!,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        );
    }
  }

  String displayName(BuildContext context) {
    switch (this) {
      case ThemeMode.system:
        return context.tr(LocaleKeys.account_section_theme_items_system);
      case ThemeMode.light:
        return context.tr(LocaleKeys.account_section_theme_items_light);
      case ThemeMode.dark:
        return context.tr(LocaleKeys.account_section_theme_items_dark);
    }
  }
}

class ThemeModeOverviewSelector extends StatelessWidget {
  const ThemeModeOverviewSelector({super.key});

  static final bubbleSize = 64.r;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ThemeMode.values
          .map((mode) => _buildModeBubble(
                context: context,
                mode: mode,
                currentThemeMode:
                    context.watch<UserPreferencesCubit>().state.preferences.theme.mode,
              ))
          .toList(),
    );
  }
}

Widget _buildModeBubble({
  required BuildContext context,
  required ThemeMode mode,
  required ThemeMode currentThemeMode,
}) {
  final isSelected = currentThemeMode == mode;

  buildBubble({
    required LinearGradient gradient,
    required Color borderColor,
  }) {
    return SizedBox.square(
      dimension: ThemeModeOverviewSelector.bubbleSize,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: 5.0),
          gradient: gradient,
        ),
      ),
    );
  }

  return RepaintBoundary(
    child: Column(
      children: [
        BounceTapAnimation(
          minScale: 1.06,
          onTap: () => context.read<UserPreferencesCubit>().changeThemeMode(mode),
          child: buildBubble(
            gradient: mode.bubbleGradient(context),
            borderColor: _getBorderColor(context, isSelected, mode),
          ),
        ),
        6.verticalSpace,
        Text(
          mode.displayName(context),
          style: bodyS.copyWith(color: context.textColorSecondary),
        ),
      ],
    ),
  );
}

Color _getBorderColor(
  BuildContext context,
  bool isSelected,
  ThemeMode forMode,
) {
  if (isSelected) return context.theme.colorScheme.secondary;
  if (context.isLightTheme) {
    return forMode == ThemeMode.dark
        ? Colors.grey.shade500
        : Colors.grey.shade600;
  }
  return Colors.grey.shade800;
}
