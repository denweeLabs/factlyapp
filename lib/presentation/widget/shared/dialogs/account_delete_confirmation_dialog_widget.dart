import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/dialogs/core/core_dialog_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AccountDeleteConfirmationDialog extends StatelessWidget {
  const AccountDeleteConfirmationDialog({super.key});

  static const routeName = 'AccountDeleteConfirmationDialog';

  @override
  Widget build(BuildContext context) {
    return CoreDialog.confirmation(
      decorationIcon: AppConstants.assets.icons.profileDeleteLinear,
      backgroundDecorationIcon: AppConstants.assets.icons.trashLinear,
      title: context.tr(LocaleKeys.dialog_account_delete_title),
      subtitle: context.tr(LocaleKeys.dialog_account_delete_subtitle),
      cancelButton: CoreDialogButton.cross(Navigator.of(context).pop),
      okButton: CoreDialogButton(
        AppConstants.assets.icons.trashLinear,
        () => Navigator.of(context).pop(true),
        color: context.theme.colorScheme.error,
        size: 22.0,
      ),
    );
  }
}
