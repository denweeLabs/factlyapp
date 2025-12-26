// ignore_for_file: library_private_types_in_public_api

import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_fade_animation.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/inputs/app_switch_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum _AccountHorizontalTileType {
  value,
  widget,
  sSwitch,
  column,
  more,
}

class AccountHorizontalTile extends StatelessWidget {
  static const defaultIconSize = 18.0;

  const AccountHorizontalTile._({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
    required this.type,
    this.value,
    this.widget,
    this.switchValue,
    this.column,
  });

  final String iconPath;
  final String title;
  final VoidCallback? onTap;
  final _AccountHorizontalTileType type;
  final String? value;
  final Widget? widget;
  final bool? switchValue;
  final Widget? column;

  const AccountHorizontalTile.value({
    Key? key,
    required String iconPath,
    required String title,
    required VoidCallback? onTap,
    required String value,
  }) : this._(
          key: key,
          iconPath: iconPath,
          title: title,
          onTap: onTap,
          value: value,
          type: _AccountHorizontalTileType.value,
        );

  const AccountHorizontalTile.widget({
    Key? key,
    required String iconPath,
    required String title,
    required VoidCallback onTap,
    required Widget widget,
  }) : this._(
          key: key,
          iconPath: iconPath,
          title: title,
          onTap: onTap,
          widget: widget,
          type: _AccountHorizontalTileType.widget,
        );

  const AccountHorizontalTile.sSwitch({
    Key? key,
    required String iconPath,
    required String title,
    required VoidCallback? onTap,
    required bool switchValue,
  }) : this._(
          key: key,
          iconPath: iconPath,
          title: title,
          onTap: onTap,
          switchValue: switchValue,
          type: _AccountHorizontalTileType.sSwitch,
        );

  const AccountHorizontalTile.column({
    Key? key,
    required String iconPath,
    required String title,
    required VoidCallback onTap,
    required Widget column,
  }) : this._(
          key: key,
          iconPath: iconPath,
          title: title,
          onTap: onTap,
          column: column,
          type: _AccountHorizontalTileType.column,
        );

  const AccountHorizontalTile.more({
    Key? key,
    required String iconPath,
    required String title,
    required VoidCallback onTap,
  }) : this._(
          key: key,
          iconPath: iconPath,
          title: title,
          onTap: onTap,
          type: _AccountHorizontalTileType.more,
        );

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: BounceTapFadeAnimation(
        minScale: 0.96,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (type == _AccountHorizontalTileType.column) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow(context),
          column!,
        ],
      );
    }

    return _buildRow(context);
  }

  Widget _buildRow(BuildContext context) {
    return Row(
      children: [
        BackdropSurfaceContainer.ellipse(
          color: Colors.grey.shade600.withValues(alpha: 0.1),
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          size: Size.square(defaultIconSize + 20),
          child: CommonAppIcon(
            path: iconPath,
            size: defaultIconSize,
            color: context.iconColorSecondary,
          ),
        ),
        12.horizontalSpace,
        Expanded(
          child: Text(
            title,
            style: bodyL.copyWith(color: context.textColor),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        _buildSuffix(context),
      ],
    );
  }

  Widget _buildSuffix(BuildContext context) {
    switch (type) {
      case _AccountHorizontalTileType.value:
        return Text(
          value!,
          style: bodyL.copyWith(color: context.theme.colorScheme.secondary),
        );

      case _AccountHorizontalTileType.sSwitch:
        return AppSwitch(
          isChecked: switchValue!,
          onTap: onTap,
        );

      case _AccountHorizontalTileType.widget:
        return widget!;

      case _AccountHorizontalTileType.more:
        return CommonAppIcon(
          path: AppConstants.assets.icons.arrowRightIos,
          color: context.iconColorSecondary,
          size: 20,
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
