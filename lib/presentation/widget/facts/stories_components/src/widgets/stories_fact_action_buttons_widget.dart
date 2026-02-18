import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/network/domain/entity/network_link.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/router/root_router.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/utils/launcher_util.dart';
import 'package:denwee/presentation/widget/shared/buttons/archive_button_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_button_widget.dart';
import 'package:denwee/presentation/widget/shared/sheets/fact_share/fact_share_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

class StoriesFactActionButtons extends StatelessWidget {
  const StoriesFactActionButtons({
    super.key,
    required this.website,
    required this.factId,
    required this.factContent,
    this.iconColor,
    this.onShare,
    this.onShareFinished,
  });

  final NetworkLink? website;
  final UniqueId factId;
  final String factContent;
  final Color? iconColor;
  final VoidCallback? onShare;
  final VoidCallback? onShareFinished;

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
          onTap: _shareFact,
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

  Future<void> _shareFact() async {
    onShare?.call();
    final context = getIt<RootRouterData>().context;
    await FactShareBottomSheet.show(
      context,
      factId: factId,
      website: website,
      factContent: factContent,
    );
    onShareFinished?.call();
  }
}
