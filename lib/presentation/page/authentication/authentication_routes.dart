// ignore_for_file: prefer_function_declarations_over_variables

import 'package:denwee/presentation/shared/router/page_routes_builders/fade_slideup_page_route_builder.dart';
import 'package:denwee/presentation/page/authentication/args/authentication_page_args.dart';
import 'package:denwee/presentation/page/authentication/login/login_page.dart';
import 'package:denwee/presentation/page/authentication/register/register_page.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationRoutes {
  static const login = LoginPage.routeName;
  static const register = RegisterPage.routeName;
}

final Route<dynamic>? Function(RouteSettings, AuthenticationPageArgs) authRouteFactory = (settings, args) {
  switch (settings.name) {
    case AuthenticationRoutes.login:
      return FadeSlideupPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => LoginPage(hideRegisterButton: args.hideRegisterButton),
      );

    case AuthenticationRoutes.register:
      return FadeSlideupPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => RegisterPage(hideLoginButton: args.hideLoginButton),
      );

    default:
      throw 'Auth Unknown route ${settings.name}';
  }
};
