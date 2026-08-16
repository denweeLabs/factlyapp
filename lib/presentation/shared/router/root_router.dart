// ignore_for_file: prefer_function_declarations_over_variables

import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/misc/domain/restorable_states/custom_serializer.dart';
import 'package:denwee/presentation/shared/router/page_routes_builders/circular_reveal_page_route_builder.dart';
import 'package:denwee/presentation/shared/router/page_routes_builders/cross_fade_page_route_builder.dart';
import 'package:denwee/presentation/shared/router/page_routes_builders/fade_slideup_page_route_builder.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/page/available_backgrounds/available_backgrounds_page.dart';
import 'package:denwee/presentation/page/background_edit/background_edit_page.dart';
import 'package:denwee/presentation/bloc/backgrounds/background_edit_cubit.dart';
import 'package:denwee/presentation/page/account/change_password/change_password_page.dart';
import 'package:denwee/core/auth/domain/entity/authentication_action_result.dart';
import 'package:denwee/presentation/page/authentication/args/authentication_page_args.dart';
import 'package:denwee/presentation/page/authentication/authentication_page.dart';
import 'package:denwee/presentation/bloc/auth/authentication_page_cubit.dart';
import 'package:denwee/presentation/bloc/auth/login_cubit.dart';
import 'package:denwee/presentation/bloc/auth/register_cubit.dart';
import 'package:denwee/presentation/page/reset_password/reset_password_page.dart';
import 'package:denwee/presentation/page/reset_password/reset_password_page_args.dart';
import 'package:denwee/presentation/bloc/change_password/change_password_cubit.dart';
import 'package:denwee/presentation/page/account/account_base_page.dart';
import 'package:denwee/presentation/page/fact_details/args/fact_details_page_args.dart';
import 'package:denwee/presentation/bloc/facts/fact_explanation_cubit.dart';
import 'package:denwee/presentation/page/fact_details/fact_details_page.dart';
import 'package:denwee/presentation/page/home/home_page.dart';
import 'package:denwee/presentation/bloc/onboarding/onboarding_configuration_cubit.dart';
import 'package:denwee/presentation/page/onboarding/configuration/onboarding_configuration_page.dart';
import 'package:denwee/presentation/bloc/onboarding/select_interests_cubit.dart';
import 'package:denwee/presentation/page/onboarding/configuration/select_interests/select_interests_page.dart';
import 'package:denwee/presentation/bloc/onboarding/select_notification_time_cubit.dart';
import 'package:denwee/presentation/page/onboarding/welcome/welcome_page.dart';
import 'package:denwee/presentation/page/premium_paywall/premium_paywall_page.dart';
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
  static const homeCircleReveal = HomePage.routeNameCircleReveal;
  static const homeFromLogin = HomePage.routeNameFromLogin;
  static const homeCrossFade = HomePage.routeNameCrossFade;
  static const account = AccountBasePage.routeName;
  static const authentication = AuthenticationPage.routeName;
  static const selectInterests = SelectInterestsPage.routeName;
  static const factDetails = FactDetailsPage.routeName;
  static const changePassword = ChangePasswordPage.routeName;
  static const resetPassword = ResetPasswordPage.routeName;
  static const premiumPaywall = PremiumPaywallPage.routeName;
  static const availableBackgrounds = AvailableBackgroundsPage.routeName;
  static const backgroundEdit = BackgroundEditPage.routeName;
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
            BlocProvider(create: (_) => getIt<SelectNotificationTimeCubit>()),
          ],
          child: const OnboardingConfigurationPage(),
        ),
      );

    case Routes.home:
      return FadeSlideupPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => const HomePage(),
      );

    case Routes.homeCircleReveal:
      return CircularRevealPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => const HomePage(checkUserData: false),
      );

    case Routes.homeFromLogin:
      return FadeSlideupPageRouteBuilder<void>(
        settings: settings,
        slideBegin: -0.06,
        duration: CustomAnimationDurations.ultraLow,
        fadeCurve: Curves.fastEaseInToSlowEaseOut,
        slideCurve: Curves.ease,
        builder: (_) => const HomePage(checkUserData: false),
      );

    case Routes.homeCrossFade:
      return CrossFadePageRouteBuilder<void>(
        settings: settings,
        builder: (_) => const HomePage(checkUserData: false),
      );

    case Routes.account:
      return FadeSlideupPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => const AccountBasePage(),
      );

    case Routes.authentication:
      final args =
          CustomSerializer(
            settings.arguments,
          ).getArguments(AuthenticationPageArgs.fromJson) ??
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
      final args = CustomSerializer(
        settings.arguments,
      ).getArguments(FactDetailsPageArgs.fromJson)!;
      return CircularRevealPageRouteBuilder(
        settings: settings,
        builder: (_) => BlocProvider(
          create: (_) => getIt<FactExplanationCubit>(param1: args.fact),
          child: FactDetailsPage(fact: args.fact),
        ),
      );

    case Routes.resetPassword:
      final args = CustomSerializer(
        settings.arguments,
      ).getArguments(ResetPasswordPageArgs.fromJson)!;
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

    case Routes.premiumPaywall:
      return FadeSlideupPageRouteBuilder(
        settings: settings,
        builder: (_) => PremiumPaywallPage(
          source: PremiumPaywallPage.sourceFromArgs(settings.arguments),
        ),
      );

    case Routes.backgroundEdit:
      final background = settings.arguments as AvailableBackground;

      return CircularRevealPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => BlocProvider(
          create: (_) => getIt<BackgroundEditCubit>(param1: background.style),
          child: BackgroundEditPage(background: background),
        ),
      );

    case Routes.availableBackgrounds:
      final popToHome = settings.arguments as bool?;

      return FadeSlideupPageRouteBuilder<void>(
        settings: settings,
        builder: (_) => popToHome == true
            ? const AvailableBackgroundsPage(popToHome: true)
            : const AvailableBackgroundsPage(),
      );

    default:
      throw 'Root Unknown route ${settings.name}';
  }
};
