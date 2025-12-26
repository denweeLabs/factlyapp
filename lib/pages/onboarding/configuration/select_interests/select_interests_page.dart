import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in_up.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_out_up.dart';
import 'package:denwee/core/ui/widget/animations/common_animations/common_animations.dart';
import 'package:denwee/core/ui/widget/animations/constants/animation_bipos.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/misc/route_aware_animated.dart';
import 'package:denwee/core/ui/widget/animations/misc/route_observer_scope.dart';
import 'package:denwee/core/ui/widget/animations/transitions/hero_transition.dart';
import 'package:denwee/core/ui/widget/buttons/back_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/action_button_widget.dart';
import 'package:denwee/core/ui/widget/common/common_pop_scope_widget.dart';
import 'package:denwee/core/ui/widget/common/common_scaffold_widget.dart';
import 'package:denwee/core/ui/widget/misc/seal_in_circle_widget.dart';
import 'package:denwee/pages/onboarding/configuration/onboarding_configuration_page.dart';
import 'package:denwee/pages/onboarding/configuration/select_interests/cubit/select_interests_cubit.dart';
import 'package:denwee/pages/onboarding/configuration/select_interests/widget/components/interests_content_widget.dart';
import 'package:denwee/pages/onboarding/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroine/heroine.dart';
import 'package:utils/utils.dart';

class SelectInterestsPage extends StatelessWidget {
  const SelectInterestsPage({super.key, required this.isOnboarding});

  const SelectInterestsPage.onboarding({Key? key})
      : this(isOnboarding: true, key: key);

  static const routeName = 'SelectInterestsPage';

  final bool isOnboarding;

  @override
  Widget build(BuildContext context) {
    final topPadding =
        OnboardingConfigurationPage.contentTopPadding(context) + 32.h;

    if (isOnboarding) {
      final bottomPadding =
          OnboardingConfigurationPage.contentBottomPadding(context) + 12.h;

      return CommonScaffold(
        iconPath: AppConstants.assets.icons.messageQuestionLinear,
        body: RouteAwareAnimated(
          observer: RouteObserverScope.of(context),
          builder: (context, controller) => Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                  top: topPadding,
                  bottom: bottomPadding,
                ),
                child: InterestsContent(
                  titleWrapper: (child) => child
                      .autoFadeInUp(sequencePos: 1)
                      .routeAwareFadeOutUp(
                        controller: controller,
                        sequencePos: 0,
                        sequenceTotal: 3,
                      ),
                  subtitleWrapper: (child) => child
                      .autoFadeInUp(sequencePos: 2)
                      .routeAwareFadeOutUp(
                        controller: controller,
                        sequencePos: 1,
                        sequenceTotal: 3,
                      ),
                  tilesWrapper: (child) => child
                      .autoFadeInUp(sequencePos: 3)
                      .routeAwareFadeOutUp(
                        controller: controller,
                        sequencePos: 2,
                        sequenceTotal: 3,
                      ),
                ),
              ),
              Positioned(
                top: context.topPadding + 18.h,
                right: 16.w,
                child: RepaintBoundary(
                  child: HeroTransition(
                    tag: WelcomePage.sealInCircleHeroTag,
                    spring: const Motion.smoothSpring(
                      duration: CustomAnimationDurations.lowMedium,
                    ),
                    flightShuttleBuilder: const FlipShuttleBuilder(
                      curve: Curves.easeInToLinear,
                      flipForward: false,
                    ),
                    child: SealInCircle(
                      size: 28,
                      padding: EdgeInsets.all(12.w).copyWith(left: 14.w),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final buttonBottomPadding = context.bottomPadding * 0.8 + 34.h;
    final contentBottomPadding = buttonBottomPadding + AppActionButton.defaultSize + 32.h;

    return CommonPopScope(
      onWillPop: Navigator.of(context).pop,
      child: CommonScaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: topPadding,
                bottom: contentBottomPadding,
              ),
              child: InterestsContent(
                titleWrapper: (child) => child.autoFadeInUp(sequencePos: 1),
                subtitleWrapper: (child) => child.autoFadeInUp(sequencePos: 2),
                tilesWrapper: (child) => child.autoFadeInUp(sequencePos: 3),
              ),
            ),
            Positioned(
              left: 0.0,
              top: context.topPadding,
              child: const AppBackButton(),
            ),
            Positioned(
              right: 28.w,
              bottom: buttonBottomPadding,
              child: AppActionButton(
                iconSize: 32,
                onTap: () => _onConfirmInterests(context),
                iconPath: AppConstants.assets.icons.checkmarkLinear,
              ).fadeScale(
                fades: const BiPos(1.0, 1.0),
                scales: const BiPos(0.0, 1.0),
                delay: const Duration(milliseconds: 200),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onConfirmInterests(BuildContext context) {
    final cubit = context.read<SelectInterestsCubit>();
    final interests = cubit.state.selectedInterests;
    if (interests.isEmpty) {
      cubit.validateInterests();
      return HapticUtil.medium();
    }
    Navigator.of(context).pop(interests);
  }
}
