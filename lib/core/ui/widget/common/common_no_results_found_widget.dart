import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum NoResultsFoundOf {
  dailyFacts,
  archive,
}

extension _NoResultsFoundOfX on NoResultsFoundOf {
  String subTitle(BuildContext context) {
    switch (this) {
      case NoResultsFoundOf.dailyFacts:
        return context.tr(LocaleKeys.info_message_no_results_daily_facts);
      case NoResultsFoundOf.archive:
        return context.tr(LocaleKeys.info_message_no_results_facts_archive);
    }
  }
}

class CommonNoResultsFound extends StatelessWidget {
  const CommonNoResultsFound({
    super.key,
    required this.of,
    this.padding = EdgeInsets.zero,
    this.titleColor,
    this.subtitleColor,
  });

  final NoResultsFoundOf of;
  final EdgeInsets padding;
  final Color? titleColor;
  final Color? subtitleColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.tr(LocaleKeys.info_message_no_results_title),
            style: h3.copyWith(color: titleColor ?? context.textColor),
          ),
          14.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Text(
              of.subTitle(context),
              style: bodyM.copyWith(
                color: subtitleColor ?? context.textColorSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
