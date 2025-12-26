// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:denwee/core/misc/data/storage/common_storage.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:denwee/core/ui/bloc/permissions_cubit/permissions_cubit.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/router/root_router.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/pages/authentication/args/authentication_page_args.dart';
import 'package:denwee/pages/authentication/ui/authentication_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

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

    // check notifications permission on 5th & 10th enter of the app
    else if (getIt<AuthCubit>().state.isAnonymousOrAuthenticated && enterCounter == 5 || enterCounter == 10) {
      Future.delayed(requestNotificationsPermissionDelay, () {
        getIt<PermissionsCubit>().forceCheckNotifications(request: true);
      });
    }

    // check if time to prompt user to authenticate
    if (getIt<AuthCubit>().state.isAnonymous && enterCounter % AppConstants.config.promptAuthenticationEachEnter == 0) {
      Future.delayed(promptAuthenticationDelay, () {
        final context = getIt<RootRouterData>().context;
        final args = AuthenticationPageArgs(initialRoute: AuthenticationRoutes.register);
        context.pushNamedArgs(Routes.authentication, args: args.toJson(), rootNavigator: true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
