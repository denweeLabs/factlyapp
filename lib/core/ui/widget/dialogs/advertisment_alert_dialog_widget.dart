import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/dialogs/core/core_dialog_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AdvertismentAlertDialog extends StatelessWidget {
  const AdvertismentAlertDialog({super.key});

  static const routeName = 'AdvertismentAlertDialog';

  @override
  Widget build(BuildContext context) {
    return CoreDialog.info(
      dialogWidth: 0.83,
      isIconShimmering: true,
      decorationIcon: AppConstants.assets.icons.videoPlayLinear,
      backgroundDecorationEmoji: '❤️',
      title: context.tr(LocaleKeys.dialog_ad_alert_title),
      subtitle: context.tr(LocaleKeys.dialog_ad_alert_subtitle),
      okButton: CoreDialogButton(
        AppConstants.assets.icons.checkmarkLinear,
        () => Navigator.of(context).pop(true),
        size: 26,
      ),
    );
  }
}
