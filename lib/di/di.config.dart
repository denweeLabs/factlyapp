// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appinio_social_share/appinio_social_share.dart' as _i981;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:device_info_plus/device_info_plus.dart' as _i833;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_analytics/firebase_analytics.dart' as _i398;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:package_info_plus/package_info_plus.dart' as _i655;
import 'package:share_plus/share_plus.dart' as _i998;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../core/ads/data/repo/ads_repo_impl.dart' as _i479;
import '../core/ads/domain/repo/ads_repo.dart' as _i522;
import '../core/ads/domain/use_case/show_add_to_archive_ad_use_case.dart'
    as _i343;
import '../core/ads/domain/use_case/show_fact_explanation_ad_use_case.dart'
    as _i799;
import '../core/analytics/data/repo/analytics_repo_impl.dart' as _i3;
import '../core/analytics/domain/repo/analytics_repo.dart' as _i561;
import '../core/auth/data/repo/access_token_repo_impl.dart' as _i900;
import '../core/auth/data/repo/auth_repo_impl.dart' as _i883;
import '../core/auth/data/source/remote/auth_api.dart' as _i223;
import '../core/auth/data/source/remote/auth_remote_source_impl.dart' as _i898;
import '../core/auth/domain/providers/apple/apple_sign_in_provider.dart'
    as _i480;
import '../core/auth/domain/providers/google/google_sign_in_provider.dart'
    as _i202;
import '../core/auth/domain/repo/access_token_repo.dart' as _i785;
import '../core/auth/domain/repo/auth_repo.dart' as _i323;
import '../core/auth/domain/source/auth_remote_source.dart' as _i460;
import '../core/auth/domain/use_case/login_anonymously_use_case.dart' as _i684;
import '../core/auth/domain/use_case/login_use_case.dart' as _i104;
import '../core/auth/domain/use_case/on_logout_use_case.dart' as _i697;
import '../core/auth/domain/use_case/register_use_case.dart' as _i541;
import '../core/backgrounds/data/repo/backgrounds_repo_impl.dart' as _i459;
import '../core/backgrounds/data/source/local/backgrounds_local_source_impl.dart'
    as _i785;
import '../core/backgrounds/data/source/remote/backgrounds_api.dart' as _i38;
import '../core/backgrounds/data/source/remote/backgrounds_remote_source_impl.dart'
    as _i976;
import '../core/backgrounds/domain/entity/background_style.dart' as _i41;
import '../core/backgrounds/domain/repo/backgrounds_repo.dart' as _i91;
import '../core/backgrounds/domain/source/backgrounds_local_source.dart'
    as _i159;
import '../core/backgrounds/domain/source/backgrounds_remote_source.dart'
    as _i412;
import '../core/backgrounds/domain/use_case/apply_custom_background_use_case.dart'
    as _i567;
import '../core/backgrounds/domain/use_case/apply_default_background_use_case.dart'
    as _i648;
import '../core/backgrounds/domain/use_case/get_available_backgrounds_use_case.dart'
    as _i1037;
import '../core/backgrounds/domain/use_case/on_background_applied_use_case.dart'
    as _i849;
import '../core/backgrounds/domain/utils/background_asset_cache_util.dart'
    as _i1044;
import '../core/facts/data/repo/daily_facts_repo_impl.dart' as _i489;
import '../core/facts/data/repo/fact_explanations_repo_impl.dart' as _i946;
import '../core/facts/data/repo/facts_archive_repo_impl.dart' as _i299;
import '../core/facts/data/source/local/facts_local_source_impl.dart' as _i721;
import '../core/facts/data/source/remote/facts_api.dart' as _i16;
import '../core/facts/data/source/remote/facts_remote_source_impl.dart'
    as _i334;
import '../core/facts/domain/entity/daily_fact.dart' as _i431;
import '../core/facts/domain/entity/user_interest.dart' as _i1032;
import '../core/facts/domain/repo/daily_facts_repo.dart' as _i634;
import '../core/facts/domain/repo/fact_explanations_repo.dart' as _i829;
import '../core/facts/domain/repo/facts_archive_repo.dart' as _i451;
import '../core/facts/domain/source/facts_local_source.dart' as _i890;
import '../core/facts/domain/source/facts_remote_source.dart' as _i479;
import '../core/facts/domain/use_case/ad_fact_explanation_use_case.dart'
    as _i954;
import '../core/facts/domain/use_case/check_fact_explanation_use_case.dart'
    as _i583;
import '../core/facts/domain/use_case/fact_explanation_util_use_case.dart'
    as _i974;
import '../core/facts/domain/use_case/get_daily_facts_bucket_use_case.dart'
    as _i974;
import '../core/facts/domain/use_case/handle_facts_archive_use_case.dart'
    as _i665;
import '../core/facts/domain/use_case/star_fact_explanation_use_case.dart'
    as _i1043;
import '../core/facts/domain/util/share/compositor/fact_share_compositor.dart'
    as _i1034;
