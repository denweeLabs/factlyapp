import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/widget/shared/dialogs/core/core_dialog_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EmailChangeWarningDialog extends StatelessWidget {
  const EmailChangeWarningDialog({super.key});

  static const routeName = 'EmailChangeWarningDialog';

  @override
  Widget build(BuildContext context) {
    return CoreDialog.confirmation(
      decorationIcon: AppConstants.assets.icons.smsLinear,
      okButton: CoreDialogButton(
        AppConstants.assets.icons.checkmarkLinear,
        () => Navigator.of(context).pop(true),
      ),
      cancelButton: CoreDialogButton.cross(
        () => Navigator.of(context).pop(false),
      ),
      title: context.tr(LocaleKeys.dialog_email_change_title),
      subtitle: context.tr(LocaleKeys.dialog_email_change_subtitle),
    );
  }
}
