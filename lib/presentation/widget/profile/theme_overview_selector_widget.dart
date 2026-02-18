import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/theme/app_colors.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeModeOverviewSelector extends StatelessWidget {
  const ThemeModeOverviewSelector({super.key});

  static final _bubbleSize = 64.r;
  static const _bubbleBorderWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    final currentMode = context.select<UserPreferencesCubit, ThemeMode>(
      (cubit) => cubit.state.preferences.theme.mode,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ThemeBubble(
          mode: ThemeMode.system,
          currentMode: currentMode,
          label: context.tr(LocaleKeys.account_section_theme_items_system),
          gradient: LinearGradient(
            colors: [
              AppColors.primaryBackground[ThemeType.light]!,
              AppColors.primaryBackground[ThemeType.dark]!,
            ],
            stops: const [0.5, 0.5],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        _ThemeBubble(
          mode: ThemeMode.light,
          currentMode: currentMode,
          label: context.tr(LocaleKeys.account_section_theme_items_light),
          color: AppColors.primaryBackground[ThemeType.light]!,
        ),
        _ThemeBubble(
          mode: ThemeMode.dark,
          currentMode: currentMode,
          label: context.tr(LocaleKeys.account_section_theme_items_dark),
          color: AppColors.primaryBackground[ThemeType.dark]!,
        ),
      ],
    );
  }
}

class _ThemeBubble extends StatelessWidget {
  const _ThemeBubble({
    required this.mode,
    required this.currentMode,
    required this.label,
    this.color,
    this.gradient,
  });

  final ThemeMode mode;
  final ThemeMode currentMode;
  final String label;
  final Color? color;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final isSelected = currentMode == mode;

    final borderColor = _getBorderColor(context, isSelected, mode);

    return Column(
      children: [
        BounceTapAnimation(
          minScale: 1.06,
          onTap: () =>
              context.read<UserPreferencesCubit>().changeThemeMode(mode),
          child: SizedBox.square(
            dimension: ThemeModeOverviewSelector._bubbleSize,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                gradient: gradient,
                border: Border.all(
                  color: borderColor,
                  width: ThemeModeOverviewSelector._bubbleBorderWidth,
                ),
              ),
            ),
          ),
        ),
        6.verticalSpace,
        Text(
          label,
          style: bodyS.copyWith(
            color: context.textColorSecondary,
            fontFamily: AppConstants.style.textStyle.secondaryFontFamiliy,
          ),
        ),
      ],
    );
  }
}

Color _getBorderColor(BuildContext context, bool isSelected, ThemeMode mode) {
  if (isSelected) {
    return context.theme.colorScheme.secondary;
  }

  if (!context.isLightTheme) {
    return Colors.grey.shade800;
  }

  return mode == ThemeMode.dark ? Colors.grey.shade500 : Colors.grey.shade600;
}
