import 'package:denwee/core/permissions/domain/repo/app_permission.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/dialogs/core/core_dialog_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension _AppPermissionTypeX on AppPermissionType {
  String dialogTitle(BuildContext context) {
    switch (this) {
      case AppPermissionType.notifications:
        return context.tr(LocaleKeys.dialog_permission_notifications_title);
    }
  }

  String dialogSubtitle(BuildContext context, bool isForcedToSettings) {
    switch (this) {
      case AppPermissionType.notifications:
        return isForcedToSettings
            ? context.tr(
                LocaleKeys.dialog_permission_notifications_subtitle_in_settings)
            : context
                .tr(LocaleKeys.dialog_permission_notifications_subtitle_basic);
    }
  }

  String get decorationIcon {
    switch (this) {
      case AppPermissionType.notifications:
        return AppConstants.assets.icons.notificationsLinear;
    }
  }
}

class GrantPermissionDialog extends StatelessWidget {
  const GrantPermissionDialog({
    super.key,
    required this.type,
    required this.isForcedSettings,
  });

  static const routeName = 'GrantPermissionDialog';

  final AppPermissionType type;
  final bool isForcedSettings;

  @override
  Widget build(BuildContext context) {
    return CoreDialog.confirmation(
      decorationIcon: type.decorationIcon,
      title: type.dialogTitle(context),
      subtitle: type.dialogSubtitle(context, isForcedSettings),
      okButton: CoreDialogButton(
        isForcedSettings
            ? AppConstants.assets.icons.settingsLinear
            : AppConstants.assets.icons.checkmarkLinear,
        () => Navigator.of(context).pop(true),
        size: isForcedSettings ? 22.0 : CoreDialogButton.iconSize,
      ),
      cancelButton: CoreDialogButton.cross(
        Navigator.of(context).pop,
      ),
    );
  }
}
