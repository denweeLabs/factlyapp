import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/permissions/domain/repo/app_permission.dart';
import 'package:denwee/core/ui/router/page_routes_builders/fade_slideup_page_route_builder.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/dialogs/account_delete_confirmation_dialog_widget.dart';
import 'package:denwee/core/ui/widget/dialogs/advertisment_alert_dialog_widget.dart';
import 'package:denwee/core/ui/widget/dialogs/reset_pass_email_prompt_dialog_widget.dart';
import 'package:denwee/core/ui/widget/dialogs/fact_explanation_unlock_method_dialog_widget.dart';
import 'package:denwee/core/ui/widget/dialogs/grant_permission_dialog_widget.dart';
import 'package:denwee/core/ui/widget/dialogs/reset_password_link_sent_dialog_widget.dart';
import 'package:denwee/core/ui/widget/dialogs/reset_password_timeout_dialog_widget.dart';
import 'package:denwee/core/ui/widget/dialogs/select_notification_time_dialog_widget.dart';
import 'package:denwee/core/ui/widget/dialogs/session_expired_dialog_widget.dart';
import 'package:denwee/core/ui/widget/snackbars/common_snackbar_widget.dart';
import 'package:denwee/core/ui/widget/snackbars/core_global_snackbar_widget.dart';
import 'package:denwee/core/ui/widget/snackbars/internet_connection_snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

extension SnackBarPositionX on SnackBarPosition {
  List<DismissDirection> get dismissDirections {
    switch (this) {
      case SnackBarPosition.bottom:
        return [DismissDirection.down, DismissDirection.horizontal];
      case SnackBarPosition.top:
        return [DismissDirection.up, DismissDirection.horizontal];
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case SnackBarPosition.bottom:
        return EdgeInsets.symmetric(horizontal: 18.w).copyWith(bottom: 18.h);
      case SnackBarPosition.top:
        return EdgeInsets.symmetric(horizontal: 18.w).copyWith(top: 12.h);
    }
  }
}

class AppDialogs {
  static const snackbarDefaultDisplayDuration = Duration(milliseconds: 1200);
  static const snackbarSuccessDisplayDuration = Duration(milliseconds: 800);
  static const snackbarErrorDisplayDuration = Duration(milliseconds: 3200);
  static final dialogBarrierColor = Colors.black.withValues(alpha: 0.65);

  static void showSuccessSnackbar({
    String? title,
    String? description,
    SnackBarPosition position = SnackBarPosition.top,
  }) {
    _showSnackbar(
      CommonSnackbar.success(title: title, description: description),
      displayDuration: snackbarSuccessDisplayDuration,
      position: position,
    );
  }

  static void showErrorSnackbar({
    String? title,
    String? description,
    SnackBarPosition position = SnackBarPosition.top,
  }) {
    _showSnackbar(
      CommonSnackbar.error(title: title, description: description),
      displayDuration: snackbarErrorDisplayDuration,
      position: position,
    );
  }

  static void showNoConnectionSnackbar() {
    _showSnackbar(const InternetConnectionSnackbar());
  }

  static Future<void> showSessionExpiredDialog(BuildContext context, VoidCallback onDismiss) {
    return showDialog<void>(
      context,
      SessionExpiredDialog(onDismiss: onDismiss),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(name: SessionExpiredDialog.routeName),
      barrierDismissible: false,
    );
  }

  static Future<bool?> showAccountDeleteConfirmationDialog(BuildContext context) {
    return showDialog<bool?>(
      context,
      const AccountDeleteConfirmationDialog(),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(name: AccountDeleteConfirmationDialog.routeName),
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
      settings: const RouteSettings(name: ResetPasswordLinkSentDialog.routeName),
    );
  }

  static Future<bool?> showGrantPermissionDialog(
    BuildContext context, {
    required AppPermissionType type,
    bool isForcedSettings = false,
  }) {
    return showDialog<bool?>(
      context,
      GrantPermissionDialog(type: type, isForcedSettings: isForcedSettings),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(name: GrantPermissionDialog.routeName),
    );
  }

  static Future<bool?> showAdvertismentAlertDialog(BuildContext context) {
    return showDialog<bool?>(
      context,
      const AdvertismentAlertDialog(),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(name: AdvertismentAlertDialog.routeName),
    );
  }

  static Future<bool?> showFactExplanationUnlockMethodDialog(BuildContext context) {
    return showDialog<bool?>(
      context,
      const FactExplanationUnlockMethodDialog(),
      barrierColor: context.darkPrimaryContainer.withValues(alpha: 0.97),
      settings: const RouteSettings(name: FactExplanationUnlockMethodDialog.routeName),
    );
  }

  static Future<DateTime?> showSelectNotificationTimeDialog(BuildContext context, {DateTime? initialTime}) {
    return showDialog<DateTime?>(
      context,
      SelectNotificationTimeDialog(initialTime: initialTime),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(name: SelectNotificationTimeDialog.routeName),
    );
  }

  static Future<Email?> showEnterEmailPromptDialog(BuildContext context, {Email? initialEmail}) {
    return showDialog<Email?>(
      context,
      ResetPassEmailPromptDialog(initialEmail: initialEmail),
      barrierColor: AppDialogs.dialogBarrierColor,
      settings: const RouteSettings(name: ResetPassEmailPromptDialog.routeName),
    );
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
    SnackBarPosition position = SnackBarPosition.top,
  }) {
    final overlayState =
        GlobalSnackbarController.instance.overlayKey.currentState;
    if (overlayState == null) return;

    return showTopSnackBar(
      overlayState,
      snackbarWidget,
      animationDuration: snackbarDefaultDisplayDuration,
      displayDuration: snackbarDefaultDisplayDuration,
      reverseAnimationDuration: const Duration(milliseconds: 400),
      curve: Curves.elasticOut,
      snackBarPosition: position,
      dismissDirection: position.dismissDirections,
      padding: position.padding,
      dismissType: DismissType.onTap,
    );
  }
}
