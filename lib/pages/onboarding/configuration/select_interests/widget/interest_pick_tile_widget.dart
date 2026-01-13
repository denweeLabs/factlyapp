import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/constants/app/user_interests.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/widgets_util.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterestPickTile extends StatelessWidget {
  const InterestPickTile({
    super.key,
    required this.index,
    required this.interest,
    required this.isSelected,
    required this.onTap,
  });

  final int index;
  final bool isSelected;
  final UserInterest interest;
  final void Function(UserInterest) onTap;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary.wrap(
      BackdropSurfaceContainer.ellipse(
        onTap: () => onTap(interest),
        hoverColor: context.theme.colorScheme.secondary,
        color: isSelected
            ? context.theme.colorScheme.primary
            : context.primaryContainer,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h)
              .copyWith(right: 16.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              WidgetsUtil.staticRepaintAnimatedCrossFade(
                state: isSelected
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: CommonAppIcon(
                  path: AppConstants.assets.icons.checkmarkLinear,
                  color: context.lightIconColor,
                  size: 20,
                ),
                secondChild: Text(
                  interest.emoji ?? '',
                  style: bodyL.copyWith(fontSize: 16.sp),
                ),
              ),
              6.horizontalSpace,
              AnimatedDefaultTextStyle(
                curve: CustomAnimationCurves.fasterEaseInToSlowEaseOut,
                duration: CustomAnimationDurations.low,
                style: h6.copyWith(
                  color: isSelected ? context.lightTextColor : context.textColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                child: Text(interest.tryTranslate(context) ?? ''),
              ),
            ],
          ),
        ),
      ),
      index,
    );
  }
}
