import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/network/domain/entity/network_link.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/core/ui/utils/launcher_util.dart';
import 'package:denwee/core/ui/widget/buttons/archive_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/icon_button_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class StoriesFactActionButtons extends StatelessWidget {
  const StoriesFactActionButtons({
    super.key,
    required this.website,
    required this.factId,
    required this.factContent,
    this.iconColor,
  });

  final NetworkLink? website;
  final UniqueId factId;
  final String factContent;
  final Color? iconColor;

  static const iconPadding = EdgeInsets.all(24);
  static const iconSize = 28.0;

  Color effectiveIconColor(BuildContext context) =>
      (iconColor ?? context.lightIconColor);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (website != null)
          _buildButton(
            iconPath: AppConstants.assets.icons.globeLinear,
            onTap: () => LauncherUtil.launchUrl(
              website!.value,
              linkType: LinkLaunchType.domain,
            ),
            context: context,
          ),
        _buildButton(
          iconPath: AppConstants.assets.icons.sendSqaureLinearLinear,
          onTap: () async {
            copyToClipboard(factContent.replaceAll('*', ''));
            AppDialogs.showToastMessage(
              context.tr(LocaleKeys.info_message_copied_to_clipboard),
              padding: EdgeInsets.only(top: 38.h),
            );
          },
          context: context,
        ),
        AppArchiveButton(
          factId: factId,
          iconPadding: iconPadding,
          iconColor: effectiveIconColor(context),
          size: iconSize,
        ),
      ],
    );
  }

  Widget _buildButton({
    required String iconPath,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return AppIconButton(
      onTap: onTap,
      iconPath: iconPath,
      padding: iconPadding,
      color: effectiveIconColor(context),
      size: iconSize,
    );
  }
}
