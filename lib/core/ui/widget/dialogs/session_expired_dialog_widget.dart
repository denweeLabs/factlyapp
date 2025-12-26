import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/dialogs/core/core_dialog_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SessionExpiredDialog extends StatelessWidget {
  const SessionExpiredDialog({
    super.key,
    required this.onDismiss,
  });

  static const routeName = 'SessionExpiredDialog';

  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return CoreDialog.info(
      decorationIcon: AppConstants.assets.icons.lockLinear,
      title: context.tr(LocaleKeys.dialog_session_expired_title),
      subtitle: context.tr(LocaleKeys.dialog_session_expired_subtitle),
      okButton: CoreDialogButton(
        AppConstants.assets.icons.checkmarkLinear,
        () {
          Navigator.of(context).pop();
          onDismiss();
        },
      ),
    );
  }
}
