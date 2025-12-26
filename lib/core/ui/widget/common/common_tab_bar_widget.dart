import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/core_tap_bounce_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class CommonTab {
  final String text;
  final Widget? suffix;
  const CommonTab({required this.text, this.suffix});
}

class CommonTabBar extends StatelessWidget {
  const CommonTabBar({
    super.key,
    required this.tabs,
    required this.onTap,
    required this.tabController,
    this.suffixPredicate,
    this.forceLightColor = false,
    this.selectedTabColor,
  });

  final List<CommonTab> tabs;
  final void Function(int) onTap;
  final TabController tabController;
  final bool Function(int, bool)? suffixPredicate;
  final bool forceLightColor;
  final Color? selectedTabColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: tabController,
      builder: (context, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tabs
              .map((e) => _buildItem(context, e))
              .toList()
              .insertBetween(10.horizontalSpace),
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, CommonTab tab) {
    final index = tabs.indexOf(tab);
    final isSelected = index == tabController.index;
    final showSuffix =
        tab.suffix != null &&
        (suffixPredicate?.call(index, isSelected) ?? true);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        CoreTapBounceAnimation(
          onTap: () => onTap(index),
          minScale: 1.02,
          builder:
              (_, isHovered) => AnimatedScale(
                scale: isSelected ? 1.04 : 0.95,
                curve: Curves.fastEaseInToSlowEaseOut,
                duration: const Duration(milliseconds: 400),
                child: AnimatedContainer(
                  curve: Curves.fastEaseInToSlowEaseOut,
                  duration: const Duration(milliseconds: 600),
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.w,
                    vertical: 8.h,
                  ).copyWith(right: showSuffix ? 32.w : null),
                  decoration: BoxDecoration(
                    // color: isSelected ? context.theme.colorScheme.secondary : null,
                    color: isSelected ? selectedTabColor : null,
                    gradient:
                        isSelected
                            ? selectedTabColor != null
                                ? null
                                : AppConstants.style.colors
                                    .commonColoredGradientReversed(context)
                            : null,
                    borderRadius: BorderRadius.circular(24.r),
                    boxShadow: [
                      BoxShadow(
                        color: isSelected ? Colors.black38 : Colors.transparent,
                        spreadRadius: -8.0,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 8.0),
                      ).withTapResponse(isHovered),
                    ],
                  ),
                  child: AnimatedDefaultTextStyle(
                    curve: Curves.fastEaseInToSlowEaseOut,
                    duration: const Duration(milliseconds: 400),
                    style: h5.copyWith(
                      letterSpacing: 0.1,
                      color:
                          isSelected
                              ? context.lightTextColor
                              : forceLightColor
                              ? context.lightIconColorSecondary
                              : context.textColorSecondary,
                    ),
                    child: Text(tab.text),
                  ),
                ),
              ),
        ),
        Positioned(
          right: 0.0,
          bottom: 0.0,
          top: 0.0,
          child: AnimatedSwitcherPlus.zoomIn(
            switchInCurve: Interval(
              0.4,
              1.0,
              curve: CommonAnimationValues.fastEaseInToSlowEaseOutBack,
            ),
            switchOutCurve: Curves.fastEaseInToSlowEaseOut,
            duration: const Duration(milliseconds: 800),
            scaleOutFactor: 0.0,
            scaleInFactor: 0.5,
            reverseDuration: const Duration(milliseconds: 125),
            child: showSuffix ? tab.suffix : Container(),
          ),
        ),
      ],
    );
  }
}
