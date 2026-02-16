import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/animations/shimmer_animation_widget.dart';
import 'package:denwee/presentation/widget/shared/animations/fade_loop_animation.dart';
import 'package:denwee/presentation/widget/shared/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:denwee/presentation/widget/shared/animations/bubbles_animation_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    this.displayWidget,
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
  final Widget? displayWidget;
  final bool isShimmering;
  final bool isBubbles;
  final bool hideShadow;
  final double? width;
  final EdgeInsets? padding;
  final bool ignoreTapScale;

  static final defaultHeight = 64.h;
  static const defaultBorderRadius = BorderRadius.all(Radius.circular(100));

  static const _clipper = ShapeBorderClipper(
    shape: RoundedSuperellipseBorder(
      borderRadius: BorderRadius.all(Radius.circular(48.0)),
    ),
  );

  static const _border = Border.fromBorderSide(
    BorderSide(color: Colors.white12),
  );

  void _onTap() {
    if (isBusy) return;
    onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    final color1 = backgroundColors?[0] ?? context.theme.colorScheme.primary;
    final color2 = backgroundColors?[1] ?? context.theme.colorScheme.secondary;
    final effectiveGradientColors = [color1, color2];

    final basicShadowColor = context.isLightTheme
        ? context.theme.shadowColor
        : context.theme.colorScheme.secondary;
    final effectiveShadowColor = shadowColor ?? basicShadowColor;
    final effectiveElavation = hideShadow ? 0.0 : 6.0;

    return BounceTapAnimation(
      onTap: _onTap,
      child: PhysicalShape(
        clipper: _clipper,
        clipBehavior: Clip.hardEdge,
        elevation: effectiveElavation,
        color: Colors.transparent,
        shadowColor: effectiveShadowColor,
        child: Stack(
          children: [
            AnimatedContainer(
              width: width,
              height: buttonHeight ?? defaultHeight,
              padding: padding,
              duration: CustomAnimationDurations.low,
              curve: Curves.fastEaseInToSlowEaseOut,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: effectiveGradientColors,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: defaultBorderRadius,
                border: _border,
              ),
              child: _buildDisplayElementsSwitcher(context),
            ),
            if (isBubbles || (isBusy || isShimmering))
              _buildBackgroundAnimations(context),
          ],
        ),
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

    if (displayWidget != null) {
      return SizedBox(
        key: const ValueKey('solid_btn_widget'),
        child: displayWidget!
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
    );
  }
}
