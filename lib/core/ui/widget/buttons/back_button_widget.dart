import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/buttons/icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AppBackButtonType { arrow, cross }

extension AppBackButtonTypeX on AppBackButtonType {
  String get iconPath {
    switch (this) {
      case AppBackButtonType.arrow:
        return AppConstants.assets.icons.arrowLeftAndroid;
      case AppBackButtonType.cross:
        return AppConstants.assets.icons.crossLinear;
    }
  }

  double get defaultSize {
    switch (this) {
      case AppBackButtonType.arrow:
        return 30.0;
      case AppBackButtonType.cross:
        return 26.0;
    }
  }
}

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onTap,
    this.color,
    this.type = AppBackButtonType.arrow,
    this.padding,
    this.size,
  });

  final EdgeInsets? padding;
  final AppBackButtonType type;
  final VoidCallback? onTap;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AppIconButton(
        size: size ?? type.defaultSize,
        color: color,
        onTap: onTap ?? Navigator.of(context).pop,
        iconPath: type.iconPath,
        padding: padding ?? EdgeInsets.all(24.h).copyWith(left: 20.w),
      ),
    );
  }
}