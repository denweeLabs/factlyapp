import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/constants/app/user_interests.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/common_animations/common_animations.dart';
import 'package:denwee/core/ui/widget/animations/constants/animated_switchers.dart';
import 'package:denwee/core/ui/widget/animations/constants/animation_bipos.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/misc/fading_edge_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:denwee/pages/onboarding/configuration/select_interests/cubit/select_interests_cubit.dart';
import 'package:denwee/pages/onboarding/configuration/select_interests/widget/interest_pick_tile_widget.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleWrapper(
          Text(
            context.tr(LocaleKeys.onboarding_select_interests_title),
            style: h0.copyWith(
              height: 1.4,
              letterSpacing: -0.6,
              color: context.textColor,
            ),
          ),
        ),
        18.verticalSpace,
        AnimatedSize(
          curve: CustomAnimationCurves.fasterEaseInToSlowEaseOut,
          duration: CustomAnimationDurations.lowMedium,
          child: subtitleWrapper(BlocBuilder<SelectInterestsCubit, SelectInterestsState>(
              builder: (context, state) {
                return AnimatedSwitcher(
                  transitionBuilder: AnimatedSwitchers.fadeBlurXTransition,
                  duration: CustomAnimationDurations.low,
                  switchInCurve: const Interval(0.2, 1.0, curve: Curves.fastEaseInToSlowEaseOut),
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
          child: tilesWrapper(FadingEdge(
              axis: Axis.vertical,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 24.h, bottom: 32.h),
                child: Wrap(
                  spacing: 10.w,
                  runSpacing: 18.h,
                  children: List.generate(
                    UserInterests.list.length,
                    (index) {
                      final interest = UserInterests.list[index];
                      return BlocSelector<SelectInterestsCubit,
                          SelectInterestsState, bool>(
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
          child: Row(
            children: [
              CommonAppIcon(
                path: AppConstants.assets.icons.alertLinear,
                color: context.theme.colorScheme.error,
                size: 18,
              ),
              10.horizontalSpace,
              Expanded(
                child: Text(
                  context.tr(LocaleKeys.validation_interests_empty),
                  style: bodyL.copyWith(
                    color: context.theme.colorScheme.error,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ).fadeSlide(
      fades: const BiPos(1.0, 1.0),
      offsets: const BiPos(Offset(-0.2, 0.0), Offset.zero),
      offsetCurve: const ElasticOutCurve(0.1),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Row(
      key: const ValueKey(true),
      children: [
        Expanded(
          child: Text(
            context.tr(LocaleKeys.onboarding_select_interests_subtitle),
            style: bodyL.copyWith(color: context.textColorTernary),
          ),
        ),
      ],
    );
  }
}
