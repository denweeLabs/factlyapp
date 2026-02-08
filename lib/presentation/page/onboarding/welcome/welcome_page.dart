import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/elastic_in.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in.dart';
import 'package:denwee/presentation/widget/shared/buttons/app_solid_button_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/app_text_button_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/seal_in_square_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/core/auth/domain/entity/authentication_action_result.dart';
import 'package:denwee/presentation/page/authentication/args/authentication_page_args.dart';
import 'package:denwee/presentation/page/authentication/authentication_routes.dart';
import 'package:denwee/presentation/shared/router/root_router.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/widget/shared/common/common_scaffold_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  static const routeName = 'WelcomePage';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with RestorationMixin {
  late final RestorableRouteFuture<void> onboardingConfigurationRoute;
  late final RestorableRouteFuture<AuthorizationActionResult?> authenticationRoute;

  @override
  String? get restorationId => 'welcome_page';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(onboardingConfigurationRoute, 'onboarding_configuration_route');
    registerForRestoration(authenticationRoute, 'authentication_route');
  }

  @override
  void initState() {
    super.initState();
    onboardingConfigurationRoute = RestorableRouteFuture<void>(
      navigatorFinder: (context) => Navigator.of(context, rootNavigator: true),
      onPresent: (navigator, _) => navigator.restorablePushReplacementNamed(Routes.onboarding),
    );
    authenticationRoute = RestorableRouteFuture<AuthorizationActionResult?>(
      navigatorFinder: (context) => Navigator.of(context, rootNavigator: true),
      onPresent: (navigator, args) => navigator.restorablePushNamed(Routes.authentication, arguments: args),
      onComplete: _onAuthenticationCompleted,
    );
  }

  @override
  void dispose() {
    super.dispose();
    onboardingConfigurationRoute.dispose();
    authenticationRoute.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: context.topPadding + 96.h,
          bottom: context.bottomPadding + 48.h,
        ),
        child: Column(
          children: [
            Center(
              child: RepaintBoundary(
                child: const SealInSquare().autoElasticIn(
                  sequencePos: 1,
                  scaleCurve: Curves.easeOutBack,
                ),
              ),
            ),
            32.verticalSpace,
            Text(
              context.tr(LocaleKeys.welcome_title),
              style: h0.copyWith(
                color: context.textColor,
                fontFamily: AppConstants.style.textStyle.primaryFontFamily,
              ),
              textAlign: TextAlign.center,
            ).autoFadeIn(sequencePos: 6),
            18.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                context.tr(LocaleKeys.welcome_subtitle),
                style: bodyL.copyWith(
                  color: context.textColorTernary,
                  fontWeight: FontWeight.w700,
                  fontFamily: getIt<UserPreferencesCubit>().state.whenLanguage(
                    en: () => AppConstants.style.textStyle.primaryFontFamily,
                    ru: () => AppConstants.style.textStyle.secondaryFontFamiliy,
                  ),
                ),
                textAlign: TextAlign.center,
              ).autoFadeIn(sequencePos: 8),
            ),
            const Spacer(),
            FractionallySizedBox(
              widthFactor: 0.6,
              child: AppSolidButton(
                onTap: _onBegin,
                text: context.tr(LocaleKeys.welcome_begin_cta),
                buttonHeight: 66.h,
                isShimmering: true,
                isBubbles: true,
              ).autoElasticIn(sequencePos: 9),
            ),
            24.verticalSpace,
            AppTextButton(
              onTap: _onHaveAnAccount,
              text: context
                  .tr(LocaleKeys.welcome_have_an_account)
                  .toUpperCase(),
              textColor: context.textColor.withValues(alpha: 0.2),
            ).autoElasticIn(sequencePos: 10),
          ],
        ),
      ),
    );
  }

  void _onBegin() {
    onboardingConfigurationRoute.push();
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
