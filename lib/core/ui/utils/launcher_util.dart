// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/core/ui/utils/redirect_util.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum LinkLaunchType { url, domain }

class LauncherUtil {
  static Future<bool> processGenericLink(String link) async {
    if (link.startsWith(RedirectUtil.scheme)) return launchDeeplink(link);
    return launchUrl(link);
  }

  static Future<bool> launchDeeplink(String link) {
    return launchUrl(link, mode: LaunchMode.platformDefault);
  }

  static Future<bool> launchUrl(
    String url, {
    LinkLaunchType linkType = LinkLaunchType.url,
    LaunchMode mode = LaunchMode.externalApplication,
  }) async {
    final processedLink = _retrieveLink(url: url, type: linkType);
    final canLaunch = await _isUrlLaunchable(processedLink);
    if (!canLaunch) return false;
    return launchUrlString(processedLink, mode: mode);
  }

  static Future<bool> launchPlaceOnMap(String name) async {
    final query = Uri.encodeComponent(name);
    final url = 'https://www.google.com/maps/search/?api=1&query=$query';
    final canLaunch = await _isUrlLaunchable(url);
    if (!canLaunch) return false;
    return launchUrl(url, mode: LaunchMode.externalApplication);
  }

  static Future<bool> launchEmail({
    required List<String> to,
    String? subject,
    String? body,
  }) async {
    final url = Uri(
      scheme: 'mailto',
      path: to.join(','),
      queryParameters: {
        if (subject != null && subject.isNotEmpty) 'subject': subject,
        if (body != null && body.isNotEmpty) 'body': body,
      },
    ).toString();
    return launchUrl(url);
  }

  static Future<bool> launchSupportEmail(
    BuildContext context, {
    SnackBarPosition errorSnackbarPos = SnackBarPosition.top,
  }) async {
    final isSuccess = await launchEmail(
      to: [AppConstants.config.supportEmail],
      subject: AppConstants.config.supportEmailSubject,
    );
    if (!isSuccess) {
      AppDialogs.showErrorSnackbar(
        description: context.tr(
          LocaleKeys.error_message_email_failed_to_open_support,
          args: [AppConstants.config.supportEmail],
        ),
        position: errorSnackbarPos,
      );
    }
    return isSuccess;
  }

  static Future<bool> launchTermsOfUse(BuildContext context) async {
    return _launchDenweeLandingRes(
      context,
      AppConstants.config.termsOfUseUrl,
    );
  }

  static Future<bool> launchPrivacyPolicy(BuildContext context) async {
    return _launchDenweeLandingRes(
      context,
      AppConstants.config.privacyPolicyUrl,
    );
  }

  static Future<bool> launchDenweeLanding(BuildContext context) async {
    return _launchDenweeLandingRes(
      context,
      AppConstants.config.denweeLandingUrl,
    );
  }

  static Future<bool> _launchDenweeLandingRes(
    BuildContext context,
    String resource,
  ) async {
    final url = Uri.parse(resource).replace(
      queryParameters: {
        'lang': getIt<UserPreferencesCubit>()
            .state
            .preferences
            .language
            .languageCode,
      },
    );
    final isSuccess = await launchUrl(url.toString());
    if (!isSuccess) {
      AppDialogs.showErrorSnackbar(
        title: context.tr(LocaleKeys.label_oops),
        description: context.tr(LocaleKeys.error_message_common_unexpected),
      );
    }
    return isSuccess;
  }

  static String _retrieveLink({
    required String url,
    required LinkLaunchType type,
  }) {
    switch (type) {
      case LinkLaunchType.url: return url;
      case LinkLaunchType.domain: return Uri.parse(url).origin;
    }
  }

  static Future<bool> _isUrlLaunchable(String url) {
    try {
      return canLaunchUrlString(url);
    } catch (_) {
      return Future.value(false);
    }
  }
}
