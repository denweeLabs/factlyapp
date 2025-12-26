import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/snackbars/common_snackbar_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InternetConnectionSnackbar extends StatelessWidget {
  const InternetConnectionSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonSnackbar.error(
      iconPath: AppConstants.assets.icons.globeLinear,
      title: context.tr(LocaleKeys.snackbar_badConnection_title),
      description: context.tr(LocaleKeys.snackbar_badConnection_description),
    );
  }
}
