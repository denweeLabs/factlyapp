import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/common_animations/common_animations.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_fade_animation.dart';
import 'package:denwee/core/ui/widget/animations/constants/animation_bipos.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/common/common_loading_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class ProfileSaveChangesButton extends StatelessWidget {
  const ProfileSaveChangesButton({
    super.key,
    required this.isVisible,
    required this.isSaving,
    required this.isSaveSuccess,
    required this.onTap,
  });

  final bool isVisible;
  final bool isSaving;
  final bool isSaveSuccess;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: IgnorePointer(
        ignoring: !isVisible,
        child: BounceTapFadeAnimation(
          onTap: onTap,
          minScale: 1.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: AppConstants.style.colors.commonColoredGradient(context),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: context.bottomPadding + 18.h,
                top: 18.h,
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: isSaving
                    ? const CommonLoading(
                        key: ValueKey(0),
                        color: Colors.white,
                        size: 24,
                      )
                    : isSaveSuccess
                        ? CommonAppIcon(
                            key: const ValueKey(1),
                            path: AppConstants.assets.icons.checkmarkLinear,
                            color: Colors.white,
                            size: 24,
                          )
                        : Text(
                            context.tr(LocaleKeys.button_save).toUpperCase(),
                            key: const ValueKey(2),
                            style: textButton.copyWith(
                              color: context.lightTextColor,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.2,
                            ),
                          ),
              ),
            ),
          ),
        ).fadeSlide(
          animate: isVisible,
          fades: const BiPos(1.0, 1.0),
          offsets: const BiPos(Offset(0.0, 1.0), Offset.zero),
          duration: CustomAnimationDurations.lowMedium,
          offsetCurve: isVisible
              ? const Interval(0.2, 1.0, curve: Curves.fastEaseInToSlowEaseOut)
              : const Interval(0.0, 0.5, curve: Curves.fastEaseInToSlowEaseOut),
        ),
      ),
    );
  }
}
