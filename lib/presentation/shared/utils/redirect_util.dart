// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:denwee/core/facts/domain/entity/facts_failure.dart';
import 'package:denwee/core/facts/domain/repo/daily_facts_repo.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/presentation/shared/router/root_router.dart';
import 'package:denwee/presentation/shared/utils/dialogs_util.dart';
import 'package:denwee/presentation/shared/utils/haptic_util.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/page/reset_password/reset_password_page_args.dart';
import 'package:denwee/presentation/page/fact_details/args/fact_details_page_args.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@LazySingleton()
class RedirectUtil {
  /*
  1. denwee://factlyapp/resetPassword
  2. denwee://factlyapp/factDetails?id=1
  */

  static const scheme = 'denwee';

  Future<void> execute(Uri link) async {
    debugPrint('RedirectUtil execute: $link');
    switch (link.path) {
      case '/resetPassword': return _handleResetPassword(link);
      case '/factDetails': return _handleFactDetails(link);
    }
  }

  Future<void> _handleResetPassword(Uri link) async {

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

  Future<void> _handleFactDetails(Uri link) async {
    final factIdString = link.queryParameters['id'];
    if (factIdString == null) return;

    final factId = int.tryParse(factIdString);
    if (factId == null) return;

    final result = (await getIt<DailyFactsRepo>().getFactByIdRemote(
      UniqueId.fromValue(factId),
    )).getEntries();

    if (result.$1 != null) {
      if (result.$1! == FactsFailure.connectionTimeout) AppDialogs.showNoConnectionSnackbar();
      return;
    }
    
    HapticUtil.light();
    final context = getIt<RootRouterData>().context;
    final args = FactDetailsPageArgs(fact: result.$2!);
    context.restorablePushNamedArgs(Routes.factDetails,
        argsToJson: args.toJson);
  }
}
