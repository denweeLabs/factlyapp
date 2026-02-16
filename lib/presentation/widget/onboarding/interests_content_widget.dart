import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/constants/app/user_interests.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in_right.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/animated_switchers.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/bloc/onboarding/select_interests_cubit.dart';
import 'package:denwee/presentation/widget/onboarding/interest_pick_tile_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/solid_fading_edge_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterestsContent extends StatelessWidget {
  const InterestsContent({
    super.key,
    required this.titleWrapper,
    required this.subtitleWrapper,
    required this.tilesWrapper,
  });

  final Widget Function(Widget) titleWrapper;
  final Widget Function(Widget) subtitleWrapper;
  final Widget Function(Widget) tilesWrapper;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        titleWrapper(
          Text(
            context.tr(LocaleKeys.onboarding_select_interests_title),
            style: h0.copyWith(
              height: 1.4,
              letterSpacing: -0.6,
              color: context.textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        20.verticalSpace,
        AnimatedSize(
          curve: CustomAnimationCurves.fasterEaseInToSlowEaseOut,
          duration: CustomAnimationDurations.lowMedium,
          child: subtitleWrapper(
            BlocBuilder<SelectInterestsCubit, SelectInterestsState>(
              builder: (context, state) {
                return AnimatedSwitcher(
                  transitionBuilder: AnimatedSwitchers.fadeBlurXTransition,
                  duration: CustomAnimationDurations.low,
                  switchInCurve: const Interval(
                    0.2,
                    1.0,
                    curve: Curves.fastEaseInToSlowEaseOut,
                  ),
                  switchOutCurve: const Interval(0.5, 1.0, curve: Curves.ease),
                  child: state.isValidationError
                      ? _buildValidationError(context)
                      : _buildSubtitle(context),
                );
              },
            ),
          ),
        ),
        24.verticalSpace,
        Expanded(
          child: tilesWrapper(
            SolidVerticalFadingEdge(
              backgroundColor: context.theme.colorScheme.background,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 24.h,
                ).copyWith(bottom: 48.h),
                itemCount: UserInterests.list.length,
                separatorBuilder: (_, __) => 12.verticalSpace,
                itemBuilder: (context, index) {
                  final interest = UserInterests.list[index];
                  return BlocSelector<
                    SelectInterestsCubit,
                    SelectInterestsState,
                    bool
                  >(
                    selector: (state) =>
                        state.selectedInterests.contains(interest),
                    builder: (context, isSelected) => InterestPickTile(
                      index: index,
                      interest: interest,
                      isSelected: isSelected,
                      onTap: context
                          .read<SelectInterestsCubit>()
                          .selectInterest,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildValidationError(BuildContext context) {
    return Row(
      key: const ValueKey(false),
      children: [
        Expanded(
          child: Text(
            context.tr(
              LocaleKeys.validation_interests_not_enough,
              args: [AppConstants.config.interestsMinCount.toString()],
            ),
            style: bodyL.copyWith(
              color: context.theme.colorScheme.error,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ).autoFadeInRight(slideCurve: const ElasticOutCurve(0.1));
  }

  Widget _buildSubtitle(BuildContext context) {
    return Row(
      key: const ValueKey(true),
      children: [
        Expanded(
          child: Text(
            context.tr(LocaleKeys.onboarding_select_interests_subtitle),
            style: bodyL.copyWith(color: context.textColorTernary),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
