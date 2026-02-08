import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/elastic_in.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in_up.dart';
import 'package:denwee/presentation/widget/shared/animations/animated_icons/swipe_gesture_animation_widget.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/buttons/app_solid_button_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class StoriesViewShowcase extends StatelessWidget {
  const StoriesViewShowcase({
    super.key,
    required this.isEnabled,
    required this.isDismissed,
    required this.onDismiss,
    required this.onFinished,
  });

  final bool isEnabled;
  final bool isDismissed;
  final VoidCallback onDismiss;
  final VoidCallback onFinished;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !isEnabled,
      child: AnimatedOpacity(
        opacity: isDismissed ? 0.0 : 1.0,
        duration: CustomAnimationDurations.ultraLow,
        onEnd: onFinished,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSwipeAnimation(context),
                  _buildTitleAndSubtitle(context),
                ],
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: context.bottomPadding + 48.h,
              child: _buildDismissButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwipeAnimation(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1),
        child: isEnabled
            ? SwipeGestureAnimation(delay: const Duration(milliseconds: 1200))
            : const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildTitleAndSubtitle(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 42.w),
          child: Text(
            context.tr(LocaleKeys.showcase_title),
            style: h5.copyWith(
              color: context.lightTextColor,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ).autoFadeInUp(sequencePos: 4, animate: isEnabled),
        ),
        2.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            context.tr(LocaleKeys.showcase_subtitle),
            style: h5.copyWith(color: context.lightTextColorSecondary),
            textAlign: TextAlign.center,
          ).autoFadeIn(sequencePos: 6, animate: isEnabled),
        ),
      ],
    );
  }

  Widget _buildDismissButton(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.48,
      child: AppSolidButton(
        onTap: onDismiss,
        shadowColor: Colors.black,
        text: context.tr(LocaleKeys.showcase_button),
        backgroundColors: [
          context.lightPrimaryContainer,
          context.lightPrimaryContainer,
        ],
        textColor: context.theme.colorScheme.primary,
      ).autoElasticIn(sequencePos: 6, animate: isEnabled),
    );
  }
}
