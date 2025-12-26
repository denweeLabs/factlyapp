import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/dialogs/core/core_dialog_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ResetPasswordLinkSentDialog extends StatelessWidget {
  const ResetPasswordLinkSentDialog({super.key});

  static const routeName = 'ResetPasswordLinkSentDialog';

  @override
  Widget build(BuildContext context) {
    return CoreDialog.info(
      decorationIcon: AppConstants.assets.icons.smsLinear,
      title: context.tr(LocaleKeys.dialog_reset_password_email_sent_title),
      subtitle: context.tr(LocaleKeys.dialog_reset_password_email_sent_subtitle),
      okButton: CoreDialogButton(
        AppConstants.assets.icons.checkmarkLinear,
        () => Navigator.of(context).pop(true),
        size: 24,
      ),
    );
  }
}
