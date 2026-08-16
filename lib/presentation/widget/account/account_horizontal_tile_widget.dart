// ignore_for_file: library_private_types_in_public_api

import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_colors.dart';
import 'package:denwee/presentation/shared/theme/app_gradients.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:denwee/presentation/widget/shared/inputs/app_switch_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/surface_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum _AccountHorizontalTileType {
  value,
  widget,
  sSwitch,
  column,
  valueMore,
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
    this.gradient,
    this.value,
    this.widget,
    this.switchValue,
    this.column,
  });

  final String iconPath;
  final String title;
  final VoidCallback? onTap;
  final _AccountHorizontalTileType type;
  final AppTileGradient? gradient;
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
    AppTileGradient? gradient,
  }) : this._(
          key: key,
          iconPath: iconPath,
          title: title,
          onTap: onTap,
          gradient: gradient,
          value: value,
          type: _AccountHorizontalTileType.value,
        );

  const AccountHorizontalTile.widget({
    Key? key,
    required String iconPath,
    required String title,
    required VoidCallback onTap,
    required Widget widget,
    AppTileGradient? gradient,
  }) : this._(
          key: key,
          iconPath: iconPath,
          title: title,
          onTap: onTap,
          gradient: gradient,
          widget: widget,
          type: _AccountHorizontalTileType.widget,
        );

  const AccountHorizontalTile.sSwitch({
    Key? key,
    required String iconPath,
    required String title,
    required VoidCallback? onTap,
    required bool switchValue,
    AppTileGradient? gradient,
  }) : this._(
          key: key,
          iconPath: iconPath,
          title: title,
          onTap: onTap,
          gradient: gradient,
          switchValue: switchValue,
          type: _AccountHorizontalTileType.sSwitch,
        );

  const AccountHorizontalTile.column({
    Key? key,
    required String iconPath,
    required String title,
    required VoidCallback onTap,
    required Widget column,
    AppTileGradient? gradient,
  }) : this._(
          key: key,
          iconPath: iconPath,
          title: title,
          onTap: onTap,
          gradient: gradient,
          column: column,
          type: _AccountHorizontalTileType.column,
        );

  const AccountHorizontalTile.valueMore({
    Key? key,
    required String iconPath,
    required String title,
    required String value,
    required VoidCallback onTap,
    AppTileGradient? gradient,
  }) : this._(
          key: key,
          iconPath: iconPath,
          title: title,
          value: value,
          onTap: onTap,
          gradient: gradient,
          type: _AccountHorizontalTileType.valueMore,
        );

  const AccountHorizontalTile.more({
    Key? key,
    required String iconPath,
    required String title,
    required VoidCallback onTap,
    AppTileGradient? gradient,
  }) : this._(
          key: key,
          iconPath: iconPath,
          title: title,
          onTap: onTap,
          gradient: gradient,
          type: _AccountHorizontalTileType.more,
        );

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: BounceTapAnimation(
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
        SurfaceContainer.ellipse(
          color: gradient == null ? context.primaryContainer : null,
          gradient: gradient?.gradient,
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          borderColor: gradient != null
              ? Colors.transparent
              : (context.isLightTheme ? Colors.black12 : AppColors.white08),
          size: Size.square(defaultIconSize + 20),
          child: Center(
            child: CommonAppIcon(
              path: iconPath,
              size: defaultIconSize,
              color: gradient != null ? Colors.white : context.iconColorSecondary,
            ),
          ),
        ),
        12.horizontalSpace,
        Expanded(
          child: Text(
            title,
            style: bodyL.copyWith(
              color: context.textColor,
              fontFamily: AppConstants.style.textStyle.secondaryFontFamiliy,
            ),
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
          color: context.iconColorTernary,
          size: 20,
        );

      case _AccountHorizontalTileType.valueMore:
        return Row(
          children: [
            Text(
              value!,
              style: bodyL.copyWith(color: context.theme.colorScheme.secondary),
            ),
            6.horizontalSpace,
            CommonAppIcon(
              path: AppConstants.assets.icons.arrowRightIos,
              color: context.iconColorTernary,
              size: 20,
            ),
          ],
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
