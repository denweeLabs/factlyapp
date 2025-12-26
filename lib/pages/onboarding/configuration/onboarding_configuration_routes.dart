// ignore_for_file: prefer_function_declarations_over_variables

import 'package:denwee/core/ui/router/page_routes_builders/fade_slideup_page_route_builder.dart';
import 'package:denwee/pages/onboarding/configuration/select_interests/select_interests_page.dart';
import 'package:denwee/pages/onboarding/configuration/select_theme_coloration/select_theme_coloration_page.dart';
import 'package:flutter/material.dart';

class OnboardingConfigurationRoutes {
  static const selectInterests = SelectInterestsPage.routeName;
  static const selectThemeColoration = SelectThemeColorationPage.routeName;
}

final RouteFactory onboardingRouteFactory = (RouteSettings settings) {
  switch (settings.name) {
    case OnboardingConfigurationRoutes.selectInterests:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const SelectInterestsPage.onboarding(),
      );

    case OnboardingConfigurationRoutes.selectThemeColoration:
      return FadeSlideupPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => const SelectThemeColorationPage(),
      );

    default:
      throw 'Onboarding Unknown route ${settings.name}';
  }
};