import '../core/facts/domain/util/share/fact_capture_util.dart' as _i335;
import '../core/facts/domain/util/share/fact_share_util.dart' as _i757;
import '../core/facts/domain/util/share/fact_shares_storage.dart' as _i147;
import '../core/misc/data/repo/device_info_repo_impl.dart' as _i924;
import '../core/misc/data/storage/common_storage.dart' as _i816;
import '../core/misc/data/storage/local_secure_storage.dart' as _i890;
import '../core/misc/data/storage/local_storage.dart' as _i663;
import '../core/misc/domain/entity/device_info.dart' as _i659;
import '../core/misc/domain/repo/device_info_repo.dart' as _i784;
import '../core/misc/domain/service/debug_print_service.dart' as _i57;
import '../core/misc/domain/service/share_service.dart' as _i655;
import '../core/misc/domain/use_case/initial_route_use_case.dart' as _i324;
import '../core/network/data/repo/connectivity_repo_impl.dart' as _i946;
import '../core/network/domain/repo/connectivity_repo.dart' as _i605;
import '../core/network/domain/repo/request_executor.dart' as _i663;
import '../core/notifications/data/repo/push_notifications_repo_impl.dart'
    as _i998;
import '../core/notifications/data/source/remote/push_notifications_api.dart'
    as _i469;
import '../core/notifications/data/source/remote/push_notifications_remote_source_impl.dart'
    as _i145;
import '../core/notifications/domain/repo/push_notifications_repo.dart'
    as _i293;
import '../core/notifications/domain/source/push_notifications_remote_source.dart'
    as _i1009;
import '../core/profile/data/repo/profile_repo_impl.dart' as _i846;
import '../core/profile/data/source/local/profile_local_source_impl.dart'
    as _i877;
import '../core/profile/data/source/remote/profile_api.dart' as _i748;
import '../core/profile/data/source/remote/profile_remote_source_impl.dart'
    as _i282;
import '../core/profile/domain/repo/profile_repo.dart' as _i37;
import '../core/profile/domain/source/profile_local_source.dart' as _i347;
import '../core/profile/domain/source/profile_remote_source.dart' as _i563;
import '../core/profile/domain/use_case/get_member_data_use_case.dart' as _i842;
import '../core/profile/domain/use_case/get_profile_use_case.dart' as _i1031;
import '../core/statistics/data/repo/statistics_repo_impl.dart' as _i5;
import '../core/statistics/data/source/local/statistics_local_source_impl.dart'
    as _i896;
import '../core/statistics/data/source/remote/statistics_api.dart' as _i297;
import '../core/statistics/data/source/remote/statistics_remote_source_impl.dart'
    as _i311;
import '../core/statistics/domain/repo/statistics_repo.dart' as _i428;
import '../core/statistics/domain/source/statistics_local_source.dart' as _i424;
import '../core/statistics/domain/source/statistics_remote_source.dart'
    as _i761;
import '../core/subscriptions/data/repo/subscriptions_repo_impl.dart' as _i188;
import '../core/subscriptions/data/source/local/subscriptions_local_source_impl.dart'
    as _i598;
import '../core/subscriptions/data/source/remote/subscriptions_api.dart'
    as _i494;
import '../core/subscriptions/data/source/remote/subscriptions_remote_source_impl.dart'
    as _i206;
import '../core/subscriptions/domain/repo/subscriptions_repo.dart' as _i427;
import '../core/subscriptions/domain/source/subscriptions_local_source.dart'
    as _i161;
import '../core/subscriptions/domain/source/subscriptions_remote_source.dart'
    as _i229;
import '../core/subscriptions/domain/use_case/get_user_subscription_use_case.dart'
    as _i942;
import '../core/subscriptions/domain/use_case/purchase_subscription_use_case.dart'
    as _i235;
import '../core/subscriptions/domain/use_case/restore_subscription_use_case.dart'
    as _i914;
import '../core/user_preferences/data/repo/user_preferences_repo_impl.dart'
    as _i917;
import '../core/user_preferences/data/source/local/user_preferences_local_source_impl.dart'
    as _i923;
import '../core/user_preferences/data/source/remote/user_preferences_api.dart'
    as _i454;
import '../core/user_preferences/data/source/remote/user_preferences_remote_source_impl.dart'
    as _i1063;
import '../core/user_preferences/domain/repo/user_preferences_repo.dart'
    as _i421;
import '../core/user_preferences/domain/source/user_preferences_local_source.dart'
    as _i357;
import '../core/user_preferences/domain/source/user_preferences_remote_source.dart'
    as _i783;
import '../db/daos/ad_views_dao.dart' as _i636;
import '../db/daos/fact_explanations_dao.dart' as _i96;
import '../db/database.dart' as _i783;
import '../presentation/bloc/auth/auth_cubit.dart' as _i973;
import '../presentation/bloc/auth/authentication_page_cubit.dart' as _i229;
import '../presentation/bloc/auth/login_cubit.dart' as _i760;
import '../presentation/bloc/auth/register_cubit.dart' as _i1034;
import '../presentation/bloc/backgrounds/active_background_cubit.dart' as _i546;
import '../presentation/bloc/backgrounds/available_backgrounds_cubit.dart'
    as _i676;
