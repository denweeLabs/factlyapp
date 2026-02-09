import 'package:animate_do/animate_do.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in_up.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class ValuePrimerBulletPoints extends StatelessWidget {
  const ValuePrimerBulletPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Benefit(
            iconPath: AppConstants.assets.icons.eyeLinear,
            text: context.tr(LocaleKeys.onboarding_value_primer_bullets_line_1),
          ).autoFadeInUp(sequencePos: 5, slideFrom: 40),
          _Benefit(
            iconPath: AppConstants.assets.icons.playLinear,
            text: context.tr(
              LocaleKeys.onboarding_value_primer_bullets_line_2,
              args: [context.tr(LocaleKeys.button_explain_fact)],
            ),
            useRippleEffect: true,
          ).autoFadeInUp(sequencePos: 6, slideFrom: 40),
          _Benefit(
            iconPath: AppConstants.assets.icons.checkmarkLinear,
            text: context.tr(LocaleKeys.onboarding_value_primer_bullets_line_3),
          ).autoFadeInUp(sequencePos: 7, slideFrom: 40),
        ].insertBetween(16.verticalSpace),
      ),
    );
  }
}

class _Benefit extends StatelessWidget {
  const _Benefit({
    required this.iconPath,
    required this.text,
    this.useRippleEffect = false,
  });

  final String iconPath;
  final String text;
  final bool useRippleEffect;

  static const curve = Interval(0.5, 1.0, curve: Curves.ease);
  static const rippleDuration = Duration(milliseconds: 3000);
  static final tadaDuration = Duration(
    milliseconds: rippleDuration.inMilliseconds * 2,
  );

  @override
  Widget build(BuildContext context) {
    Widget buildBullet({Key? key}) {
      return BackdropSurfaceContainer.circle(
        key: key,
        size: Size.square(28.w),
        borderColor: Colors.transparent,
        color: context.theme.colorScheme.primary,
        child: Center(
          child: CommonAppIcon(
            path: iconPath,
            color: context.lightIconColor,
            size: 14,
          ),
        ),
      );
    }

    Widget buildBulletPoint() {
      return AnimatedSwitcher(
        duration: CustomAnimationDurations.ultraLow,
        child: useRippleEffect
            ? AvatarGlow(
                curve: curve,
                key: const ValueKey(0),
                glowRadiusFactor: 0.95,
                duration: rippleDuration,
                glowColor: context.theme.colorScheme.secondary,
                child: buildBullet().tada(
                  duration: tadaDuration,
                  infinite: true,
                  curve: curve,
                ),
              )
            : buildBullet(key: const ValueKey(1)),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildBulletPoint(),
        14.horizontalSpace,
        Flexible(
          child: Text(
            text,
            style: bodyL.copyWith(
              fontWeight: FontWeight.bold,
              color: context.textColorSecondary,
              letterSpacing: -0.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
