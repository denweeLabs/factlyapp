import 'package:denwee/core/backgrounds/domain/entity/background_style.dart';
import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/facts/domain/entity/facts_failure.dart';
import 'package:denwee/presentation/widget/facts/stories_components/src/stories_daily_facts_view.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/buttons/action_button_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_no_results_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class StoriesDailyFactsBody extends StatelessWidget {
  const StoriesDailyFactsBody({
    super.key,
    required this.isLoading,
    required this.dailyFacts,
    required this.interests,
    required this.onAccount,
    required this.onBackgrounds,
    required this.failure,
    required this.backgroundStyle,
    required this.backgroundBrightness,
  });

  final bool isLoading;
  final FactsFailure? failure;
  final List<DailyFact> dailyFacts;
  final List<UserInterest> interests;
  final VoidCallback onAccount;
  final VoidCallback onBackgrounds;
  final BackgroundStyle? backgroundStyle;
  final Brightness backgroundBrightness;

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
    if (!isLoading && dailyFacts.isEmpty) {
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

    final firstFact = dailyFacts.firstOrNull;
    final effectiveFacts = isLoading
        ? [firstFact ?? DailyFact.dummy()]
        : dailyFacts;

    return StoriesDailyFactsView(
      key: const ValueKey(2),
      facts: effectiveFacts,
      interests: interests,
      isLoading: isLoading,
      goToAccount: onAccount,
      goToBackgrounds: onBackgrounds,
      backgroundStyle: backgroundStyle,
      backgroundBrightness: backgroundBrightness,
    );
  }
}
