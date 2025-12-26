// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/utils/launcher_util.dart';
import 'package:denwee/core/ui/widget/buttons/icon_button_widget.dart';
import 'package:denwee/core/ui/widget/common/common_app_bar_widget.dart';
import 'package:denwee/core/ui/widget/common/common_scaffold_widget.dart';
import 'package:denwee/core/ui/widget/common/common_webview_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/di/env.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:utils/utils.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({super.key});

  static const routeName = 'AboutAppPage';

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  final key = GlobalKey<CommonWebviewState>();

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Column(
        children: [
          CommonAppBar(
            onBack: _onBack,
            title: _getTitle(),
            action: AppIconButton(
              onTap: () =>
                  LauncherUtil.launchUrl(AppConstants.config.aboutAppUrl),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              iconPath: AppConstants.assets.icons.globeLinear,
            ),
          ),
          Expanded(
            child: CommonWebview(
              key: key,
              url: AppConstants.config.aboutAppUrl,
            ),
          ),
          if (Platform.isAndroid) SizedBox(height: context.bottomPadding),
        ],
      ),
    );
  }

  String _getTitle() {
    final isProd = getIt<String>(instanceName: 'ENV') == Env.prod;
    final packageInfo = getIt<PackageInfo>();
    final version = packageInfo.version;
    final buildNumber = packageInfo.buildNumber;

    return '${context.tr(LocaleKeys.appTitle)} $version${!isProd ? ' ($buildNumber)' : ''}';
  }

  void _onBack() async {
    final webviewState = key.currentState;

    if (Platform.isIOS || webviewState?.controller == null) {
      return Navigator.of(context).pop();
    }

    final canGoBack = await webviewState!.controller!.canGoBack();
    if (canGoBack) {
      return webviewState.controller!.goBack();
    }

    Navigator.of(context).pop();
  }
}
