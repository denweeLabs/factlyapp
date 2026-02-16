import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/widget/shared/animations/tap_animations/tap_fade_animation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaywallFooterLinks extends StatelessWidget {
  const PaywallFooterLinks({
    super.key,
    required this.onRestore,
    required this.onPrivacy,
    required this.onTerms,
  });

  final VoidCallback onRestore;
  final VoidCallback onPrivacy;
  final VoidCallback onTerms;

  static const bulletPoint = '•';

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8.w,
      children: [
        _buildLink(
          context: context,
          text: context.tr(LocaleKeys.subscription_paywall_footer_restore),
          onTap: onRestore,
        ),
        Text(
          bulletPoint,
          style: bodyM.copyWith(
            color: context.lightTextColorSecondary,
            fontWeight: FontWeight.w700,
          ),
        ),
        _buildLink(
          context: context,
          text: context.tr(LocaleKeys.subscription_paywall_footer_privacy),
          onTap: onPrivacy,
        ),
        Text(
          bulletPoint,
          style: bodyM.copyWith(
            color: context.lightTextColorSecondary,
            fontWeight: FontWeight.w700,
          ),
        ),
        _buildLink(
          context: context,
          text: context.tr(LocaleKeys.subscription_paywall_footer_terms),
          onTap: onTerms,
        ),
      ],
    );
  }

  Widget _buildLink({
    required BuildContext context,
    required VoidCallback onTap,
    required String text,
  }) {
    return TapFadeAnimation(
      onTap: onTap,
      child: Text(
        text,
        style: bodyM.copyWith(
          color: context.lightTextColorSecondary,
          decorationColor: context.lightTextColorSecondary,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
