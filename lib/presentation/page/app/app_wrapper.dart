// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:denwee/core/facts/domain/util/share/fact_shares_storage.dart';
import 'package:denwee/core/misc/data/storage/common_storage.dart';
import 'package:denwee/presentation/bloc/auth/auth_cubit.dart';
import 'package:denwee/presentation/bloc/permissions/permissions_cubit.dart';
import 'package:denwee/presentation/bloc/subscriptions/user_subscription_cubit.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/router/root_router.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/page/authentication/args/authentication_page_args.dart';
import 'package:denwee/presentation/page/authentication/authentication_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils.dart';
import 'package:denwee/core/analytics/domain/entity/paywall_source.dart';
import 'package:denwee/presentation/page/premium_paywall/premium_paywall_page.dart';

class DenweeAppWrapper extends StatefulWidget {
  const DenweeAppWrapper({super.key, required this.child});

  final Widget child;

  @override
  State<DenweeAppWrapper> createState() => _DenweeAppWrapperState();
}

class _DenweeAppWrapperState extends State<DenweeAppWrapper> {
  static const requestNotificationsPermissionDelay =
      Duration(milliseconds: 2000);
  static const promptAuthenticationDelay =
      Duration(milliseconds: 600);
  static const promptPaywallDelay =
      Duration(milliseconds: 600);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAppLaunch();
    });
  }

  void checkAppLaunch() async {
    final commonStorage = getIt<CommonStorage>();

    // constantly increase local app enter counter
    final enterCounter = await commonStorage.increaseAppLaunchCounter();
    debugPrint('appEnterCounter: $enterCounter');

    // if very first launch - apply system language
    if (enterCounter <= 1) {
      final systemLocale = PlatformDispatcher.instance.locale.onlyLangCode;
      final currentLocale = getIt<UserPreferencesCubit>().state.preferences.language.onlyLangCode;

      if (currentLocale != systemLocale) {
        final context = getIt<RootRouterData>().context;
        final changeLocale = !context.supportedLocales.contains(systemLocale)
            ? AppConstants.config.fallbackLocale
            : systemLocale;
        getIt<UserPreferencesCubit>().changeLanguage(changeLocale);
      }
    }

    else {
      promptOnAppEnter(enterCounter);
    }

    // cleanup old temporary fact shares
    getIt<FactSharesStorage>().clear();
  }

  void promptOnAppEnter(int enterCounter) {
    final config = AppConstants.config;
    bool isDue(int eachEnter) => enterCounter % eachEnter == 0;

    final authState = getIt<AuthCubit>().state;
    final isSubscribed = getIt<UserSubscriptionCubit>().state.isSubscribed;

    if (authState.isAnonymous && isDue(config.promptAuthenticationEachEnter)) {
      return promptAuthentication();
    }

    if (!isSubscribed && authState.isAnonymousOrAuthenticated && isDue(config.promptPaywallEachEnter)) {
      return promptPaywall();
    }

    if (authState.isAnonymousOrAuthenticated && isDue(config.promptNotificationPermissionEachEnter)) {
      return promptNotificationsPermission();
    }
  }

  void promptAuthentication() {
    Future.delayed(promptAuthenticationDelay, () {
      final context = getIt<RootRouterData>().context;
      final args = AuthenticationPageArgs(initialRoute: AuthenticationRoutes.register);
      context.pushNamedArgs(Routes.authentication, args: args.toJson(), rootNavigator: true);
    });
  }

  void promptPaywall() {
    Future.delayed(promptPaywallDelay, () {
      if (getIt<UserSubscriptionCubit>().state.isSubscribed) return;
      final context = getIt<RootRouterData>().context;
      context.restorablePushNamedArgs(
        Routes.premiumPaywall,
        rootNavigator: true,
        argsToJson: () => PremiumPaywallPage.args(PaywallSource.appEnterPrompt),
      );
    });
  }

  void promptNotificationsPermission() {
    Future.delayed(requestNotificationsPermissionDelay, () {
      getIt<PermissionsCubit>().forceCheckNotifications(request: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
