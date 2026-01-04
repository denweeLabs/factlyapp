import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/dialogs/core/core_dialog_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SubscriptionSwitchWarningDialog extends StatelessWidget {
  const SubscriptionSwitchWarningDialog({super.key});

  static const routeName = 'SubscriptionSwitchWarningDialog';

  @override
  Widget build(BuildContext context) {
    return CoreDialog.confirmation(
      dialogWidth: 0.87,
      decorationIcon: AppConstants.assets.icons.infoLinear,
      okButton: CoreDialogButton(
        AppConstants.assets.icons.checkmarkLinear,
        () => Navigator.of(context).pop(true),
      ),
      cancelButton: CoreDialogButton.cross(
        () => Navigator.of(context).pop(false),
      ),
      title: context.tr(LocaleKeys.dialog_subscription_packages_switch_title),
      subtitle: context.tr(LocaleKeys.dialog_subscription_packages_switch_subtitle),
    );
  }
}