import '../presentation/bloc/backgrounds/background_edit_cubit.dart' as _i401;
import '../presentation/bloc/change_password/change_password_cubit.dart'
    as _i258;
import '../presentation/bloc/connectivity/connectivity_cubit.dart' as _i329;
import '../presentation/bloc/edit_profile/edit_profile_cubit.dart' as _i172;
import '../presentation/bloc/facts/daily_facts_cubit.dart' as _i807;
import '../presentation/bloc/facts/fact_explanation_cubit.dart' as _i680;
import '../presentation/bloc/facts/fact_share_cubit.dart' as _i1057;
import '../presentation/bloc/facts/facts_archive_cubit.dart' as _i618;
import '../presentation/bloc/notifications/notifications_cubit.dart' as _i480;
import '../presentation/bloc/onboarding/onboarding_configuration_cubit.dart'
    as _i471;
import '../presentation/bloc/onboarding/select_interests_cubit.dart' as _i363;
import '../presentation/bloc/onboarding/select_notification_time_cubit.dart'
    as _i834;
import '../presentation/bloc/permissions/permissions_cubit.dart' as _i785;
import '../presentation/bloc/profile/profile_cubit.dart' as _i992;
import '../presentation/bloc/subscriptions/subscription_offerings_cubit.dart'
    as _i783;
import '../presentation/bloc/subscriptions/user_subscription_cubit.dart'
    as _i810;
import '../presentation/bloc/user_preferences/user_preferences_cubit.dart'
    as _i565;
import '../presentation/bloc/user_statistics/user_statistics_cubit.dart'
    as _i975;
import '../presentation/shared/router/root_router.dart' as _i304;
import '../presentation/shared/utils/redirect_util.dart' as _i1037;
import 'plugin_module.dart' as _i697;
import 'server_module.dart' as _i131;

