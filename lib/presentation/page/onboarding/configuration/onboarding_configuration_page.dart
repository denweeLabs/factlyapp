import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/router/root_router.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/elastic_in.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in_right.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/animations/misc/route_observer_scope.dart';
import 'package:denwee/presentation/widget/shared/buttons/back_button_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/app_solid_button_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/app_text_button_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_pop_scope_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/core/auth/domain/entity/authentication_action_result.dart';
import 'package:denwee/presentation/page/authentication/args/authentication_page_args.dart';
import 'package:denwee/presentation/page/authentication/authentication_routes.dart';
import 'package:denwee/presentation/bloc/onboarding/onboarding_configuration_cubit.dart';
import 'package:denwee/presentation/page/onboarding/configuration/onboarding_configuration_handlers.dart';
import 'package:denwee/presentation/page/onboarding/configuration/onboarding_configuration_listener.dart';
import 'package:denwee/presentation/page/onboarding/configuration/onboarding_configuration_routes.dart';
import 'package:denwee/presentation/page/onboarding/configuration/onboarding_configuration_step.dart';
import 'package:denwee/presentation/page/onboarding/configuration/onboarding_configuration_step_observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class OnboardingConfigurationPage extends StatefulWidget {
  const OnboardingConfigurationPage({super.key});

  static const routeName = 'OnboardingConfigurationPage';

  static double backTopPadding(BuildContext context) => context.topPadding;
  static double contentTopPadding(BuildContext context) =>
      backTopPadding(context) + 44.h;

  static final actionButtonHeight = 66.h;
  static double contentBottomPadding(BuildContext context) =>
      AppConstants.style.padding.onboardingBottomCtaPadding(context) +
      32.h +
      28.h +
      actionButtonHeight;

  @override
  State<OnboardingConfigurationPage> createState() => _OnboardingConfigurationPageState();
}

class _OnboardingConfigurationPageState extends State<OnboardingConfigurationPage>
    with RestorationMixin, OnboardingConfigurationHandlers {

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
      onConfigured: () => completeOnboarding(context),
      child: CommonPopScope(
        onWillPop: _goBack,
        child: Stack(
          children: [
            Positioned.fill(
              child: _buildPages(),
            ),
            Positioned(
              left: 24.w,
              right: 24.w,
              bottom: AppConstants.style.padding.onboardingBottomCtaPadding(context),
              child: _buildBottomButtons(),
            ),
            Positioned(
              left: 0.0,
              top: OnboardingConfigurationPage.backTopPadding(context),
              child: _buildBackButton(),
            ),
          ],
        ),
      ),
    );
  }

  RouteObserverScope _buildPages() {
    return RouteObserverScope(
      observer: observer,
      builder: (context, observer) => Navigator(
        observers: [
          observer,
          OnboardingConfigurationStepObserver(
            onChanged: context.read<OnboardingConfigurationCubit>().setStep,
          ),
        ],
        initialRoute: ConfigurationStep.selectInterests.route,
        key: context.read<OnboardingConfigurationCubit>().navigatorKey,
        onGenerateRoute: onboardingRouteFactory,
      ),
    );
  }

  Widget _buildBottomButtons() {
    return BlocBuilder<
      OnboardingConfigurationCubit,
      OnboardingConfigurationState
    >(
      builder: (context, state) {
        final isIcon =
            !state.submissionInProgress &&
            state.isSubmissionVisibilityForced &&
            state.submissionSuccess;

        final icon = isIcon ? AppConstants.assets.icons.checkmarkLinear : null;
        final isBusy = state.isSubmissionVisibilityForced && state.submissionInProgress;

        return Column(
          children: [
            SizedBox(
              width: 0.58.sw,
              child: AppSolidButton(
                isBusy: isBusy,
                isBubbles: true,
                isShimmering: true,
                displayIcon: icon,
                buttonHeight: OnboardingConfigurationPage.actionButtonHeight,
                backgroundColors: state.step.bottomActionButtonBackgroundColor(context),
                textColor: state.step.bottomActionButtonTextColor(context),
                shadowColor: state.step.bottomActionButtonShadowColor(context),
                text: state.step.bottomActionButtonText(context),
                onTap: () => _onBottomActionButtonTap(state.step),
              ).autoElasticIn(sequencePos: 4),
            ),
            AnimatedCrossFade(
              firstChild: Center(
                child: AppTextButton(
                  onTap: _onHaveAnAccount,
                  padding: EdgeInsets.only(top: 32.h),
                  textColor: state.step.haveAccountTextColor(context),
                  text: context.tr(LocaleKeys.welcome_have_an_account).toUpperCase(),
                ).autoFadeIn(sequencePos: 3),
              ),
              secondChild: Container(),
              duration: CustomAnimationDurations.lowMedium,
              firstCurve: Curves.linearToEaseOut,
              sizeCurve: Curves.fastEaseInToSlowEaseOut,
              crossFadeState: state.step.showHaveAccount
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ],
        );
      },
    );
  }

  Widget _buildBackButton() {
    return BlocBuilder<
      OnboardingConfigurationCubit,
      OnboardingConfigurationState
    >(
      builder: (context, state) =>
          AppBackButton(
            onTap: _goBack,
            color: state.step.backButtonColor(context),
          ).autoFadeInRight(
            slideFrom: 100,
            forceComplete: false,
            animate: state.step.showBackButton,
            reverseDuration: CustomAnimationDurations.low,
          ),
    );
  }

  void _goBack() {
    final cubit = context.read<OnboardingConfigurationCubit>();
    final currentStep = cubit.state.step;
    if (currentStep == ConfigurationStep.valuePrimer) {
      return validateValuePrimer(context);
    }
    cubit.navigatorKey.currentState?.maybePop();
  }

  void _onBottomActionButtonTap(ConfigurationStep step) {
    switch (step) {
      case ConfigurationStep.selectInterests: return validateSelectInterests(context);
      case ConfigurationStep.selectNotificationTime: return validateSelectNotificationTime(context);
      case ConfigurationStep.selectThemeColoration: return validateThemeColoration(context);
      case ConfigurationStep.valuePrimer: return validateValuePrimer(context);
    }
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
        Routes.homeFromLogin,
        rootNavigator: true,
      );
    }
  }
}
