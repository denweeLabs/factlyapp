import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/utils/launcher_util.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgreeToTermsHint extends StatelessWidget {
  const AgreeToTermsHint({super.key});

  static final regex = RegExp(r'<(terms|privacy)>(.*?)<\/(terms|privacy)>');
  static const termsKey = 'terms';
  static const privacyKey = 'privacy';

  @override
  Widget build(BuildContext context) {
    final defaultStyle = TextStyle(
      fontSize: 12.sp,
      letterSpacing: 0.1,
      color: context.lightTextColor.withValues(alpha: 0.45),
      fontFamily: AppConstants.style.textStyle.secondaryFontFamiliy,
      fontWeight: FontWeight.w600,
    );

    final highlightedStyle = TextStyle(
      fontSize: 12.sp,
      letterSpacing: 0.1,
      color: context.lightTextColor,
      fontFamily: AppConstants.style.textStyle.secondaryFontFamiliy,
      fontWeight: FontWeight.w700,
    );

    final text = context.tr(LocaleKeys.info_message_agreeing_to_terms);

    final spans = <InlineSpan>[];
    int lastIndex = 0;

    for (final match in regex.allMatches(text)) {
      if (match.start > lastIndex) {
        spans.add(
          TextSpan(
            text: text.substring(lastIndex, match.start),
            style: defaultStyle,
          ),
        );
      }

      spans.add(
        TextSpan(
          text: match.group(2)!,
          style: highlightedStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () => _onTap(context, match.group(1)),
        ),
      );

      lastIndex = match.end;
    }

    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: spans),
      ),
    );
  }

  void _onTap(BuildContext context, String? group) {
    if (group == termsKey) {
      LauncherUtil.launchTermsOfUse(context);
    } else if (group == privacyKey) {
      LauncherUtil.launchPrivacyPolicy(context);
    }
  }
}
