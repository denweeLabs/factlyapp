// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/misc/domain/service/app_review_service.dart';
import 'package:denwee/core/notifications/domain/entity/push_notification.dart';
import 'package:denwee/core/permissions/domain/entity/app_permission_status.dart';
import 'package:denwee/core/permissions/domain/repo/app_permission.dart';
import 'package:denwee/core/permissions/domain/utils/permission_type_util.dart';
import 'package:denwee/core/subscriptions/domain/entity/user_subscription.dart';
import 'package:denwee/presentation/shared/router/page_routes_builders/fade_slideup_page_route_builder.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/dialogs/account_delete_confirmation_dialog_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/advertisment_alert_dialog_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/background_insufficient_balance_dialog_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/background_unlock_confirmation_dialog_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/email_change_warning_dialog_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/hsv_color_picker_dialog_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/reset_pass_email_prompt_dialog_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/fact_explanation_unlock_method_dialog_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/grant_permission_dialog_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/reset_password_link_sent_dialog_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/reset_password_timeout_dialog_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/select_notification_time_dialog_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/session_expired_dialog_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/subscription_purchase_success_dialog_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/subscription_switch_warning_dialog_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/success_signup_review_encourage_dialog_widget.dart';
import 'package:denwee/presentation/widget/shared/snackbars/common_snackbar_widget.dart';
import 'package:denwee/presentation/widget/shared/snackbars/core_global_snackbar_widget.dart';
import 'package:denwee/presentation/widget/shared/snackbars/internet_connection_snackbar_widget.dart';
import 'package:denwee/presentation/widget/shared/snackbars/notification_snackbar_widget.dart';
import 'package:denwee/presentation/widget/shared/snackbars/toast_message_snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar/top_snackbar.dart';
import 'package:utils/utils.dart';

class AppDialogs {
  static const snackbarDefaultAnimationDuration = Duration(milliseconds: 1500);
  static const snackbarDefaultDisplayDuration = Duration(milliseconds: 1200);
  static const snackbarSuccessDisplayDuration = Duration(milliseconds: 800);
  static const snackbarErrorDisplayDuration = Duration(milliseconds: 2200);
  static const snackbarNotificationDisplayDuration = Duration(
    milliseconds: 2000,
  );
  static const toastMessageDisplayDuration = Duration(milliseconds: 1000);
  static final dialogBarrierColor = Colors.black.withValues(alpha: 0.65);

  static void showSuccessSnackbar({String? title, String? description}) {
    _showSnackbar(
      CommonSnackbar.success(title: title, description: description),
      displayDuration: snackbarSuccessDisplayDuration,
    );
  }

  static void showErrorSnackbar({String? title, String? description}) {
    _showSnackbar(
      CommonSnackbar.error(title: title, description: description),
      displayDuration: snackbarErrorDisplayDuration,
    );
  }

  static void showNoConnectionSnackbar() {
    _showSnackbar(const InternetConnectionSnackbar());
  }

  static void showNotificationSnackbar(PushNotification notification) {
    _showSnackbar(
      NotificationSnackbar(notification),
      displayDuration: snackbarNotificationDisplayDuration,
      onTap: notification.tryLaunchLink,
      curve: const Interval(0.0, 0.4, curve: Curves.linearToEaseOut),
    );
  }

  static void showToastMessage(String message, {EdgeInsets? padding}) {
    _showSnackbar(
      ToastMessageSnackbar(message),
      displayDuration: toastMessageDisplayDuration,
      padding: padding,
    );
  }

  static Future<void> showSessionExpiredDialog(
    BuildContext context,
    VoidCallback onDismiss,
  ) {
    return showDialog<void>(
      context,
      SessionExpiredDialog(onDismiss: onDismiss),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(name: SessionExpiredDialog.routeName),
      barrierDismissible: false,
    );
  }

  static Future<bool?> showAccountDeleteConfirmationDialog(
    BuildContext context,
  ) {
    return showDialog<bool?>(
      context,
      const AccountDeleteConfirmationDialog(),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(
        name: AccountDeleteConfirmationDialog.routeName,
      ),
    );
  }

  static Future<bool?> showResetPasswordExpiredDialog(BuildContext context) {
    return showDialog<bool?>(
      context,
      const ResetPasswordExpiredDialog(),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(name: ResetPasswordExpiredDialog.routeName),
    );
  }

  static Future<bool?> showResetPasswordLinkSentDialog(BuildContext context) {
    return showDialog<bool?>(
      context,
      const ResetPasswordLinkSentDialog(),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(
        name: ResetPasswordLinkSentDialog.routeName,
      ),
    );
  }

  static Future<AppPermissionStatus> checkPermissionDialog(
    BuildContext context,
    AppPermissionType type,
  ) async {
    final permissionStatus = await type.check();
    if (permissionStatus.isAnyGranted) {
      return permissionStatus;
    }

    final isForcedSettings = permissionStatus.isDeniedForever;
    final result = await showDialog<bool?>(
      context,
      GrantPermissionDialog(type: type, isForcedSettings: isForcedSettings),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(name: GrantPermissionDialog.routeName),
    );
    if (result != true) return permissionStatus;

    if (!isForcedSettings) {
      return type.request();
    }

    await type.openSettings();
    return permissionStatus;
  }

  static Future<bool?> showAdvertismentAlertDialog(BuildContext context) {
    return showDialog<bool?>(
      context,
      const AdvertismentAlertDialog(),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(name: AdvertismentAlertDialog.routeName),
    );
  }

