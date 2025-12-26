import 'package:denwee/core/statistics/domain/entity/user_statistics.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_colors.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/core/ui/widget/misc/bubbles_animation_widget.dart';
import 'package:denwee/core/ui/widget/misc/seal_in_circle_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:denwee/pages/account/ui/widget/profile_overlay/profile_overlay_user_statistics_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileOverlayCard extends StatelessWidget {
  const ProfileOverlayCard({
    super.key,
    required this.heroTag,
    required this.isAuthenticated,
    required this.statistics,
    required this.onTap,
    required this.userName,
  });

  final String heroTag;
  final bool isAuthenticated;
  final UserStatistics statistics;
  final VoidCallback onTap;
  final String userName;

  static final cardHeight = 108.h;
  static const minScale = 0.99;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.all(AppConstants.style.radius.card);
    final shape = RoundedSuperellipseBorder(borderRadius: borderRadius);

    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: shape,
        color: context.primaryContainer,
        shadows: [AppConstants.style.colors.commonShadow],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.fromSize(
            size: Size.fromHeight(ProfileOverlayCard.cardHeight),
            child: RepaintBoundary(
              child: BounceTapAnimation(
                minScale: ProfileOverlayCard.minScale,
                onTap: onTap,
                alignment: Alignment.bottomCenter,
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    shape: shape,
                    gradient: AppConstants.style.colors.commonColoredGradient(context),
                    shadows: [AppConstants.style.colors.commonColoredShadow(context)],
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: borderRadius,
                          child: const BubblesAnimation(bubblesCount: 10, opacity: 25),
                        ),
                      ),
                      Positioned.fill(
                        child: AnimatedSwitcher(
                          duration: CustomAnimationDurations.low,
                          switchInCurve: Curves.easeInOutSine,
                          switchOutCurve: Curves.easeInOutSine,
                          child: _buildBody(
                            context: context,
                            key: ValueKey(isAuthenticated),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: ProfileOverlayUserStatistics(statistics: statistics),
          ),
        ],
      ),
    );
  }

  Widget _buildBody({
    required BuildContext context,
    required Key key,
  }) {
    final title = isAuthenticated
        ? userName
        : context.tr(LocaleKeys.label_create_an_account);

    final subtitle = isAuthenticated
        ? context.tr(LocaleKeys.account_profile_logged_in_encourage_msg)
        : context.tr(LocaleKeys.account_profile_register_encourage_msg);

    return Center(
      key: key,
      child: Padding(
        padding: EdgeInsets.only(left: 18.w, right: 24.w),
        child: Row(
          children: [
            SealInCircle(
              size: 30,
              onTap: onTap,
              padding: EdgeInsets.all(16.w).copyWith(left: 18.w),
            ),
            18.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: h4.copyWith(color: context.lightTextColor),
                    maxLines: 1,
                  ),
                  3.verticalSpace,
                  Text(
                    subtitle,
                    style: bodyS.copyWith(
                      color: AppColors.text[ThemeType.dark]!.withValues(alpha: 0.8),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
