// ignore_for_file: prefer_function_declarations_over_variables

import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/misc/domain/restorable_states/custom_serializer.dart';
import 'package:denwee/core/ui/router/page_routes_builders/circular_reveal_page_route_builder.dart';
import 'package:denwee/core/ui/router/page_routes_builders/cross_fade_page_route_builder.dart';
import 'package:denwee/core/ui/router/page_routes_builders/fade_slideup_page_route_builder.dart';
import 'package:denwee/core/ui/router/page_routes_builders/slideup_clipath_page_route_builder.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/pages/account/change_password/change_password_page.dart';
import 'package:denwee/pages/authentication/args/authentication_action_result.dart';
import 'package:denwee/pages/authentication/args/authentication_page_args.dart';
import 'package:denwee/pages/authentication/ui/authentication_page.dart';
import 'package:denwee/pages/authentication/ui/cubit/authentication_page_cubit.dart';
import 'package:denwee/pages/authentication/ui/login/cubit/login_cubit.dart';
import 'package:denwee/pages/authentication/ui/register/cubit/register_cubit.dart';
import 'package:denwee/pages/authentication/ui/reset_password/reset_password_page.dart';
import 'package:denwee/pages/authentication/ui/reset_password/reset_password_page_args.dart';
import 'package:denwee/pages/account/change_password/cubit/change_password_cubit.dart';
import 'package:denwee/pages/account/ui/account_base_page.dart';
import 'package:denwee/pages/fact_details/domain/args/fact_details_page_args.dart';
import 'package:denwee/pages/fact_details/ui/cubit/fact_explanation_cubit.dart';
import 'package:denwee/pages/fact_details/ui/fact_details_page.dart';
import 'package:denwee/pages/home/ui/home_page.dart';
import 'package:denwee/pages/onboarding/configuration/cubit/onboarding_configuration_cubit.dart';
import 'package:denwee/pages/onboarding/configuration/onboarding_configuration_page.dart';
import 'package:denwee/pages/onboarding/configuration/select_interests/cubit/select_interests_cubit.dart';
import 'package:denwee/pages/onboarding/configuration/select_interests/select_interests_page.dart';
import 'package:denwee/pages/onboarding/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RootRouterData {
  final key = GlobalKey<NavigatorState>();
  BuildContext get context => key.currentState!.context;
  BuildContext get overlayContext => key.currentState!.overlay!.context;
}

class Routes {
  static const welcome = WelcomePage.routeName;
  static const onboarding = OnboardingConfigurationPage.routeName;
  static const home = HomePage.routeName;
  static const homeFromOnboarding = HomePage.routeNameFromOnboarding;
  static const homeFromAuthentication = HomePage.routeNameFromAuthentication;
  static const account = AccountBasePage.routeName;
  static const authentication = AuthenticationPage.routeName;
  static const selectInterests = SelectInterestsPage.routeName;
  static const factDetails = FactDetailsPage.routeName;
  static const changePassword = ChangePasswordPage.routeName;
  static const resetPassword = ResetPasswordPage.routeName;
}

final RouteFactory rootRouteFactory = (RouteSettings settings) {
  switch (settings.name) {
    case Routes.welcome:
      return FadeSlideupPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => const WelcomePage(),
      );

    case Routes.onboarding:
      return CrossFadePageRouteBuilder<void>(
        settings: settings,
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<OnboardingConfigurationCubit>()),
            BlocProvider(create: (_) => getIt<SelectInterestsCubit>()),
          ],
          child: const OnboardingConfigurationPage(),
        ),
      );

    case Routes.home:
      return FadeSlideupPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => const HomePage(),
      );

    case Routes.homeFromOnboarding:
      return CircularRevealPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => const HomePage(checkUserData: false),
      );

    case Routes.homeFromAuthentication:
      return SlideupClipPathPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => const HomePage(checkUserData: false),
      );

    case Routes.account:
      return FadeSlideupPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => const AccountBasePage(),
      );

    case Routes.authentication:
      final args = CustomSerializer(settings.arguments) .getArguments(AuthenticationPageArgs.fromJson) ??
          const AuthenticationPageArgs();
      return FadeSlideupPageRouteBuilder<AuthorizationActionResult?>(
        settings: settings,
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<AuthenticationPageCubit>()),
            BlocProvider(create: (_) => getIt<LoginCubit>()),
            BlocProvider(create: (_) => getIt<RegisterCubit>()),
          ],
          child: AuthenticationPage(args: args),
        ),
      );

    case Routes.selectInterests:
      final args = settings.arguments as List<UserInterest>?;
      return FadeSlideupPageRouteBuilder<List<UserInterest>?>(
        settings: settings,
        builder: (_) => BlocProvider(
          create: (_) => getIt<SelectInterestsCubit>(param1: args),
          child: const SelectInterestsPage(isOnboarding: false),
        ),
      );

    case Routes.factDetails:
      final args = CustomSerializer(settings.arguments).getArguments(FactDetailsPageArgs.fromJson)!;
      return FadeSlideupPageRouteBuilder(
        settings: settings,
        builder: (_) => BlocProvider(
          create: (_) => getIt<FactExplanationCubit>(param1: args.fact),
          child: FactDetailsPage(fact: args.fact),
        ),
      );

    case Routes.resetPassword:
      final args = CustomSerializer(settings.arguments)
          .getArguments(ResetPasswordPageArgs.fromJson)!;
      return CrossFadePageRouteBuilder<void>(
        settings: settings,
        builder: (_) => BlocProvider(
          create: (_) => getIt<ChangePasswordCubit>(),
          child: ResetPasswordPage(args: args),
        ),
      );

    case Routes.changePassword:
      return FadeSlideupPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => BlocProvider(
          create: (_) => getIt<ChangePasswordCubit>(),
          child: const ChangePasswordPage(),
        ),
      );

    default:
      throw 'Root Unknown route ${settings.name}';
  }
};
