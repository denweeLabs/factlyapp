// ignore_for_file: use_build_context_synchronously

import 'package:denwee/core/ui/bloc/connectivity_cubit/connectivity_cubit.dart';
import 'package:denwee/core/ui/bloc/permissions_cubit/permissions_cubit.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/router/root_router.dart';
import 'package:denwee/core/ui/theme/app_colors.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/elastic_in.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in_right.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/misc/route_observer_scope.dart';
import 'package:denwee/core/ui/widget/buttons/back_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/app_solid_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/app_text_button_widget.dart';
import 'package:denwee/core/ui/widget/common/common_pop_scope_widget.dart';
import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:denwee/pages/authentication/args/authentication_action_result.dart';
import 'package:denwee/pages/authentication/args/authentication_page_args.dart';
import 'package:denwee/pages/authentication/ui/authentication_routes.dart';
import 'package:denwee/pages/onboarding/configuration/cubit/onboarding_configuration_cubit.dart';
import 'package:denwee/pages/onboarding/configuration/onboarding_configuration_listener.dart';
import 'package:denwee/pages/onboarding/configuration/onboarding_configuration_routes.dart';
import 'package:denwee/pages/onboarding/configuration/select_interests/cubit/select_interests_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class OnboardingConfigurationPage extends StatefulWidget {
  const OnboardingConfigurationPage({super.key});

  static const routeName = 'OnboardingConfigurationPage';

  static double backTopPadding(BuildContext context) => context.topPadding;
  static double contentTopPadding(BuildContext context) => backTopPadding(context) + 48.h;

  static final actionButtonHeight = 60.h;
  static double contentBottomPadding(BuildContext context) =>
      AppConstants.style.padding.onboardingBottomCtaPadding(context) + actionButtonHeight;

  @override
  State<OnboardingConfigurationPage> createState() => _OnboardingConfigurationPageState();
}

class _OnboardingConfigurationPageState extends State<OnboardingConfigurationPage> with RestorationMixin {
  late final RestorableRouteFuture<AuthorizationActionResult?> authenticationRoute;
  late final observer = TrackingRouteObserver<ModalRoute<void>>();

