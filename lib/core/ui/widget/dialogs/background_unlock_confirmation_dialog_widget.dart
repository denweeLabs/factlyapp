import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/dialogs/core/core_dialog_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BackgroundUnlockConfirmationDialog extends StatelessWidget {
  const BackgroundUnlockConfirmationDialog({super.key, required this.backgroundPrice});

  final int backgroundPrice;

  static const routeName = 'BackgroundUnlockConfirmationDialog';

  @override
  Widget build(BuildContext context) {
    return CoreDialog.confirmation(
      isIconShimmering: true,
      decorationIcon: AppConstants.assets.icons.galleryLinear,
      title: context.tr(LocaleKeys.dialog_background_purchase_confirmation_title),
      subtitle: context.tr(
        LocaleKeys.dialog_background_purchase_confirmation_subtitle,
        args: [backgroundPrice.toString()],
      ),
      cancelButton: CoreDialogButton.cross(Navigator.of(context).pop),
      okButton: CoreDialogButton(
        AppConstants.assets.icons.checkmarkLinear,
        () => Navigator.of(context).pop(true),
        color: context.theme.colorScheme.error,
        size: 22.0,
      ),
    );
  }
}
