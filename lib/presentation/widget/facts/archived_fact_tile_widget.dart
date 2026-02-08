import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/constants/app/user_interests.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/tap_animations/bounce_tap_fade_animation.dart';
import 'package:denwee/presentation/widget/shared/buttons/archive_button_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/backdrop_surface_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArchivedFactTile extends StatelessWidget {
  const ArchivedFactTile({
    super.key,
    required this.fact,
    required this.onTap,
  });

  final DailyFact fact;
  final VoidCallback onTap;

  static final borderRadius = AppConstants.style.radius.cardMedium;

  @override
  Widget build(BuildContext context) {
    return BounceTapFadeAnimation(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        child: Row(
          children: [
            BackdropSurfaceContainer.ellipse(
              size: Size.square(42.w),
              color: Colors.grey.shade600.withValues(alpha: 0.1),
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              child: Center(
                child: Text(
                  fact.interest.emoji ?? '?',
                  style: h4.copyWith(color: context.iconColor),
                ),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fact.interest.tryTranslate(context) ?? '',
                    style: bodyS.copyWith(
                      color: context.textColorSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  2.verticalSpace,
                  Text(
                    fact.title,
                    style: h5.copyWith(color: context.textColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Opacity(
              opacity: 0.8,
              child: AppArchiveButton(
                factId: fact.id,
                iconPadding: EdgeInsets.only(left: 18.w),
                iconColor: context.iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
