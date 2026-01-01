// ignore_for_file: use_build_context_synchronously

import 'package:denwee/core/auth/domain/use_case/on_logout_use_case.dart';
import 'package:denwee/core/subscriptions/domain/entity/premium_packages.dart';
import 'package:denwee/core/subscriptions/domain/failure/subscriptions_failure.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:denwee/core/ui/bloc/permissions_cubit/permissions_cubit.dart';
import 'package:denwee/core/ui/bloc/subscriptions_cubit/subscription_offerings_cubit.dart';
import 'package:denwee/core/ui/bloc/subscriptions_cubit/user_subscription_cubit.dart';
import 'package:denwee/core/ui/router/root_router.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/pages/authentication/args/authentication_page_args.dart';
import 'package:denwee/pages/authentication/ui/authentication_routes.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

mixin RootBlocListenersHandlers {
  var processingExpiredSession = false;

  void onAppResumed() {
    getIt<PermissionsCubit>().forceCheckNotifications();
  }

  void onUserLoggedOut() {
    getIt<OnLogoutUseCase>().execute();
    Navigator.of(getIt<RootRouterData>().context, rootNavigator: true)
        .restorablePushNamedAndRemoveUntil(Routes.welcome, (_) => true);
  }

  void onUserAnyLoggedIn() {
    getIt<SubscriptionOfferingsCubit>().init(force: true);
  }

  Future<void> onUserPurchasedPackage(PremiumPackage package) async {
    final result = await getIt<UserSubscriptionCubit>().pollSubscription(
      targetPackageType: package.type,
    );
    final context = getIt<RootRouterData>().context;

    result.whenOrNull(
      failure: (failure) {
        HapticUtil.medium();
        AppDialogs.showErrorSnackbar(
          description: failure.errorMessage(context),
        );
      },
      subscribed: (subscription) {
        HapticUtil.light();
        AppDialogs.showSubscriptionPurchaseSuccessDialog(
          context,
          subscription,
        );
      },
      unsubscribed: () {
        HapticUtil.medium();
        AppDialogs.showErrorSnackbar(
          description: SubscriptionsFailure.unexpected.errorMessage(context),
        );
      },
    );
  }

  Future<void> onSubscriptionRestored() async {
    final result = await getIt<UserSubscriptionCubit>().pollSubscription();
    final context = getIt<RootRouterData>().context;

    result.whenOrNull(
      failure: (failure) {
        HapticUtil.medium();
        AppDialogs.showErrorSnackbar(
          description: failure.errorMessage(context),
        );
      },
      subscribed: (subscription) {
        HapticUtil.light();
        AppDialogs.showSubscriptionPurchaseSuccessDialog(
          context,
          subscription,
        );
      },
      unsubscribed: () {
        HapticUtil.medium();
        AppDialogs.showErrorSnackbar(
          description: SubscriptionsFailure.unexpected.errorMessage(context),
        );
      },
    );
  }

  bool onUserSessionExpired() {
    // prevents concurrent dialogs
    if (processingExpiredSession) return false;
    processingExpiredSession = true;

    HapticUtil.heavy();

    final context = getIt<RootRouterData>().context;

    Future<void> onDialogShown() async {
      await Future<void>.delayed(CustomAnimationDurations.ultraLow);
      final args = AuthenticationPageArgs(
        initialRoute: AuthenticationRoutes.login,
        hideRegisterButton: true,
      );
      final authResult = await context.pushNamedArgs(
        Routes.authentication,
        rootNavigator: true,
        args: args,
      );
      if (authResult == null) {
        getIt<AuthCubit>().setUnauthenticated();
      }
      processingExpiredSession = false;
    }

    AppDialogs.showSessionExpiredDialog(
      context,
      onDialogShown,
    );

    return true;
  }
}
