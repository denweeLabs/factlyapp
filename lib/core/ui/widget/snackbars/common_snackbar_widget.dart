import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_colors.dart';
import 'package:denwee/core/ui/widget/snackbars/core_global_snackbar_widget.dart';
import 'package:flutter/material.dart';

class CommonSnackbar extends StatelessWidget {
  const CommonSnackbar({
    super.key,
    this.iconPath,
    this.title,
    this.description,
    this.backgroundColor,
  });

  CommonSnackbar.error({
    String? title,
    String? description,
    String? iconPath,
    Key? key,
  }) : this(
          key: key,
          backgroundColor: AppColors.lightRed,
          iconPath: iconPath ?? AppConstants.assets.icons.alertLinear,
          title: title,
          description: description,
        );

  CommonSnackbar.success({
    String? title,
    String? description,
    Key? key,
  }) : this(
          key: key,
          backgroundColor: AppColors.lightGreen,
          iconPath: AppConstants.assets.icons.verifyLinear,
          title: title,
          description: description,
        );

  final String? iconPath;
  final String? title;
  final String? description;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CoreSnackbar(
      backgroundColor: backgroundColor,
      iconPath: iconPath,
      title: title,
      description: description,
    );
  }
}
