import 'package:denwee/core/statistics/domain/entity/user_statistics.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/theme/app_colors.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/bubbles_animation_widget.dart';
import 'package:denwee/presentation/widget/shared/animations/tap_animations/tap_fade_animation.dart';
import 'package:denwee/presentation/widget/shared/misc/seal_in_circle_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/widget/profile/profile_overlay_user_statistics_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileOverlayCard extends StatelessWidget {
  const ProfileOverlayCard({
    super.key,
    required this.isAuthenticated,
    required this.statistics,
    required this.onTap,
    required this.userName,
  });

  final bool isAuthenticated;
  final UserStatistics statistics;
  final VoidCallback onTap;
  final String userName;

  static final cardHeight = 108.h;
  static final shape = RoundedSuperellipseBorder(
    borderRadius: BorderRadius.all(AppConstants.style.radius.card),
  );

  @override
  Widget build(BuildContext context) {
    final shadowColor = context.theme.colorScheme.primary.withValues(alpha: 0.4);
    
    return PhysicalShape(
      elevation: 10.0,
      shadowColor: Colors.black38,
      clipper: ShapeBorderClipper(shape: shape),
      color: context.primaryContainer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RepaintBoundary(
            child: TapFadeAnimation(
              onTap: onTap,
              child: SizedBox.fromSize(
                size: Size.fromHeight(ProfileOverlayCard.cardHeight),
                child: PhysicalShape(
                  elevation: 8.0,
                  shadowColor: shadowColor,
                  clipBehavior: Clip.hardEdge,
                  clipper: ShapeBorderClipper(shape: shape),
                  color: Colors.transparent,
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                      shape: shape,
                      gradient: AppConstants.style.colors.commonColoredGradient(context),
                    ),
                    child: Stack(
                      children: [
                        const Positioned.fill(child: BubblesAnimation()),
                        Positioned.fill(child: _buildBody(context)),
                      ],
                    ),
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

  Widget _buildBody(BuildContext context) {
    final title = isAuthenticated
        ? userName
        : context.tr(LocaleKeys.label_create_an_account);

    final subtitle = isAuthenticated
        ? context.tr(LocaleKeys.account_profile_logged_in_encourage_msg)
        : context.tr(LocaleKeys.account_profile_register_encourage_msg);

    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 18.w, right: 24.w),
        child: Row(
          children: [
            const SealInCircle(),
            18.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: h4.copyWith(
                      color: context.lightTextColor,
                      fontFamily: AppConstants.style.textStyle.secondaryFontFamiliy,
                    ),
                    maxLines: 1,
                  ),
                  3.verticalSpace,
                  Text(
                    subtitle,
                    style: bodyS.copyWith(
                      color: AppColors.text[ThemeType.dark]!.withValues(alpha: 0.8),
                      fontFamily: AppConstants.style.textStyle.secondaryFontFamiliy,
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
