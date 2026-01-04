import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class PremiumBenefits extends StatelessWidget {
  const PremiumBenefits({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Benefit(
          iconPath: AppConstants.assets.icons.checkmarkLinear,
          text: context.tr(LocaleKeys.subscription_paywall_benefits_line_1),
        ),
        _Benefit(
          iconPath: AppConstants.assets.icons.archiveTickLinear,
          text: context.tr(LocaleKeys.subscription_paywall_benefits_line_2),
        ),
        _Benefit(
          iconPath: AppConstants.assets.icons.videoPlayLinear,
          text: context.tr(LocaleKeys.subscription_paywall_benefits_line_3),
        ),
      ].insertBetween(14.verticalSpace),
    );
  }
}

class _Benefit extends StatelessWidget {
  const _Benefit({required this.iconPath, required this.text});

  final String iconPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BackdropSurfaceContainer.circle(
          color: Colors.white,
          size: Size.square(28.w),
          borderColor: Colors.transparent,
          child: Center(
            child: CommonAppIcon(
              path: iconPath,
              color: context.theme.colorScheme.primary,
              size: 14,
            ),
          ),
        ),
        14.horizontalSpace,
        Text(
          text,
          style: bodyL.copyWith(
            fontWeight: FontWeight.bold,
            color: context.lightTextColorSecondary,
            letterSpacing: -0.2,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
