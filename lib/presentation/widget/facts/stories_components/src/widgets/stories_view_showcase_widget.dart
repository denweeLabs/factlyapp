import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/elastic_in.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in_up.dart';
import 'package:denwee/presentation/widget/shared/animations/animated_icons/swipe_gesture_animation_widget.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/buttons/app_solid_button_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/widget/shared/common/common_swipe_detector_widget.dart';
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
      child: CommonSwipeDetector(
        onLeft: onDismiss,
        onRight: onDismiss,
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
                    SizedBox(height: 0.08.sh),
                  ],
                ),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: context.bottomPadding + 42.h,
                child: _buildDismissButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwipeAnimation(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: isEnabled
          ? SwipeGestureAnimation(delay: const Duration(milliseconds: 700))
          : const SizedBox.shrink(),
    );
  }

  Widget _buildTitleAndSubtitle(BuildContext context) {
    return SizedBox(
      width: 0.67.sw,
      child: Text(
        context.tr(LocaleKeys.showcase_title),
        style: h3.copyWith(
          color: context.lightTextColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ).autoFadeInUp(sequencePos: 3, animate: isEnabled),
    );
  }

  Widget _buildDismissButton(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 0.58.sw,
          child: AppSolidButton(
            buttonHeight: 66.h,
            onTap: onDismiss,
            shadowColor: Colors.black,
            text: context.tr(LocaleKeys.showcase_button),
            backgroundColors: [
              context.lightPrimaryContainer,
              context.lightPrimaryContainer,
            ],
            textColor: context.theme.colorScheme.primary,
          ).autoElasticIn(sequencePos: 6, animate: isEnabled),
        ),
        28.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            context.tr(LocaleKeys.showcase_subtitle),
            style: h6.copyWith(color: context.lightTextColorTernary),
            textAlign: TextAlign.center,
          ).autoFadeIn(sequencePos: 7, animate: isEnabled),
        ),
      ],
    );
  }
}
