import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_fade_animation.dart';
import 'package:denwee/localization/locale_keys.g.dart';
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
    final textColor = context.lightTextColor.withValues(alpha: 0.8);
    
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8.w,
      children: [
        BounceTapFadeAnimation(
          onTap: onRestore,
          child: Text(
            context.tr(LocaleKeys.subscription_paywall_footer_restore),
            style: bodyM.copyWith(
              color: textColor,
              decorationColor: textColor,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Text(
          bulletPoint,
          style: bodyM.copyWith(
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        BounceTapFadeAnimation(
          onTap: onPrivacy,
          child: Text(
            context.tr(LocaleKeys.subscription_paywall_footer_privacy),
            style: bodyM.copyWith(
              color: textColor,
              decorationColor: textColor,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Text(
          bulletPoint,
          style: bodyM.copyWith(
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        BounceTapFadeAnimation(
          onTap: onTerms,
          child: Text(
            context.tr(LocaleKeys.subscription_paywall_footer_terms),
            style: bodyM.copyWith(
              color: textColor,
              decorationColor: textColor,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