  static Future<bool?> showFactExplanationUnlockMethodDialog(
    BuildContext context,
  ) {
    return showDialog<bool?>(
      context,
      const FactExplanationUnlockMethodDialog(),
      barrierColor: context.darkPrimaryContainer.withValues(alpha: 0.97),
      settings: const RouteSettings(
        name: FactExplanationUnlockMethodDialog.routeName,
      ),
    );
  }

  static Future<DateTime?> showSelectNotificationTimeDialog(
    BuildContext context, {
    DateTime? initialTime,
  }) {
    return showDialog<DateTime?>(
      context,
      SelectNotificationTimeDialog(initialTime: initialTime),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(
        name: SelectNotificationTimeDialog.routeName,
      ),
    );
  }

  static Future<Email?> showEnterEmailPromptDialog(
    BuildContext context, {
    Email? initialEmail,
  }) {
    return showDialog<Email?>(
      context,
      ResetPassEmailPromptDialog(initialEmail: initialEmail),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(name: ResetPassEmailPromptDialog.routeName),
    );
  }

  static Future<void> showSubscriptionPurchaseSuccessDialog(
    BuildContext context,
    UserSubscription subscription,
  ) {
    return showDialog<void>(
      context,
      SubscriptionPurchaseSuccessDialog(subscription: subscription),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(
        name: SubscriptionPurchaseSuccessDialog.routeName,
      ),
    );
  }

  static Future<bool?> showSubscriptionSwitchWarningDialog(
    BuildContext context,
  ) {
    return showDialog<bool?>(
      context,
      const SubscriptionSwitchWarningDialog(),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(
        name: SubscriptionSwitchWarningDialog.routeName,
      ),
    );
  }

  static Future<void> showHsvColorPickerDialog(
    BuildContext context, {
    required Color selectedColor,
    required ValueChanged<Color> onChanged,
  }) {
    return Navigator.of(context, rootNavigator: true).push(
      FadeSlideupPageRouteBuilder(
        slideBegin: 0.15,
        barrierDismissible: true,
        settings: const RouteSettings(name: HsvColorPickerDialog.routeName),
        barrierColor: Colors.transparent,
        duration: CustomAnimationDurations.low,
        reverseDuration: CustomAnimationDurations.ultraLow,
        builder: (_) => AlertDialog(
          insetPadding: EdgeInsets.only(bottom: context.bottomPadding),
          shadowColor: Colors.black87,
          backgroundColor: context.primaryContainer,
          surfaceTintColor: Colors.transparent,
          alignment: Alignment.bottomCenter,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.all(Radius.circular(38)),
          ),
          content: HsvColorPickerDialog(
            selectedColor: selectedColor,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  static Future<bool?> showBackgroundUnlockConfirmationDialog(
    BuildContext context,
    int backgroundPrice,
  ) {
    return showDialog<bool?>(
      context,
      BackgroundUnlockConfirmationDialog(backgroundPrice: backgroundPrice),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(
        name: BackgroundUnlockConfirmationDialog.routeName,
      ),
    );
  }

  static Future<void> showBackgroundInsufficientBalanceDialog(
    BuildContext context,
    int starsLeftToUnlock,
  ) {
    return showDialog<void>(
      context,
      BackgroundInsufficientBalanceDialog(starsLeftToUnlock: starsLeftToUnlock),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(
        name: BackgroundInsufficientBalanceDialog.routeName,
      ),
    );
  }

  static Future<bool?> showEmailChangeWarningDialog(BuildContext context) {
    return showDialog<bool?>(
      context,
      const EmailChangeWarningDialog(),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(name: EmailChangeWarningDialog.routeName),
    );
  }

  static Future<void> showSuccessSignupReviewEncourageDialog(
    BuildContext context,
  ) async {
    final isOk = await showDialog<bool?>(
      context,
      const SuccessSignupReviewEncourageDialog(),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(
        name: SuccessSignupReviewEncourageDialog.routeName,
      ),
    );
    if (isOk == true) {
      return AppReviewService.requestReview();
    }
  }

  static Future<T?> showDialog<T>(
    BuildContext context,
    Widget dialogBody, {
    required RouteSettings settings,
    Color? barrierColor,
    Duration? duration,
    Duration? reverseDuration,
    bool barrierDismissible = true,
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return Navigator.of(context, rootNavigator: true).push(
      FadeSlideupPageRouteBuilder(
        settings: settings,
        slideBegin: 0.15,
        barrierColor: barrierColor ?? context.theme.shadowColor,
        barrierDismissible: barrierDismissible,
        duration: duration ?? const Duration(milliseconds: 500),
        reverseDuration: reverseDuration ?? const Duration(milliseconds: 350),
        builder: (context) {
          if (!barrierDismissible) {
            return PopScope(
              canPop: false,
              child: Dialog(
                insetPadding: EdgeInsets.zero,
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                child: dialogBody,
              ),
            );
          }

          return Dialog(
            insetPadding: EdgeInsets.zero,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            child: dialogBody,
          );
        },
      ),
    );
  }

  static void _showSnackbar(
    Widget snackbarWidget, {
    Duration? displayDuration,
    VoidCallback? onTap,
    Curve curve = Curves.elasticOut,
    EdgeInsets? padding,
  }) {
    final overlayState =
        GlobalSnackbarController.instance.overlayKey.currentState;
    if (overlayState == null) return;

    return showTopSnackBar(
      overlayState,
      snackbarWidget,
      animationDuration: snackbarDefaultAnimationDuration,
      displayDuration: displayDuration ?? snackbarDefaultDisplayDuration,
      reverseAnimationDuration: const Duration(milliseconds: 400),
      curve: curve,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 10.h),
      onTap: onTap,
    );
  }
}
