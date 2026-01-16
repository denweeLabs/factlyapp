import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/facts/domain/failure/facts_failure.dart';
import 'package:denwee/core/facts/ui/stories_components/src/stories_daily_facts_view.dart';
import 'package:denwee/core/facts/ui/stories_components/src/widgets/stories_view_skeleton_loading_widget.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/buttons/action_button_widget.dart';
import 'package:denwee/core/ui/widget/common/common_no_results_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class StoriesDailyFactsBody extends StatelessWidget {
  const StoriesDailyFactsBody({
    super.key,
    required this.isLoading,
    required this.dailyFacts,
    required this.onAccount,
    required this.failure,
  });

  final bool isLoading;
  final FactsFailure? failure;
  final List<DailyFact> dailyFacts;
  final VoidCallback onAccount;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.ease,
      switchOutCurve: Curves.ease,
      duration: CustomAnimationDurations.ultraLow,
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (isLoading) {
      return StoriesViewSkeletonLoading(
        onAccount: onAccount,
        key: const ValueKey(0),
      );
    }

    if (dailyFacts.isEmpty) {
      return Stack(
        key: const ValueKey(1),
        children: [
          Center(
            child: CommonNoResultsFound(
              of: NoResultsFoundOf.dailyFacts,
              padding: EdgeInsets.only(top: context.topPadding),
              titleColor: context.lightTextColor,
              subtitleColor: context.lightTextColorSecondary,
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: context.bottomPadding + 32.h,
            child: Center(
              child: AppActionButton(
                iconSize: 22,
                onTap: onAccount,
                iconPath: AppConstants.assets.icons.userLinear,
              ),
            ),
          ),
        ],
      );
    }

    return StoriesDailyFactsView(
      facts: dailyFacts,
      goToAccount: onAccount,
      key: const ValueKey(2),
    );
  }
}
