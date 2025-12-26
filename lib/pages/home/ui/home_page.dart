import 'package:denwee/core/ads/domain/repo/ads_repo.dart';
import 'package:denwee/core/ui/bloc/facts_cubit/daily_facts_cubit.dart';
import 'package:denwee/core/ui/bloc/facts_cubit/facts_archive_cubit.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/bloc/user_statistics_cubit/user_statistics_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/router/root_router.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/buttons/action_button_widget.dart';
import 'package:denwee/core/ui/widget/common/common_loading_widget.dart';
import 'package:denwee/core/ui/widget/common/common_no_results_found_widget.dart';
import 'package:denwee/core/ui/widget/common/common_scaffold_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/pages/home/ui/widget/page_view/daily_facts_story_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

DateTime? lastSystemHealthCheck;

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.checkUserData = true});

  final bool checkUserData;

  static const routeName = 'HomePage';
  static const routeNameFromOnboarding = 'HomePageFromOnboarding';
  static const routeNameFromAuthentication = 'HomePageFromAuthentication';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const checkUserStatusDelay = Duration(milliseconds: 1500);
  static const checkSystemHealthPeriod = Duration(minutes: 3);

  @override
  void initState() {
    super.initState();
    getIt<DailyFactsCubit>().checkBucket();
    getIt<AdsRepo>()
      ..loadFactExplanationAd(logError: false)
      ..loadAddToArchiveAd(logError: false);
    Future.delayed(checkUserStatusDelay, () {
      checkSystemHealth();
    });
  }

  void checkSystemHealth() {
    if (shouldCheckSystemHealth()) {
      if (!widget.checkUserData) getIt<ProfileCubit>().checkProfile();
      if (!widget.checkUserData) getIt<UserPreferencesCubit>().checkPreferences();
      if (!widget.checkUserData) getIt<FactsArchiveCubit>().checkArchiveIds();
      getIt<UserStatisticsCubit>().checkStatistics();
      lastSystemHealthCheck = DateTime.now();
    }
  }

  bool shouldCheckSystemHealth() {
    return lastSystemHealthCheck == null ||
        DateTime.now().difference(lastSystemHealthCheck!) >= checkSystemHealthPeriod;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyFactsCubit, DailyFactsState>(
      builder: (context, state) => CommonScaffold(
        systemNavigationBarContrastEnforced: false,
        systemOverlayType: _retrieveSystemOverlayType(state),
        style: _retrieveScaffoldStyle(state),
        body: AnimatedSwitcher(
          duration: CustomAnimationDurations.low,
          child: _buildBody(context, state),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, DailyFactsState state) {
    if (state.isFetching) {
      return const Center(key: ValueKey(0), child: CommonLoading());
    }

    if (state.isEmptyBucket) {
      return Stack(
        key: const ValueKey(1),
        children: [
          Center(
            child: CommonNoResultsFound(
              of: NoResultsFoundOf.dailyFacts,
              padding: EdgeInsets.only(top: context.topPadding),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: context.bottomPadding + 32.h,
            child: Center(
              child: AppActionButton(
                iconSize: 22,
                onTap: () => _goToAccount(context),
                iconPath: AppConstants.assets.icons.userLinear,
              ),
            ),
          ),
        ],
      );
    }

    if (state.bucket.isSome()) {
      return DailyFactsStoryView(
        key: const ValueKey(2),
        facts: state.bucket.toNullable()!.facts,
        goToAccount: () => _goToAccount(context),
      );
    }

    return const SizedBox.shrink(
      key: ValueKey(3),
    );
  }

  ThemeType? _retrieveSystemOverlayType(DailyFactsState state) {
    if (state.isFetching || state.isEmptyBucket) return null;
    return ThemeType.dark;
  }

  CommonBackgroundStyle _retrieveScaffoldStyle(DailyFactsState state) {
    if (state.isFetching || state.isEmptyBucket) return CommonBackgroundStyle.themeBased;
    return CommonBackgroundStyle.ofDarkTheme;
  }

  void _goToAccount(BuildContext context) {
    context.restorablePushReplacementNamedArgs(Routes.account);
  }
}
