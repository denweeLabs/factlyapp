import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in_up.dart';
import 'package:denwee/presentation/widget/shared/common/common_scaffold_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/page/onboarding/configuration/onboarding_configuration_page.dart';
import 'package:denwee/presentation/widget/onboarding/value_primer_bullet_points_widget.dart';
import 'package:denwee/presentation/widget/onboarding/value_primer_header_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ValuePrimerPage extends StatelessWidget {
  const ValuePrimerPage({super.key});

  static const routeName = 'ValuePrimerPage';

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      systemOverlayType: ThemeType.dark,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ValuePrimerHeader(),
          SizedBox(height: 0.06.sh),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              context.tr(LocaleKeys.onboarding_value_primer_title),
              style: h0.copyWith(
                height: 1.4,
                letterSpacing: -0.6,
                color: context.textColor,
              ),
              textAlign: TextAlign.center,
            ).autoFadeInUp(sequencePos: 3),
          ),
          12.verticalSpace,
          const Expanded(child: Center(child: ValuePrimerBulletPoints())),
          SizedBox(
            height: OnboardingConfigurationPage.contentBottomPadding(context),
          ),
        ],
      ),
    );
  }
}
