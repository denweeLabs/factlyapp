import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/shimmer_animation_widget.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/core_tap_bounce_animation.dart';
import 'package:denwee/core/ui/widget/animations/fade_loop_animation.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/misc/bubbles_animation_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class AppSolidButton extends StatelessWidget {
  const AppSolidButton({
    super.key,
    required this.text,
    this.whenBusyText,
    this.buttonHeight,
    this.backgroundColors,
    this.textColor,
    this.shadowColor,
    this.onTap,
    this.isBusy = false,
    this.displayIcon,
    this.isShimmering = false,
    this.isBubbles = false,
    this.hideShadow = false,
    this.width = double.infinity,
    this.padding,
    this.ignoreTapScale = false,
  });

  final String text;
  final String? whenBusyText;
  final double? buttonHeight;
  final List<Color>? backgroundColors;
  final Color? textColor;
  final Color? shadowColor;
  final VoidCallback? onTap;
  final bool isBusy;
  final String? displayIcon;
  final bool isShimmering;
  final bool isBubbles;
  final bool hideShadow;
  final double? width;
  final EdgeInsets? padding;
  final bool ignoreTapScale;

  static final defaultHeight = 64.h;
  static const defaultBorderRadius = BorderRadius.all(Radius.circular(100));

  void _onTap() {
    if (isBusy) return;
    onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return CoreTapBounceAnimation(
      onTap: _onTap,
      ignoreScale: ignoreTapScale,
      builder: (context, isHovered) => Stack(
        children: [
          AnimatedContainer(
            width: width,
            height: buttonHeight ?? defaultHeight,
            curve: Curves.fastEaseInToSlowEaseOut,
            duration: CustomAnimationDurations.low,
            decoration: _getDecoration(
              context: context,
              isHovered: isHovered,
            ),
            padding: padding,
            child: _buildDisplayElementsSwitcher(context),
          ),
          if (isBubbles || (isBusy || isShimmering))
            _buildBackgroundAnimations(context),
        ],
      ),
    );
  }

  Widget _buildDisplayElementsSwitcher(BuildContext context) {
    return ClipRRect(
      child: AnimatedSwitcherPlus.translationTop(
        offset: 4.0,
        duration: CustomAnimationDurations.ultraLow,
        switchInCurve: Curves.easeInOutQuad,
        switchOutCurve: Curves.easeInOutQuad,
        child: _buildDisplayElements(context),
      ),
    );
  }

  Widget _buildDisplayElements(BuildContext context) {
    final thisTextColor = textColor ?? context.lightTextColor;

    if (displayIcon != null) {
      return CommonAppIcon(
        key: const ValueKey('solid_btn_icon'),
        path: displayIcon!,
        color: thisTextColor,
        size: 26,
      );
    }

    if (isBusy) {
      final text = whenBusyText ?? context.tr(LocaleKeys.loading_just_a_moment);
      return Material(
        type: MaterialType.transparency,
        key: const ValueKey('solid_btn_loading'),
        child: FadeLoopAnimation(
          child: Text(
            text.toUpperCase(),
            style: solidButton.copyWith(color: thisTextColor),
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            maxLines: 1,
          ),
        ),
      );
    }

    return Material(
      type: MaterialType.transparency,
      key: ValueKey('w_$text'),
      child: Text(
        text.toUpperCase(),
        style: solidButton.copyWith(color: thisTextColor),
        textAlign: TextAlign.center,
        overflow: TextOverflow.fade,
        maxLines: 1,
      ),
    );
  }

  Widget _buildBackgroundAnimations(BuildContext context) {
    return Positioned.fill(
      child: ClipRSuperellipse(
        borderRadius: defaultBorderRadius,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // bubbles
            if (isBubbles)
              const BubblesAnimation(
                bubblesCount: 8,
                opacity: 25,
              ),

            // busy fast shimmer
            if (isBusy)
              const ShimmerAnimation(
                duration: CustomAnimationDurations.mediumHigh,
                interval: Duration.zero,
              )

            // slow decorative shimmer
            else if (isShimmering)
              const ShimmerAnimation(),
          ],
        ),
      ),
    );
  }

  ShapeDecoration _getDecoration({
    required BuildContext context,
    required bool isHovered,
  }) {
    final color1 = backgroundColors?[0] ?? context.theme.colorScheme.primary;
    final color2 = backgroundColors?[1] ?? context.theme.colorScheme.secondary;

    final hoverColor1 = Color.lerp(color1, Colors.white, 0.2)!;
    final hoverColor2 = Color.lerp(color2, Colors.white, 0.2)!;

    final thisGradientColors = [
      isHovered ? hoverColor1 : color1,
      isHovered ? hoverColor2 : color2,
    ];

    final thisShadowColor = shadowColor ?? (context.isLightTheme
        ? context.theme.shadowColor
        : context.theme.colorScheme.secondary);

    return ShapeDecoration(
      shape: const RoundedSuperellipseBorder(
        borderRadius: defaultBorderRadius,
        side: BorderSide(color: Colors.white12),
      ),
      gradient: LinearGradient(
        colors: thisGradientColors,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      shadows: hideShadow
          ? null
          : [
              BoxShadow(
                color: thisShadowColor,
                blurRadius: 18.0,
                spreadRadius: -14.0,
                offset: const Offset(0.0, 12.0),
              ).withTapResponse(isHovered),
            ],
    );
  }
}
