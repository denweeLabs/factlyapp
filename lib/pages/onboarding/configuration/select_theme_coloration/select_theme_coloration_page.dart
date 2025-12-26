import 'dart:math';

import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in_up.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/scroll_physics/less_responsive_scroll_physics.dart';
import 'package:denwee/core/ui/widget/common/common_scaffold_widget.dart';
import 'package:denwee/core/ui/widget/misc/coloration_item_bubble_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:denwee/pages/onboarding/configuration/onboarding_configuration_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SelectThemeColorationPage extends StatefulWidget {
  const SelectThemeColorationPage({super.key});

  static const routeName = 'SelectThemeColorationPage';

  @override
  State<SelectThemeColorationPage> createState() =>
      _SelectThemeColorationPageState();
}

class _SelectThemeColorationPageState extends State<SelectThemeColorationPage> {
  static const viewportFraction = 0.41;
  static final bubbleSize = 0.24.sw;

  late final PageController pageController;

  var bubblesInitiallyAnimated = false;

  @override
  void initState() {
    final currentColorationId = context
        .read<UserPreferencesCubit>()
        .state
        .preferences
        .theme
        .colorationId;
    final pageIndex = AppConstants.config.themeColorations.indexWhere(
      (e) => e.id == currentColorationId,
    );
    pageController = PageController(
      viewportFraction: viewportFraction,
      initialPage: pageIndex,
    );
    Future.delayed(CustomAnimationDurations.low, () {
      bubblesInitiallyAnimated = true;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      systemOverlayType: ThemeType.dark,
      style: CommonBackgroundStyle.colored,
      iconPath: AppConstants.assets.icons.brushLinear,
      systemNavigationBarContrastEnforced: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: OnboardingConfigurationPage.contentTopPadding(context),
          ),
          32.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              context.tr(LocaleKeys.onboarding_select_theme_colorations_title),
              style: h0.copyWith(
                height: 1.4,
                letterSpacing: -0.6,
                color: context.lightTextColor,
              ),
            ).autoFadeInUp(sequencePos: 1),
          ),
          12.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              context.tr(LocaleKeys.onboarding_select_theme_colorations_subtitle),
              style: bodyL.copyWith(
                color: context.lightTextColorSecondary,
                height: 1.6,
              ),
            ),
          ).autoFadeInUp(sequencePos: 2),
          24.verticalSpace,
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: AppConstants.config.themeColorations.length,
              physics: const LessResponsiveScrollPhysics(),
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                final coloration = AppConstants.config.themeColorations[index];
                return BlocSelector<UserPreferencesCubit, UserPreferencesState, bool>(
                  selector: (state) => state.preferences.theme.colorationId == coloration.id,
                  builder: (context, isSelected) => ColorationItemBubble(
                    size: bubbleSize,
                    index: index,
                    coloration: coloration,
                    isSelected: isSelected,
                    onTap: (_) => _animateTo(index),
                  ).autoFadeInUp(
                    slideCurve: CustomAnimationCurves.mediumElasticOut,
                    delay: _getBubbleAppearDelay(index),
                    fadeCurve: Curves.fastEaseInToSlowEaseOut,
                  ),
                );
              },
            ),
          ),
          Center(
            child: SmoothPageIndicator(
              controller: pageController,
              count: AppConstants.config.themeColorations.length,
              effect: ScrollingDotsEffect(
                spacing: 10.0,
                radius: 32.0,
                smallDotScale: 0.0,
                dotWidth: 10.0,
                dotHeight: 10.0,
                fixedCenter: true,
                activeStrokeWidth: 0.0,
                activeDotScale: 0.0,
                paintStyle: PaintingStyle.fill,
                dotColor: context.lightIconColorTernanry,
                activeDotColor: context.lightIconColor,
              ),
            ).autoFadeIn(sequencePos: 4),
          ),
          42.verticalSpace,
          SizedBox(
            height: OnboardingConfigurationPage.contentBottomPadding(context),
          ),
        ],
      ),
    );
  }

  void _animateTo(int index) {
    pageController.animateToPage(
      index,
      duration: CustomAnimationDurations.low,
      curve: CustomAnimationCurves.fasterEaseInToSlowEaseOut,
    );
  }

  Duration _getBubbleAppearDelay(int index) {
    if (bubblesInitiallyAnimated) return Duration.zero;
    final ofIndexDelay = min(0, (index - pageController.initialPage - 1));
    final computed = Duration(milliseconds: 250 * ofIndexDelay);
    return CustomAnimationDurations.medium + computed;
  }

  void _onPageChanged(int index) {
    HapticUtil.light();
    getIt<UserPreferencesCubit>().changeThemeColoration(
      AppConstants.config.themeColorations[index].id,
    );
  }
}
