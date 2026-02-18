import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/utils/haptic_util.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/elastic_in.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in_up.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_out_up.dart';
import 'package:denwee/presentation/widget/shared/animations/misc/route_aware_animated.dart';
import 'package:denwee/presentation/widget/shared/animations/misc/route_observer_scope.dart';
import 'package:denwee/presentation/widget/shared/buttons/back_button_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/action_button_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_pop_scope_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_scaffold_widget.dart';
import 'package:denwee/presentation/page/onboarding/configuration/onboarding_configuration_page.dart';
import 'package:denwee/presentation/bloc/onboarding/select_interests_cubit.dart';
import 'package:denwee/presentation/widget/onboarding/interests_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        body: RouteAwareAnimated(
          observer: RouteObserverScope.of(context),
          builder: (context, controller) => Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: topPadding,
                  bottom: bottomPadding,
                ),
                child: InterestsContent(
                  titleWrapper: (child) => child
                      .autoFadeInUp(sequencePos: 1)
                      .ecFadeOutUp(
                        controller: controller,
                        sequencePos: 0,
                        sequenceTotal: 3,
                      ),
                  subtitleWrapper: (child) => child
                      .autoFadeInUp(sequencePos: 2)
                      .ecFadeOutUp(
                        controller: controller,
                        sequencePos: 1,
                        sequenceTotal: 3,
                      ),
                  tilesWrapper: (child) => child
                      .autoFadeInUp(sequencePos: 3)
                      .ecFadeOutUp(
                        controller: controller,
                        sequencePos: 2,
                        sequenceTotal: 3,
                      ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final buttonBottomPadding = context.bottomPadding * 0.8 + 34.h;
    final contentBottomPadding = buttonBottomPadding + AppActionButton.defaultSize / 2;

    return CommonPopScope(
      onWillPop: Navigator.of(context).pop,
      child: CommonScaffold(
        iconPath: AppConstants.assets.icons.messageQuestionLinear,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
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
              ).autoElasticIn(sequencePos: 1),
            ),
          ],
        ),
      ),
    );
  }

  void _onConfirmInterests(BuildContext context) {
    final cubit = context.read<SelectInterestsCubit>();
    final interests = cubit.state.selectedInterests;
    if (!cubit.state.isValid) {
      cubit.validateInterests();
      return HapticUtil.medium();
    }
    Navigator.of(context).pop(interests);
  }
}
