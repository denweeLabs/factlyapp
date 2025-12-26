import 'dart:convert';

import 'package:denwee/core/ui/router/root_router.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/pages/authentication/ui/reset_password/reset_password_page_args.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@LazySingleton()
class RedirectUtil {
  /*
  1. denwee://factlyapp/resetPassword
  */

  static const scheme = 'denwee';

  Future<void> execute(Uri link) async {
    debugPrint('RedirectUtil execute: $link');
    switch (link.path) {
      case '/resetPassword': return _handleRestPassword(link);
    }
  }

  Future<void> _handleRestPassword(Uri link) async {

    String? extractAccessToken(Uri link) {
      if (link.queryParameters.containsKey('access_token')) {
        return link.queryParameters['access_token'];
      }
      final fragment = link.fragment;
      if (fragment.isEmpty) return null;
      try {
        final params = Uri.splitQueryString(fragment, encoding: utf8);
        return params['access_token'];
      } catch (_) {
        final fallback = Uri.parse('?$fragment');
        return fallback.queryParameters['access_token'];
      }
    }

    final context = getIt<RootRouterData>().context;
    final accessToken = extractAccessToken(link);
    if (accessToken == null) {
      AppDialogs.showResetPasswordExpiredDialog(context);
      return;
    }

    final args = ResetPasswordPageArgs(accessToken: accessToken);
    context.restorablePushNamedArgs(Routes.resetPassword,
        argsToJson: args.toJson);
  }
}