  @override
  String? get restorationId => 'onboarding_configuration_page';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(authenticationRoute, 'authentication_route');
  }

  @override
  void initState() {
    super.initState();
    authenticationRoute = RestorableRouteFuture<AuthorizationActionResult?>(
      navigatorFinder: (context) => Navigator.of(context, rootNavigator: true),
      onPresent: (navigator, args) => navigator.restorablePushNamed(Routes.authentication, arguments: args),
      onComplete: _onAuthenticationCompleted,
    );
  }

  @override
  void dispose() {
    super.dispose();
    authenticationRoute.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingConfigurationListener(
      onConfigured: _completeOnboarding,
      child: CommonPopScope(
        onWillPop: _goBack,
        child: Stack(
          children: [

            // Pages
            Positioned.fill(
              child: RouteObserverScope(
                observer: observer,
                builder: (context, observer) => Navigator(
                  observers: [
                    observer,
                    _StepsObserver(
                      onChanged: context.read<OnboardingConfigurationCubit>().setStep,
                    ),
                  ],
                  initialRoute: ConfigurationStep.selectInterests.route,
                  key: context.read<OnboardingConfigurationCubit>().navigatorKey,
                  onGenerateRoute: onboardingRouteFactory,
                ),
              ),
            ),

            // Bottom action button
            Positioned(
              left: 24.w,
              right: 24.w,
              bottom: AppConstants.style.padding.onboardingBottomCtaPadding(context),
              child: Row(
                children: [
                  SizedBox(
                    width: 0.48.sw,
                    child: BlocBuilder<OnboardingConfigurationCubit, OnboardingConfigurationState>(builder: (context, state) {
                      return AppTextButton(
                        onTap: _onHaveAnAccount,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        textColor: state.step.haveAccountTextColor(context),
                        text: context.tr(LocaleKeys.welcome_have_an_account).toUpperCase(),
                      ).autoFadeIn(sequencePos: 3);
                    }),
                  ),
                  // 12.horizontalSpace,
                  Expanded(
                    child: BlocBuilder<OnboardingConfigurationCubit, OnboardingConfigurationState>(builder: (context, state) {
                      return AppSolidButton(
                        isBusy: state.submissionInProgress,
                        buttonHeight: OnboardingConfigurationPage.actionButtonHeight,
                        backgroundColors: state.step.bottomActionButtonBackgroundColor(context),
                        textColor: state.step.bottomActionButtonTextColor(context),
                        shadowColor: state.step.bottomActionButtonShadowColor(context),
                        text: state.step.bottomActionButtonText(context),
                        onTap: () => _onBottomActionButtonTap(state.step),
                        displayIcon: !state.submissionInProgress &&
                                state.submissionSuccess
                            ? AppConstants.assets.icons.checkmarkLinear
                            : null,
                        isShimmering: true,
                        isBubbles: true,
                      ).autoElasticIn(sequencePos: 4);
                    }),
                  ),
                ],
              ),
            ),

            // Back button
            Positioned(
              left: 0.0,
              top: OnboardingConfigurationPage.backTopPadding(context),
              child: BlocBuilder<OnboardingConfigurationCubit, OnboardingConfigurationState>(builder: (context, state) {
                return AppBackButton(
                  onTap: _goBack,
                  color: AppColors.icon[ThemeType.dark],
                ).autoFadeInRight(
                  slideFrom: 100,
                  animate: state.step.showBackButton,
                  reverseDuration: CustomAnimationDurations.low,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _goBack() async {
    final cubit = context.read<OnboardingConfigurationCubit>();
    await cubit.navigatorKey.currentState?.maybePop();
  }

  void _onBottomActionButtonTap(ConfigurationStep step) {
    switch (step) {
      case ConfigurationStep.selectInterests:
        return _validateOnSelectInterests();
      case ConfigurationStep.selectThemeColoration:
        return _validateOnThemeColoration();
    }
  }

  void _validateOnSelectInterests() {
    final cubit = context.read<SelectInterestsCubit>();
    if (cubit.state.selectedInterests.isEmpty) {
      cubit.validateInterests();
      HapticUtil.medium();
    } else {
      context
          .read<OnboardingConfigurationCubit>()
          .navigatorKey
          .currentState
          ?.pushNamed(ConfigurationStep.selectThemeColoration.route);
    }
  }

  void _validateOnThemeColoration() async {
    if (!context.read<ConnectivityCubit>().state.isNetworkAccess) {
      return AppDialogs.showNoConnectionSnackbar();
    }
    final preferences = UserPreferences.fromOnboarding(
      selectedInterests: context.read<SelectInterestsCubit>().state.selectedInterests,
      selectedTheme: getIt<UserPreferencesCubit>().state.preferences.theme,
      selectedLocale: context.locale,
    );
    await getIt<PermissionsCubit>().forceCheckNotifications(request: true);
    context.read<OnboardingConfigurationCubit>().submitData(preferences);
  }

  void _onHaveAnAccount() {
    final args = AuthenticationPageArgs(
      initialRoute: AuthenticationRoutes.login,
      hideRegisterButton: true,
    );
    authenticationRoute.push(argsToJson: args.toJson);
  }

  void _onAuthenticationCompleted(AuthorizationActionResult? result) {
    if (result != null) {
      context.restorablePushReplacementNamedArgs(
        Routes.homeFromAuthentication,
        rootNavigator: true,
      );
    }
  }

  void _completeOnboarding() async {
    context.read<UserPreferencesCubit>().changeInterests(
          context.read<SelectInterestsCubit>().state.selectedInterests,
        );
    await Future.delayed(const Duration(milliseconds: 400));
    context.restorablePushReplacementNamedArgs(
      Routes.homeFromOnboarding,
      rootNavigator: true,
    );
  }
}

class _StepsObserver extends NavigatorObserver {
  final void Function(ConfigurationStep) onChanged;

  _StepsObserver({required this.onChanged});

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    setStepFromRoute(previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    setStepFromRoute(route);
  }

  void setStepFromRoute(Route? route) {
    final newStep = ConfigurationStep.fromRouteSettings(route?.settings);
    onChanged(newStep);
  }
}
