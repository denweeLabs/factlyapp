// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/permissions/domain/entity/app_permission_status.dart';
import 'package:denwee/core/permissions/domain/repo/app_permission.dart';
import 'package:denwee/core/statistics/domain/entity/user_statistics.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:denwee/core/ui/bloc/permissions_cubit/permissions_cubit.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:denwee/core/ui/bloc/user_statistics_cubit/user_statistics_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/router/root_router.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/core/ui/utils/launcher_util.dart';
import 'package:denwee/core/ui/widget/animations/animated_number_widget.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/common/common_scaffold_widget.dart';
import 'package:denwee/pages/account/ui/widget/subscription/subscription_card_widget.dart';
import 'package:denwee/pages/account/ui/widget/theme_colorations/coloration_overview_selector_widget.dart';
import 'package:denwee/core/ui/widget/misc/fading_edge_widget.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/pages/account/ui/widget/theme_colorations/theme_overview_selector_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:denwee/pages/authentication/args/authentication_page_args.dart';
import 'package:denwee/pages/authentication/ui/authentication_routes.dart';
import 'package:denwee/pages/account/profile/ui/profile_page.dart';
import 'package:denwee/pages/account/ui/account_base_page.dart';
import 'package:denwee/pages/account/ui/account_routes.dart';
import 'package:denwee/pages/account/ui/widget/misc/account_horizontal_tile_widget.dart';
import 'package:denwee/pages/account/ui/widget/misc/account_items_divider_widget.dart';
import 'package:denwee/pages/account/ui/widget/misc/account_section_widget.dart';
import 'package:denwee/pages/account/ui/widget/profile_overlay/profile_overlay_card_widget.dart';
import 'package:denwee/pages/account/ui/widget/interests/selected_interests_list_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_scroll_physics/snap_scroll_physics.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:utils/utils.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  static const routeName = 'AccountPage';

  static const edgeFades = [0.0, 0.06, 0.75, 1.0];

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final topPadding = context.topPadding + 24.h;
    final bottomPadding = AccountBasePage.safeAreaBottomPadding(context) + 42.h;

    final scrollSnap = Snap(0.0, trailingDistance: topPadding);
    final scrollPhysics = SnapScrollPhysics(snaps: [scrollSnap]);

    return CommonScaffold(
      body: FadingEdge(
        enabled: Platform.isIOS,
        axis: Axis.vertical,
        stops: AccountPage.edgeFades,
        child: ListView(
          physics: scrollPhysics,
          padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
          children: [
            _buildProfileSection(context),
            48.verticalSpace,
            _buildDailyFactsSection(context),
            42.verticalSpace,
            _buildSubscriptionSection(context),
            48.verticalSpace,
            _buildThemeModeSection(context),
            44.verticalSpace,
            _buildThemeColorationSection(context),
            48.verticalSpace,
            _buildPreferencesSection(context),
            38.verticalSpace,
            _buildMoreSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return AccountSection(
      title: context.tr(LocaleKeys.account_section_profile_title),
      childrenPadding: EdgeInsets.symmetric(horizontal: 20.w),
      children: [
        Builder(
          builder: (context) => ProfileOverlayCard(
            onTap: () => _onProfileTap(context),
            heroTag: ProfilePage.personalDetailsHeroTag,
            isAuthenticated: context.select<AuthCubit, bool>((cubit) => cubit.state.isAuthenticated),
            statistics: context.select<UserStatisticsCubit, UserStatistics>((cubit) => cubit.state.statistics),
            userName: context.watch<ProfileCubit>().state.commonUserName(context),
          ),
        ),
      ],
    );
  }

  Widget _buildSubscriptionSection(BuildContext context) {
    return AccountSection(
      title: context.tr(LocaleKeys.account_profile_subscription_title),
      childrenPadding: EdgeInsets.symmetric(horizontal: 20.w),
      children: const [SubscriptionCard()],
    );
  }

  Widget _buildDailyFactsSection(BuildContext context) {
    return AccountSection(
      title: context.tr(LocaleKeys.account_section_daily_facts_title),
      children: [
        BlocSelector<UserPreferencesCubit, UserPreferencesState, List<UserInterest>>(
          selector: (state) => state.preferences.interests,
          builder: (context, interests) => SelectedInterestsList(
            interests: interests,
            onEdit: () => _onEditInterests(context),
          ),
        ),
        20.verticalSpace,
        BlocSelector<UserPreferencesCubit, UserPreferencesState, bool>(
          selector: (state) => state.preferences.notifications.isEnabled,
          builder: (context, isNotificationsEnabled) => AccountHorizontalTile.sSwitch(
            iconPath: AppConstants.assets.icons.notificationsLinear,
            title: context.tr(LocaleKeys.account_section_daily_facts_items_receive_notification),
            switchValue: isNotificationsEnabled,
            onTap: () => _onToggleNotificationsEnabled(context),
          ),
        ),
        const AccountItemsDivider(),
        AccountHorizontalTile.widget(
          onTap: _onChangeNotificationTime,
          iconPath: AppConstants.assets.icons.clockLinear,
          title: context.tr(LocaleKeys.account_section_daily_facts_items_notification_time),
          widget: BlocSelector<UserPreferencesCubit, UserPreferencesState, DateTime>(
            selector: (state) => state.preferences.notifications.time,
            builder: (context, notificationsTime) {
              final timeAsNum = hourMinuteToFraction(notificationsTime);

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedNumber(
                    number: timeAsNum,
                    style: h5.copyWith(
                      color: context.theme.colorScheme.secondary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.6,
                    ),
                    prefix: timeAsNum < 10 ? '0' : null,
                    decimalSeparator: ':',
                    fractionDigits: 2,
                  ),
                  6.horizontalSpace,
                  CommonAppIcon(
                    path: AppConstants.assets.icons.arrowRightIos,
                    color: context.iconColorTernary,
                    size: 20,
                  ),
                ],
              );
            },
          ),
        ),
        const AccountItemsDivider(),
        AccountHorizontalTile.more(
          iconPath: AppConstants.assets.icons.archiveTickLinear,
          title: context.tr(LocaleKeys.account_section_daily_facts_items_archive),
          onTap: () => context.restorablePushNamedArgs(AccountRoutes.myArchive),
        ),
      ],
    );
  }

  Widget _buildThemeModeSection(BuildContext context) {
    return AccountSection(
      title: context.tr(LocaleKeys.account_section_theme_title),
      children: const [ThemeModeOverviewSelector()],
    );
  }

  Widget _buildThemeColorationSection(BuildContext context) {
    return AccountSection(
      title: context.tr(LocaleKeys.account_section_coloration_title),
      children: const [ColorationOverviewSelector()],
    );
  }

  Widget _buildPreferencesSection(BuildContext context) {
    final selectedLanguageName = AppConstants.config.languages
        .firstWhereOrNull((language) => language.locale == context.locale)
        ?.nativeName;

    return AccountSection(
      verticalSpacing: 12,
      title: context.tr(LocaleKeys.account_section_preferences_title),
      children: [
        AccountHorizontalTile.valueMore(
          iconPath: AppConstants.assets.icons.globeLinear,
          title: context.tr(LocaleKeys.account_section_preferences_items_language),
          onTap: () => _onChangeLanguageTap(context),
          value: selectedLanguageName ?? context.locale.toString(),
        ),
        BlocSelector<UserPreferencesCubit, UserPreferencesState, bool>(
          selector: (state) => state.preferences.misc.isHapticsEnabled,
          builder: (context, isHapticsEnabled) => AccountHorizontalTile.sSwitch(
            iconPath: AppConstants.assets.icons.cdLinear,
            title: context
                .tr(LocaleKeys.account_section_preferences_items_haptics),
            onTap: context.read<UserPreferencesCubit>().toggleIsHapticsEnabled,
            switchValue: isHapticsEnabled,
          ),
        ),
      ].insertBetween(const AccountItemsDivider()),
    );
  }

  Widget _buildMoreSection(BuildContext context) {
    return AccountSection(
      verticalSpacing: 12,
      title: context.tr(LocaleKeys.account_section_more_title),
      children: [
        AccountHorizontalTile.more(
          onTap: () => _onAboutAppTap(context),
          iconPath: AppConstants.assets.icons.mobileLinear,
          title: context.tr(LocaleKeys.account_section_more_items_about_app),
        ),
        AccountHorizontalTile.more(
          onTap: () => LauncherUtil.launchDenweeLanding(context),
          iconPath: AppConstants.assets.icons.noteLinear,
          title: context.tr(LocaleKeys.account_section_more_items_privacy_terms),
        ),
        AccountHorizontalTile.more(
          onTap: () => LauncherUtil.launchSupportEmail(
            context,
            errorSnackbarPos: SnackBarPosition.bottom,
          ),
          iconPath: AppConstants.assets.icons.messageQuestionLinear,
          title: context.tr(LocaleKeys.account_section_more_items_contact_support),
        ),
      ].insertBetween(const AccountItemsDivider()),
    );
  }

  void _onProfileTap(BuildContext context) async {
    if (getIt<AuthCubit>().state.isAuthenticated) {
      context.restorablePushNamedArgs(AccountRoutes.profile);
    } else {
      final args = AuthenticationPageArgs(
        initialRoute: AuthenticationRoutes.register,
      );
      context.pushNamedArgs(
        Routes.authentication,
        args: args.toJson(),
        rootNavigator: true,
      );
    }
  }

  void _onEditInterests(BuildContext context) async {
    final currentSelectedInterests = getIt<UserPreferencesCubit>().state.preferences.interests;
    final List<UserInterest>? selectedInterests = await context.pushNamedArgs(
      Routes.selectInterests,
      args: currentSelectedInterests,
      rootNavigator: true,
    );
    if (selectedInterests != null) {
      getIt<UserPreferencesCubit>().changeInterests(selectedInterests);
    }
  }

  void _onToggleNotificationsEnabled(BuildContext context) async {
    if (!getIt<UserPreferencesCubit>().state.preferences.notifications.isEnabled) {
      _promptDelayedNotificationsPermission();
    }
    getIt<UserPreferencesCubit>().toggleIsNotificationsEnabled();
  }

  void _onChangeLanguageTap(BuildContext context) {
    context.restorablePushNamedArgs(AccountRoutes.changeLanguage);
  }

  void _onAboutAppTap(BuildContext context) {
    context.restorablePushNamedArgs(AccountRoutes.aboutApp);
  }

  void _promptDelayedNotificationsPermission() {
    Future.delayed(CustomAnimationDurations.ultraLow, () {
      getIt<PermissionsCubit>().forceCheckNotifications().then((status) {
        _showNotificationsPermissionDialog(context, status);
      });
    });
  }

  void _showNotificationsPermissionDialog(BuildContext context, AppPermissionStatus status) async {
    if (status.isAnyGranted) return;

    final isForcedToSettings = status.isDeniedForever;
    final result = await AppDialogs.showGrantPermissionDialog(
      context,
      type: AppPermissionType.notifications,
      isForcedSettings: isForcedToSettings,
    );
    if (result == true) {
      if (isForcedToSettings) return AppSettings.openAppSettings(type: AppSettingsType.notification);
      getIt<PermissionsCubit>().forceCheckNotifications(request: true);
    }
  }

  void _onChangeNotificationTime() async {
    final initialTime = getIt<UserPreferencesCubit>().state.preferences.notifications.time;
    final time = await AppDialogs.showSelectNotificationTimeDialog(
      context,
      initialTime: initialTime,
    );
    if (time != null) {
      getIt<UserPreferencesCubit>().changeNotificationTime(time);
      _promptDelayedNotificationsPermission();
    }
  }
}
