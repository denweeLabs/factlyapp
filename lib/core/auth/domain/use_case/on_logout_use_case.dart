import 'package:denwee/core/auth/domain/repo/access_token_repo.dart';
import 'package:denwee/core/auth/domain/repo/user_identity_repo.dart';
import 'package:denwee/core/facts/domain/repo/daily_facts_repo.dart';
import 'package:denwee/core/facts/domain/repo/fact_explanations_repo.dart';
import 'package:denwee/core/facts/domain/repo/facts_archive_repo.dart';
import 'package:denwee/core/misc/data/storage/common_storage.dart';
import 'package:denwee/core/notifications/domain/repo/push_notifications_repo.dart';
import 'package:denwee/core/profile/domain/repo/profile_repo.dart';
import 'package:denwee/core/statistics/domain/repo/statistics_repo.dart';
import 'package:denwee/core/subscriptions/domain/repo/subscriptions_repo.dart';
import 'package:denwee/core/ui/bloc/facts_cubit/daily_facts_cubit.dart';
import 'package:denwee/core/ui/bloc/facts_cubit/facts_archive_cubit.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:denwee/core/ui/bloc/subscriptions_cubit/user_subscription_cubit.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/bloc/user_statistics_cubit/user_statistics_cubit.dart';
import 'package:denwee/core/user_preferences/domain/repo/user_preferences_repo.dart';
import 'package:denwee/pages/home/ui/home_page.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class OnLogoutUseCase {
  // data
  final CommonStorage _commonStorage;
  final DailyFactsRepo _dailyFactsRepo;
  final FactsArchiveRepo _factsArchiveRepo;
  final ProfileRepo _profileRepo;
  final UserPreferencesRepo _preferencesRepo;
  final StatisticsRepo _statisticsRepo;
  final FactExplanationsRepo _factExplanationsRepo;
  final PushNotificationsRepo _pushNotificationsRepo;
  final AccessTokenRepo _accessTokenRepo;
  final SubscriptionsRepo _subscriptionsRepo;
  final UserIdentityRepo _userIdentityRepo;

  // state
  final ProfileCubit _profileCubit;
  final UserPreferencesCubit _preferencesCubit;
  final UserStatisticsCubit _userStatisticsCubit;
  final UserSubscriptionCubit _userSubscriptionCubit;
  final FactsArchiveCubit _factsArchiveCubit;
  final DailyFactsCubit _dailyFactsCubit;

  OnLogoutUseCase(
    this._commonStorage,
    this._dailyFactsRepo,
    this._factsArchiveRepo,
    this._profileRepo,
    this._preferencesRepo,
    this._statisticsRepo,
    this._factExplanationsRepo,
    this._pushNotificationsRepo,
    this._accessTokenRepo,
    this._subscriptionsRepo,
    this._userIdentityRepo,
    this._profileCubit,
    this._preferencesCubit,
    this._userStatisticsCubit,
    this._userSubscriptionCubit,
    this._factsArchiveCubit,
    this._dailyFactsCubit,
  );

  void execute() async {
    // wipe data
    _commonStorage.setIsOnboardingState(true);
    _dailyFactsRepo.deleteBucketLocal();
    _factsArchiveRepo.deleteArchiveLocal();
    _profileRepo.deleteProfileLocal();
    _preferencesRepo.deletePrefrencesLocal();
    _statisticsRepo.deleteStatisticsLocal();
    _factExplanationsRepo.deleteFactExplanationsLocal();
    _subscriptionsRepo.deleteSubscriptionLocal();
    _subscriptionsRepo.logout();
    _accessTokenRepo.clearSession();
    _pushNotificationsRepo.unsubscribe();
    _userIdentityRepo.clear();

    // wipe state
    _profileCubit.clearState();
    _factsArchiveCubit.clearState();
    _dailyFactsCubit.clearState();
    _userStatisticsCubit.clearState();
    _userSubscriptionCubit.clearState();
    _preferencesCubit.clearState(
      preserveTheme: true,
      preserveLanguage: true,
    );

    lastSystemHealthCheck = null;
  }
}
