// ignore_for_file: prefer_function_declarations_over_variables

import 'package:denwee/presentation/shared/router/page_routes_builders/fade_slideup_page_route_builder.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/page/account/about_app/about_app_page.dart';
import 'package:denwee/presentation/page/account/change_language/change_language_page.dart';
import 'package:denwee/presentation/page/account/change_password/change_password_page.dart';
import 'package:denwee/presentation/bloc/change_password/change_password_cubit.dart';
import 'package:denwee/presentation/page/account/my_archive/my_archive_page.dart';
import 'package:denwee/presentation/bloc/edit_profile/edit_profile_cubit.dart';
import 'package:denwee/presentation/page/account/profile/profile_page.dart';
import 'package:denwee/presentation/page/account/account/account_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountRoutes {
  static const account = AccountPage.routeName;
  static const profile = ProfilePage.routeName;
  static const changePassword = ChangePasswordPage.routeName;
  static const changeLanguage = ChangeLanguagePage.routeName;
  static const myArchive = MyArchivePage.routeName;
  static const aboutApp = AboutAppPage.routeName;
}

final RouteFactory accountRouteFactory = (RouteSettings settings) {
  switch (settings.name) {
    case AccountRoutes.account:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const AccountPage(),
      );

    case AccountRoutes.profile:
      return FadeSlideupPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => BlocProvider(
          create: (_) => getIt<EditProfileCubit>(),
          child: const ProfilePage(),
        ),
      );

    case AccountRoutes.changePassword:
      return FadeSlideupPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => BlocProvider(
          create: (_) => getIt<ChangePasswordCubit>(),
          child: const ChangePasswordPage(),
        ),
      );

    case AccountRoutes.changeLanguage:
      return FadeSlideupPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => const ChangeLanguagePage(),
      );

    case AccountRoutes.myArchive:
      return FadeSlideupPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => const MyArchivePage(),
      );

    case AccountRoutes.aboutApp:
      return FadeSlideupPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => const AboutAppPage(),
      );

    default:
      throw 'Account Unknown route ${settings.name}';
  }
};
