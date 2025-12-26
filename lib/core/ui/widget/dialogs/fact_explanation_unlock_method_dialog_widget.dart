import 'dart:math';

import 'package:denwee/core/ui/bloc/user_statistics_cubit/user_statistics_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/elastic_in.dart';
import 'package:denwee/core/ui/widget/animations/animated_icons/smiling_star_animated_icon_widget.dart';
import 'package:denwee/core/ui/widget/animations/animated_icons/heart_hands_animated_icon_widget.dart';
import 'package:denwee/core/ui/widget/animations/common_animations/common_animations.dart';
import 'package:denwee/core/ui/widget/animations/constants/animation_bipos.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/shimmer_animation_widget.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_fade_animation.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/common/common_dismiss_ontap_widget.dart';
import 'package:denwee/core/ui/widget/common/common_pop_scope_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/core/ui/widget/misc/bubbles_animation_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:utils/utils.dart';

enum FactExplanationUnlockMethod { ad, star }

extension _MethodX on FactExplanationUnlockMethod {
  String title(BuildContext context) {
    switch (this) {
      case FactExplanationUnlockMethod.ad:
        return context.tr(LocaleKeys.fact_unlock_method_ad_title);
      case FactExplanationUnlockMethod.star:
        return context.tr(LocaleKeys.fact_unlock_method_star_title);
    }
  }

  String subtitle(BuildContext context) {
    switch (this) {
      case FactExplanationUnlockMethod.ad:
        return context.tr(LocaleKeys.fact_unlock_method_ad_subtitle);
      case FactExplanationUnlockMethod.star:
        return context.tr(LocaleKeys.fact_unlock_method_star_subtitle);
    }
  }
}

class FactExplanationUnlockMethodDialog extends StatelessWidget {
  const FactExplanationUnlockMethodDialog({super.key});

  static const routeName = 'FactExplanationUnlockMethodDialog';

  @override
  Widget build(BuildContext context) {
    return CommonPopScope(
      onWillPop: Navigator.of(context).pop,
      child: Material(
        type: MaterialType.transparency,
        child: CommonDismissOnTap(
          dismiss: Navigator.of(context).pop,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      12.verticalSpace,
                      _buildMethod(
                        context: context,
                        method: FactExplanationUnlockMethod.star,
                        onTap: () => Navigator.of(context).pop(true),
                        icon: CustomAnimationBuilder<double>(
                          control: Control.loop,
                          duration: const Duration(milliseconds: 6000),
                          curve: const Interval(0.0, 0.25, curve: Curves.easeInOutQuart),
                          tween: Tween(begin: -pi * 2, end: 0.0),
                          builder: (context, value, child) => Transform.rotate(
                            angle: value,
                            child: child,
                          ),
                          child: SmilingStarAnimatedIcon(
                            animate: true,
                            size: 20,
                          ),
                        ),
                      ).autoElasticIn(
                        scaleFrom: 0.8,
                        scaleCurve: CustomAnimationCurves.lowElasticOut,
                        delay: const Duration(milliseconds: 300),
                      ),
                      20.verticalSpace,
                      _buildMethod(
                        context: context,
                        method: FactExplanationUnlockMethod.ad,
                        onTap: () => Navigator.of(context).pop(false),
                        icon: HeartHandsAnimatedIcon(
                          size: 26,
                          animate: false,
                          onInit: (controller) => Future.delayed(
                            const Duration(milliseconds: 200),
                            () => controller
                              ..value = 0
                              ..animateTo(0.5)
                              ..loop(),
                          ),
                        ),
                      ).autoElasticIn(
                        scaleFrom: 0.6,
                        scaleCurve: CustomAnimationCurves.lowElasticOut,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: context.bottomPadding + 32.h,
                  child: Center(
                    child:
                        BackdropSurfaceContainer.circle(
                          onTap: Navigator.of(context).pop,
                          hoverColor: context.theme.colorScheme.primary,
                          borderColor: Colors.white12,
                          child: Padding(
                            padding: EdgeInsets.all(16.w),
                            child: CommonAppIcon(
                              path: AppConstants.assets.icons.crossLinear,
                              color: context.lightIconColor,
                              size: 22,
                            ),
                          ),
                        ).fadeScaleRotation(
                          fades: const BiPos(0.0, 1.0),
                          scales: const BiPos(0.0, 1.0),
                          rotations: const BiPos(1.0, 0.0),
                          delay: const Duration(milliseconds: 100),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMethod({
    required BuildContext context,
    required FactExplanationUnlockMethod method,
    required Widget icon,
    required VoidCallback onTap,
  }) {
    final isStar = method == FactExplanationUnlockMethod.star;

    return BounceTapFadeAnimation(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: ShapeDecoration(
              shape: RoundedSuperellipseBorder(
                borderRadius: BorderRadius.all(Radius.circular(28.r)),
                side: const BorderSide(color: Colors.white10),
              ),
              shadows: [AppConstants.style.colors.commonShadow],
              gradient: !isStar ? null : AppConstants.style.colors.commonColoredGradient(context),
              color: isStar ? null : context.darkPrimaryContainer,
            ),
            padding: EdgeInsets.all(12.w).copyWith(bottom: 24.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 54.w,
                      height: 54.w,
                      decoration: ShapeDecoration(
                        shape: RoundedSuperellipseBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        ),
                        color: isStar
                            ? context.darkPrimaryContainer
                            : Colors.grey.shade700.withValues(alpha: 0.1),
                      ),
                      child: Center(child: icon),
                    ),
                    12.horizontalSpace,
                    Text(
                      method.title(context),
                      style: h5.copyWith(
                        color: context.lightTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                14.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    method.subtitle(context),
                    style: bodyM.copyWith(
                      color: isStar
                          ? context.lightTextColor
                          : context.lightTextColorSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          if (isStar)
            const Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(28)),
                child: ShimmerAnimation(),
              ),
            ),
          if (isStar)
            const Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(28)),
                child: BubblesAnimation(),
              ),
            ),
          if (isStar)
            Positioned(
              top: -10.h,
              right: 20.w,
              child: Container(
                decoration: BoxDecoration(
                  color: context.lightPrimaryContainer,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  boxShadow: [AppConstants.style.colors.commonShadow],
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                child: Center(
                  child: BlocBuilder<UserStatisticsCubit, UserStatisticsState>(
                    builder: (context, state) => Text(
                      '${context.tr(LocaleKeys.account_statistics_stars_title)}: ${state.statistics.stars}',
                      style: bodyS.copyWith(
                        color: context.theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
