import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/constants/app/user_interests.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterestPickTile extends StatelessWidget {
  const InterestPickTile({
    super.key,
    required this.index,
    required this.isSelected,
    required this.onTap,
    required this.interest,
  });

  final int index;
  final bool isSelected;
  final void Function(UserInterest) onTap;
  final UserInterest interest;

  @override
  Widget build(BuildContext context) {
    final borderColor = isSelected
        ? context.theme.colorScheme.primary
        : context.isLightTheme
        ? Colors.black26
        : Colors.white12;

    return RepaintBoundary.wrap(
      BackdropSurfaceContainer.ellipse(
        onTap: () => onTap(interest),
        borderColor: borderColor,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 22.h,
            horizontal: 18.w,
          ).copyWith(left: 24.w),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${interest.emoji}  ${interest.tryTranslate(context)} ',
                  style: h4.copyWith(color: context.textColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              BackdropSurfaceContainer.circle(
                size: const Size.square(28),
                color: context.theme.colorScheme.secondary.withValues(
                  alpha: isSelected ? 1.0 : 0.0,
                ),
                borderColor: isSelected ? Colors.transparent : borderColor,
                child: Center(
                  child: AnimatedScale(
                    curve: Curves.ease,
                    duration: CustomAnimationDurations.ultraLow,
                    scale: isSelected ? 1.0 : 0.0,
                    child: CommonAppIcon(
                      path: AppConstants.assets.icons.checkmarkLinear,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      index,
    );
  }
}
