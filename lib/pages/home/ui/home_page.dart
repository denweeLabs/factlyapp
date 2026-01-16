import 'package:denwee/core/ads/domain/repo/ads_repo.dart';
import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/ui/bloc/facts_cubit/daily_facts_cubit.dart';
import 'package:denwee/core/ui/bloc/facts_cubit/facts_archive_cubit.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:denwee/core/ui/bloc/subscriptions_cubit/user_subscription_cubit.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/bloc/user_statistics_cubit/user_statistics_cubit.dart';
import 'package:denwee/core/ui/router/root_router.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/common/common_scaffold_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/pages/home/ui/widget/stories_daily_facts_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      if (widget.checkUserData) getIt<ProfileCubit>().checkProfile();
      if (widget.checkUserData) getIt<UserPreferencesCubit>().checkPreferences();
      if (widget.checkUserData) getIt<FactsArchiveCubit>().checkArchiveIds();
      if (widget.checkUserData) getIt<UserSubscriptionCubit>().checkSubscription();
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
        systemOverlayType: ThemeType.dark,
        style: CommonBackgroundStyle.ofDarkTheme,
        systemNavigationBarContrastEnforced: false,
        body: StoriesDailyFactsBody(
          isLoading: state.isFetching,
          dailyFacts: state.bucket.toNullable()?.facts ?? const <DailyFact>[],
          failure: state.bucketFailure.toNullable(),
          onAccount: _goToAccount,
        ),
      ),
    );
  }

  void _goToAccount() {
    context.restorablePushReplacementNamedArgs(Routes.account);
  }
}