const String _dev = 'dev';
const String _prod = 'prod';

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final pluginModule = _$PluginModule();
  final serverModule = _$ServerModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => pluginModule.provideSharedPreferences(),
    preResolve: true,
  );
  await gh.factoryAsync<_i655.PackageInfo>(
    () => pluginModule.packageInfo(),
    preResolve: true,
  );
  gh.factory<_i229.AuthenticationPageCubit>(
    () => _i229.AuthenticationPageCubit(),
  );
  gh.factory<_i834.SelectNotificationTimeCubit>(
    () => _i834.SelectNotificationTimeCubit(),
  );
  gh.lazySingleton<_i480.AppleSignInProvider>(
    () => const _i480.AppleSignInProvider(),
  );
  gh.lazySingleton<_i335.FactCaptureUtil>(() => const _i335.FactCaptureUtil());
  gh.lazySingleton<_i147.FactSharesStorage>(() => _i147.FactSharesStorage());
  gh.lazySingleton<_i783.AppLocalDatabase>(() => _i783.AppLocalDatabase());
  gh.lazySingleton<_i558.FlutterSecureStorage>(
    () => pluginModule.provideSecureStorage(),
  );
  gh.lazySingleton<_i892.FirebaseMessaging>(
    () => pluginModule.provideFirebaseMessaging(),
  );
  gh.lazySingleton<_i398.FirebaseAnalytics>(
    () => pluginModule.provideFirebaseAnalytics(),
  );
  gh.lazySingleton<_i895.Connectivity>(
    () => pluginModule.provideConnectivity(),
  );
  gh.lazySingleton<_i833.DeviceInfoPlugin>(
    () => pluginModule.provideDeviceInfo(),
  );
  gh.lazySingleton<_i998.SharePlus>(() => pluginModule.provideSharePlus());
  gh.lazySingleton<_i981.AppinioSocialShare>(
    () => pluginModule.provideSocialShare(),
  );
  gh.lazySingleton<_i304.RootRouterData>(() => _i304.RootRouterData());
  gh.lazySingleton<_i1037.RedirectUtil>(() => _i1037.RedirectUtil());
  gh.lazySingleton<String>(
    () => serverModule.devBaseApiUrl(),
    instanceName: 'API',
    registerFor: {_dev},
  );
  gh.factoryParam<
    _i363.SelectInterestsCubit,
    List<_i1032.UserInterest>?,
    dynamic
  >((selectedInterests, _) => _i363.SelectInterestsCubit(selectedInterests));
  gh.factory<_i57.DebugPrintService>(() => _i57.DevDebugPrintService());
  gh.lazySingleton<_i784.DeviceInfoRepo>(
    () => _i924.DeviceInfoRepoImpl(
      gh<_i655.PackageInfo>(),
      gh<_i833.DeviceInfoPlugin>(),
    ),
  );
  gh.lazySingleton<_i890.LocalSecureStorage>(
    () => _i890.LocalSecureStorage(gh<_i558.FlutterSecureStorage>()),
  );
  gh.lazySingleton<String>(
    () => serverModule.devEnvPrefix(),
    instanceName: 'ENV_PREFIX',
    registerFor: {_dev},
  );
  gh.lazySingleton<String>(
    () => serverModule.provideEnvDev(),
    instanceName: 'ENV',
    registerFor: {_dev},
  );
  gh.lazySingleton<_i663.LocalStorage>(
    () => _i663.LocalStorage(gh<_i460.SharedPreferences>()),
  );
  gh.lazySingleton<_i636.AdViewsDao>(
    () => _i636.AdViewsDao(gh<_i783.AppLocalDatabase>()),
  );
  gh.lazySingleton<_i96.FactExplanationsDao>(
    () => _i96.FactExplanationsDao(gh<_i783.AppLocalDatabase>()),
  );
  gh.lazySingleton<String>(
    () => serverModule.prodBaseApiUrl(),
    instanceName: 'API',
    registerFor: {_prod},
  );
  gh.lazySingleton<_i1034.FactShareCompositor>(
    () => _i1034.FactShareCompositor(gh<_i147.FactSharesStorage>()),
  );
  gh.factoryParam<_i401.BackgroundEditCubit, _i41.BackgroundStyle, dynamic>(
    (initialStyle, _) => _i401.BackgroundEditCubit(initialStyle),
  );
  gh.lazySingleton<_i655.ShareService>(
    () => _i655.ShareService(
      gh<_i981.AppinioSocialShare>(),
      gh<_i998.SharePlus>(),
    ),
  );
  gh.lazySingleton<_i605.ConnectivityRepo>(
    () => _i946.ConnectivityRepoImpl(gh<_i895.Connectivity>()),
  );
  gh.lazySingleton<_i561.AnalyticsRepo>(
    () => _i3.AnalyticsRepoImpl(gh<_i398.FirebaseAnalytics>()),
  );
  gh.lazySingleton<String>(
    () => serverModule.provideEnvProd(),
    instanceName: 'ENV',
    registerFor: {_prod},
  );
  gh.lazySingleton<String>(
    () => serverModule.prodEnvPrefix(),
    instanceName: 'ENV_PREFIX',
    registerFor: {_prod},
  );
  gh.lazySingleton<_i357.UserPreferencesLocalSource>(
    () => _i923.UserPreferencesLocalSourceImpl(
      gh<_i663.LocalStorage>(),
      gh<String>(instanceName: 'ENV_PREFIX'),
    ),
  );
  await gh.factoryAsync<_i659.DeviceInfo>(
    () => pluginModule.provideDeviceDetails(gh<_i784.DeviceInfoRepo>()),
    preResolve: true,
  );
  gh.lazySingleton<_i816.CommonStorage>(
    () => _i816.CommonStorage(
      gh<_i663.LocalStorage>(),
      gh<String>(instanceName: 'ENV_PREFIX'),
    ),
  );
  gh.lazySingleton<_i347.ProfileLocalSource>(
    () => _i877.ProfileLocalSourceImpl(
      gh<_i663.LocalStorage>(),
      gh<String>(instanceName: 'ENV_PREFIX'),
    ),
  );
  gh.lazySingleton<_i522.AdsRepo>(
    () => _i479.AdsRepoImpl(gh<_i636.AdViewsDao>()),
  );
  gh.lazySingleton<_i324.InitialRouteUseCase>(
    () => _i324.InitialRouteUseCase(gh<_i816.CommonStorage>()),
  );
  gh.lazySingleton<_i159.BackgroundsLocalSource>(
    () => _i785.BackgroundsLocalSourceImpl(
      gh<_i663.LocalStorage>(),
      gh<String>(instanceName: 'ENV_PREFIX'),
    ),
  );
  gh.lazySingleton<_i116.GoogleSignIn>(
    () => pluginModule.provideGoogleSignIn(gh<String>(instanceName: 'ENV')),
  );
  gh.lazySingleton<_i361.Dio>(
    () => serverModule.apiDio(gh<String>(instanceName: 'API')),
    instanceName: 'API',
  );
  gh.lazySingleton<_i161.SubscriptionsLocalSource>(
    () => _i598.SubscriptionsLocalSourceImpl(
      gh<_i663.LocalStorage>(),
      gh<String>(instanceName: 'ENV_PREFIX'),
    ),
  );
  gh.lazySingleton<_i424.StatisticsLocalSource>(
    () => _i896.StatisticsLocalSourceImpl(
      gh<_i663.LocalStorage>(),
      gh<String>(instanceName: 'ENV_PREFIX'),
    ),
  );
  gh.lazySingleton<_i785.AccessTokenRepo>(
    () => _i900.AccessTokenRepoImpl(
      gh<_i890.LocalSecureStorage>(),
      gh<String>(instanceName: 'ENV_PREFIX'),
    ),
  );
  gh.lazySingleton<_i799.ShowFactExplanationAdUseCase>(
    () => _i799.ShowFactExplanationAdUseCase(gh<_i522.AdsRepo>()),
  );
  gh.lazySingleton<_i329.ConnectivityCubit>(
    () => _i329.ConnectivityCubit(gh<_i605.ConnectivityRepo>()),
  );
  gh.lazySingleton<_i757.FactShareUtil>(
    () => _i757.FactShareUtil(gh<_i655.ShareService>()),
  );
  gh.lazySingleton<_i785.PermissionsCubit>(
    () => _i785.PermissionsCubit(gh<_i561.AnalyticsRepo>()),
  );
  gh.lazySingleton<_i890.FactsLocalSource>(
    () => _i721.FactsLocalSourceImpl(
      gh<_i96.FactExplanationsDao>(),
      gh<_i663.LocalStorage>(),
      gh<String>(instanceName: 'ENV_PREFIX'),
    ),
  );
  gh.lazySingleton<_i202.GoogleSignInProvider>(
    () => _i202.GoogleSignInProvider(gh<_i116.GoogleSignIn>()),
  );
  gh.lazySingleton<_i663.RequestExecutor>(
    () => serverModule.requestExecutor(
      gh<_i361.Dio>(instanceName: 'API'),
      gh<_i785.AccessTokenRepo>(),
    ),
    instanceName: 'API',
  );
  gh.lazySingleton<_i223.AuthApi>(
    () => _i223.AuthApi(gh<_i663.RequestExecutor>(instanceName: 'API')),
  );
  gh.lazySingleton<_i38.BackgroundsApi>(
    () => _i38.BackgroundsApi(gh<_i663.RequestExecutor>(instanceName: 'API')),
  );
  gh.lazySingleton<_i16.FactsApi>(
    () => _i16.FactsApi(gh<_i663.RequestExecutor>(instanceName: 'API')),
  );
  gh.lazySingleton<_i469.PushNotificationsApi>(
    () => _i469.PushNotificationsApi(
      gh<_i663.RequestExecutor>(instanceName: 'API'),
    ),
  );
  gh.lazySingleton<_i748.ProfileApi>(
    () => _i748.ProfileApi(gh<_i663.RequestExecutor>(instanceName: 'API')),
  );
  gh.lazySingleton<_i297.StatisticsApi>(
    () => _i297.StatisticsApi(gh<_i663.RequestExecutor>(instanceName: 'API')),
  );
  gh.lazySingleton<_i494.SubscriptionsApi>(
    () =>
        _i494.SubscriptionsApi(gh<_i663.RequestExecutor>(instanceName: 'API')),
  );
  gh.lazySingleton<_i454.UserPreferencesApi>(
    () => _i454.UserPreferencesApi(
      gh<_i663.RequestExecutor>(instanceName: 'API'),
    ),
  );
  gh.lazySingleton<_i460.AuthRemoteSource>(
    () => _i898.AuthRemoteSourceImpl(
      gh<_i785.AccessTokenRepo>(),
      gh<_i223.AuthApi>(),
    ),
  );
  gh.lazySingleton<_i412.BackgroundsRemoteSource>(
    () => _i976.BackgroundsRemoteSourceImpl(gh<_i38.BackgroundsApi>()),
  );
  gh.lazySingleton<_i783.UserPreferencesRemoteSource>(
    () =>
        _i1063.UserPreferencesRemoteSourceImpl(gh<_i454.UserPreferencesApi>()),
  );
  gh.lazySingleton<_i1009.PushNotificationsRemoteSource>(
    () => _i145.PushNotificationsRemoteSourceImpl(
      gh<_i469.PushNotificationsApi>(),
    ),
  );
  gh.lazySingleton<_i479.FactsRemoteSource>(
    () => _i334.FactsRemoteSourceImpl(gh<_i16.FactsApi>()),
  );
  gh.lazySingleton<_i563.ProfileRemoteSource>(
    () => _i282.ProfileRemoteSourceImpl(gh<_i748.ProfileApi>()),
  );
  gh.lazySingleton<_i634.DailyFactsRepo>(
    () => _i489.DailyFactsRepoImpl(
      gh<_i890.FactsLocalSource>(),
      gh<_i479.FactsRemoteSource>(),
    ),
  );
  gh.lazySingleton<_i323.AuthRepo>(
    () => _i883.AuthRepoImpl(
      gh<_i460.AuthRemoteSource>(),
      gh<_i202.GoogleSignInProvider>(),
      gh<_i480.AppleSignInProvider>(),
    ),
  );
  gh.lazySingleton<_i451.FactsArchiveRepo>(
    () => _i299.FactsArchiveRepoImpl(
      gh<_i890.FactsLocalSource>(),
      gh<_i479.FactsRemoteSource>(),
    ),
  );
  gh.lazySingleton<_i229.SubscriptionsRemoteSource>(
    () => _i206.SubscriptionsRemoteSourceImpl(gh<_i494.SubscriptionsApi>()),
  );
  gh.lazySingleton<_i829.FactExplanationsRepo>(
    () => _i946.FactExplanationsRepoImpl(
      gh<_i890.FactsLocalSource>(),
      gh<_i479.FactsRemoteSource>(),
    ),
  );
  gh.lazySingleton<_i421.UserPreferencesRepo>(
    () => _i917.UserPreferencesRepoImpl(
      gh<_i357.UserPreferencesLocalSource>(),
      gh<_i783.UserPreferencesRemoteSource>(),
    ),
  );
  gh.lazySingleton<_i293.PushNotificationsRepo>(
    () => _i998.PushNotificationsRepoImpl(
      gh<_i892.FirebaseMessaging>(),
      gh<_i1009.PushNotificationsRemoteSource>(),
      gh<_i663.LocalStorage>(),
      gh<_i890.LocalSecureStorage>(),
      gh<_i784.DeviceInfoRepo>(),
      gh<String>(instanceName: 'ENV_PREFIX'),
    ),
  );
  gh.lazySingleton<_i761.StatisticsRemoteSource>(
    () => _i311.StatisticsRemoteSourceImpl(gh<_i297.StatisticsApi>()),
  );
  gh.lazySingleton<_i583.CheckFactExplanationUseCase>(
    () => _i583.CheckFactExplanationUseCase(gh<_i829.FactExplanationsRepo>()),
  );
  gh.lazySingleton<_i974.FactExplanationUtilUseCase>(
    () => _i974.FactExplanationUtilUseCase(gh<_i829.FactExplanationsRepo>()),
  );
  gh.lazySingleton<_i1043.StarFactExplanationUseCase>(
    () => _i1043.StarFactExplanationUseCase(
      gh<_i829.FactExplanationsRepo>(),
      gh<_i974.FactExplanationUtilUseCase>(),
      gh<_i561.AnalyticsRepo>(),
    ),
  );
  gh.factory<_i258.ChangePasswordCubit>(
    () => _i258.ChangePasswordCubit(gh<_i323.AuthRepo>()),
  );
  gh.lazySingleton<_i954.AdFactExplanationUseCase>(
    () => _i954.AdFactExplanationUseCase(
      gh<_i829.FactExplanationsRepo>(),
      gh<_i974.FactExplanationUtilUseCase>(),
      gh<_i799.ShowFactExplanationAdUseCase>(),
      gh<_i561.AnalyticsRepo>(),
      gh<_i522.AdsRepo>(),
    ),
  );
  gh.lazySingleton<_i665.HandleFactsArchiveUseCase>(
    () => _i665.HandleFactsArchiveUseCase(gh<_i451.FactsArchiveRepo>()),
  );
  gh.lazySingleton<_i1044.BackgroundAssetCacheUtil>(
    () => _i1044.BackgroundAssetCacheUtil(
      gh<String>(instanceName: 'ENV_PREFIX'),
      gh<_i412.BackgroundsRemoteSource>(),
    ),
  );
  gh.lazySingleton<_i37.ProfileRepo>(
    () => _i846.ProfileRepoImpl(
      gh<_i347.ProfileLocalSource>(),
      gh<_i563.ProfileRemoteSource>(),
    ),
  );
  gh.lazySingleton<_i91.BackgroundsRepo>(
    () => _i459.BackgroundsRepoImpl(
      gh<_i159.BackgroundsLocalSource>(),
      gh<_i412.BackgroundsRemoteSource>(),
      gh<_i1044.BackgroundAssetCacheUtil>(),
    ),
  );
  gh.lazySingleton<_i1031.GetProfileUseCase>(
    () => _i1031.GetProfileUseCase(gh<_i37.ProfileRepo>()),
  );
  gh.lazySingleton<_i973.AuthCubit>(
    () => _i973.AuthCubit(gh<_i37.ProfileRepo>()),
  );
  gh.lazySingleton<_i428.StatisticsRepo>(
    () => _i5.StatisticsRepoImpl(
      gh<_i424.StatisticsLocalSource>(),
      gh<_i761.StatisticsRemoteSource>(),
    ),
  );
  gh.lazySingleton<_i427.SubscriptionsRepo>(
    () => _i188.SubscriptionsRepoImpl(
      gh<_i161.SubscriptionsLocalSource>(),
      gh<_i229.SubscriptionsRemoteSource>(),
      gh<_i323.AuthRepo>(),
      gh<String>(instanceName: 'ENV'),
    ),
  );
  gh.lazySingleton<_i992.ProfileCubit>(
    () => _i992.ProfileCubit(
      gh<_i37.ProfileRepo>(),
      gh<_i1031.GetProfileUseCase>(),
    ),
  );
  gh.lazySingleton<_i480.NotificationsCubit>(
    () => _i480.NotificationsCubit(
      gh<_i973.AuthCubit>(),
      gh<_i293.PushNotificationsRepo>(),
      gh<_i892.FirebaseMessaging>(),
      gh<_i561.AnalyticsRepo>(),
    ),
  );
  gh.lazySingleton<_i565.UserPreferencesCubit>(
    () => _i565.UserPreferencesCubit(
      gh<_i421.UserPreferencesRepo>(),
      gh<_i973.AuthCubit>(),
    ),
  );
  gh.lazySingleton<_i975.UserStatisticsCubit>(
    () => _i975.UserStatisticsCubit(gh<_i428.StatisticsRepo>()),
  );
  gh.lazySingleton<_i942.GetUserSubscriptionUseCase>(
    () => _i942.GetUserSubscriptionUseCase(gh<_i427.SubscriptionsRepo>()),
  );
  gh.lazySingleton<_i235.PurchaseSubscriptionUseCase>(
    () => _i235.PurchaseSubscriptionUseCase(
      gh<_i427.SubscriptionsRepo>(),
      gh<_i561.AnalyticsRepo>(),
    ),
  );
  gh.lazySingleton<_i914.RestoreSubscriptionUseCase>(
    () => _i914.RestoreSubscriptionUseCase(
      gh<_i427.SubscriptionsRepo>(),
      gh<_i561.AnalyticsRepo>(),
    ),
  );
  gh.lazySingleton<_i648.ApplyDefaultBackgroundUseCase>(
    () => _i648.ApplyDefaultBackgroundUseCase(
      gh<_i91.BackgroundsRepo>(),
      gh<_i565.UserPreferencesCubit>(),
    ),
  );
  gh.factory<_i172.EditProfileCubit>(
    () => _i172.EditProfileCubit(
      gh<_i992.ProfileCubit>(),
      gh<_i37.ProfileRepo>(),
      gh<_i323.AuthRepo>(),
      gh<_i973.AuthCubit>(),
    ),
  );
  gh.lazySingleton<_i567.ApplyCustomBackgroundUseCase>(
    () => _i567.ApplyCustomBackgroundUseCase(
      gh<_i91.BackgroundsRepo>(),
      gh<_i565.UserPreferencesCubit>(),
      gh<_i975.UserStatisticsCubit>(),
      gh<_i992.ProfileCubit>(),
      gh<_i561.AnalyticsRepo>(),
    ),
  );
  gh.lazySingleton<_i974.GetDailyFactsBucketUseCase>(
    () => _i974.GetDailyFactsBucketUseCase(
      gh<_i634.DailyFactsRepo>(),
      gh<_i565.UserPreferencesCubit>(),
    ),
  );
  gh.factoryParam<_i680.FactExplanationCubit, _i431.DailyFact, dynamic>(
    (fact, _) => _i680.FactExplanationCubit(
      fact,
      gh<_i561.AnalyticsRepo>(),
      gh<_i992.ProfileCubit>(),
      gh<_i975.UserStatisticsCubit>(),
      gh<_i816.CommonStorage>(),
      gh<_i954.AdFactExplanationUseCase>(),
      gh<_i1043.StarFactExplanationUseCase>(),
      gh<_i974.FactExplanationUtilUseCase>(),
      gh<_i583.CheckFactExplanationUseCase>(),
    ),
  );
  gh.lazySingleton<_i783.SubscriptionOfferingsCubit>(
    () => _i783.SubscriptionOfferingsCubit(
      gh<_i427.SubscriptionsRepo>(),
      gh<_i235.PurchaseSubscriptionUseCase>(),
      gh<_i914.RestoreSubscriptionUseCase>(),
      gh<_i973.AuthCubit>(),
    ),
  );
  gh.lazySingleton<_i807.DailyFactsCubit>(
    () => _i807.DailyFactsCubit(
      gh<_i634.DailyFactsRepo>(),
      gh<_i974.GetDailyFactsBucketUseCase>(),
    ),
  );
  gh.lazySingleton<_i541.RegisterUseCase>(
    () => _i541.RegisterUseCase(
      gh<_i323.AuthRepo>(),
      gh<_i973.AuthCubit>(),
      gh<_i816.CommonStorage>(),
      gh<_i293.PushNotificationsRepo>(),
      gh<_i427.SubscriptionsRepo>(),
      gh<_i561.AnalyticsRepo>(),
      gh<_i565.UserPreferencesCubit>(),
      gh<_i992.ProfileCubit>(),
    ),
  );
  gh.lazySingleton<_i546.ActiveBackgroundCubit>(
    () => _i546.ActiveBackgroundCubit(
      gh<_i91.BackgroundsRepo>(),
      gh<_i648.ApplyDefaultBackgroundUseCase>(),
      gh<_i567.ApplyCustomBackgroundUseCase>(),
    ),
  );
  gh.lazySingleton<_i810.UserSubscriptionCubit>(
    () => _i810.UserSubscriptionCubit(
      gh<_i427.SubscriptionsRepo>(),
      gh<_i942.GetUserSubscriptionUseCase>(),
    ),
  );
  gh.factory<_i1034.RegisterCubit>(
    () => _i1034.RegisterCubit(
      gh<_i541.RegisterUseCase>(),
      gh<_i565.UserPreferencesCubit>(),
    ),
  );
  gh.lazySingleton<_i1057.FactShareCubit>(
    () => _i1057.FactShareCubit(
      gh<_i335.FactCaptureUtil>(),
      gh<_i1034.FactShareCompositor>(),
      gh<_i147.FactSharesStorage>(),
      gh<_i546.ActiveBackgroundCubit>(),
    ),
  );
  gh.lazySingleton<_i1037.GetAvailableBackgroundsUseCase>(
    () => _i1037.GetAvailableBackgroundsUseCase(
      gh<_i91.BackgroundsRepo>(),
      gh<_i565.UserPreferencesCubit>(),
      gh<_i546.ActiveBackgroundCubit>(),
    ),
  );
  gh.lazySingleton<_i343.ShowAddToArchiveAdUseCase>(
    () => _i343.ShowAddToArchiveAdUseCase(
      gh<_i522.AdsRepo>(),
      gh<_i816.CommonStorage>(),
      gh<_i810.UserSubscriptionCubit>(),
      gh<_i992.ProfileCubit>(),
    ),
  );
  gh.lazySingleton<_i676.AvailableBackgroundsCubit>(
    () => _i676.AvailableBackgroundsCubit(
      gh<_i91.BackgroundsRepo>(),
      gh<_i1037.GetAvailableBackgroundsUseCase>(),
    ),
  );
  gh.lazySingleton<_i618.FactsArchiveCubit>(
    () => _i618.FactsArchiveCubit(
      gh<_i451.FactsArchiveRepo>(),
      gh<_i343.ShowAddToArchiveAdUseCase>(),
      gh<_i665.HandleFactsArchiveUseCase>(),
      gh<_i561.AnalyticsRepo>(),
    ),
  );
  gh.lazySingleton<_i697.OnLogoutUseCase>(
    () => _i697.OnLogoutUseCase(
      gh<_i816.CommonStorage>(),
      gh<_i634.DailyFactsRepo>(),
      gh<_i451.FactsArchiveRepo>(),
      gh<_i37.ProfileRepo>(),
      gh<_i421.UserPreferencesRepo>(),
      gh<_i428.StatisticsRepo>(),
      gh<_i829.FactExplanationsRepo>(),
      gh<_i293.PushNotificationsRepo>(),
      gh<_i785.AccessTokenRepo>(),
      gh<_i91.BackgroundsRepo>(),
      gh<_i427.SubscriptionsRepo>(),
      gh<_i992.ProfileCubit>(),
      gh<_i565.UserPreferencesCubit>(),
      gh<_i975.UserStatisticsCubit>(),
      gh<_i810.UserSubscriptionCubit>(),
      gh<_i618.FactsArchiveCubit>(),
      gh<_i807.DailyFactsCubit>(),
      gh<_i676.AvailableBackgroundsCubit>(),
    ),
  );
  gh.lazySingleton<_i842.GetMemberDataUseCase>(
    () => _i842.GetMemberDataUseCase(
      gh<_i37.ProfileRepo>(),
      gh<_i992.ProfileCubit>(),
      gh<_i565.UserPreferencesCubit>(),
      gh<_i975.UserStatisticsCubit>(),
      gh<_i810.UserSubscriptionCubit>(),
      gh<_i618.FactsArchiveCubit>(),
    ),
  );
  gh.lazySingleton<_i684.LoginAnonymouslyUseCase>(
    () => _i684.LoginAnonymouslyUseCase(
      gh<_i323.AuthRepo>(),
      gh<_i973.AuthCubit>(),
      gh<_i816.CommonStorage>(),
      gh<_i293.PushNotificationsRepo>(),
      gh<_i427.SubscriptionsRepo>(),
      gh<_i992.ProfileCubit>(),
      gh<_i565.UserPreferencesCubit>(),
      gh<_i975.UserStatisticsCubit>(),
      gh<_i676.AvailableBackgroundsCubit>(),
      gh<_i807.DailyFactsCubit>(),
    ),
  );
  gh.lazySingleton<_i849.OnBackgroundAppliedUseCase>(
    () => _i849.OnBackgroundAppliedUseCase(
      gh<_i565.UserPreferencesCubit>(),
      gh<_i676.AvailableBackgroundsCubit>(),
    ),
  );
  gh.lazySingleton<_i104.LoginUseCase>(
    () => _i104.LoginUseCase(
      gh<_i323.AuthRepo>(),
      gh<_i973.AuthCubit>(),
      gh<_i816.CommonStorage>(),
      gh<_i293.PushNotificationsRepo>(),
      gh<_i427.SubscriptionsRepo>(),
      gh<_i561.AnalyticsRepo>(),
      gh<_i565.UserPreferencesCubit>(),
      gh<_i975.UserStatisticsCubit>(),
      gh<_i810.UserSubscriptionCubit>(),
      gh<_i992.ProfileCubit>(),
      gh<_i618.FactsArchiveCubit>(),
      gh<_i676.AvailableBackgroundsCubit>(),
      gh<_i807.DailyFactsCubit>(),
    ),
  );
  gh.factory<_i471.OnboardingConfigurationCubit>(
    () =>
        _i471.OnboardingConfigurationCubit(gh<_i684.LoginAnonymouslyUseCase>()),
  );
  gh.factory<_i760.LoginCubit>(
    () => _i760.LoginCubit(gh<_i323.AuthRepo>(), gh<_i104.LoginUseCase>()),
  );
  return getIt;
}

class _$PluginModule extends _i697.PluginModule {}

class _$ServerModule extends _i131.ServerModule {}
