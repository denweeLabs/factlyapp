import 'dart:math';
import 'dart:ui';

import 'package:denwee/core/backgrounds/domain/entity/background_style.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/widget/animations/constants/animated_switchers.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/common/common_skeleton_item_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class StoriesInterestTopTitle extends StatelessWidget {
  const StoriesInterestTopTitle({
    super.key,
    required this.factId,
    required this.interest,
    required this.region,
    required this.date,
    required this.scrollFraction,
    required this.isSkeleton,
    required this.backgroundStyle,
  });

  final int factId;
  final String interest;
  final String? region;
  final String? date;
  final ValueListenable<double>? scrollFraction;
  final bool isSkeleton;
  final BackgroundStyle? backgroundStyle;

  @override
  Widget build(BuildContext context) {
    final effectiveTextColor =
        backgroundStyle?.textColor ?? context.lightTextColor;

    return CommonSkeletonItem(
      isEnabled: isSkeleton,
      color: backgroundStyle?.textColor,
      child: ValueListenableBuilder(
        valueListenable: scrollFraction!,
        builder: (context, scrollFraction, child) {
          final opacity = max(0.0, 1 - 2 * scrollFraction);
          final blurY = opacity > 0.1 ? 8 * scrollFraction : 0.0;
          final offstage = opacity <= 0.0;

          return Offstage(
            offstage: offstage,
            child: Opacity(
              opacity: opacity,
              child: blurY <= 0
                  ? child
                  : ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaY: blurY),
                      child: child!,
                    ),
            ),
          );
        },
        child: _Title(
          factId: factId,
          interest: interest,
          region: region,
          date: date,
          titleColor: effectiveTextColor,
          suffixColor: effectiveTextColor.withValues(alpha: 0.7),
          isSkeleton: isSkeleton,
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.factId,
    required this.interest,
    required this.region,
    required this.date,
    required this.titleColor,
    required this.suffixColor,
    required this.isSkeleton,
  });

  final int factId;
  final String interest;
  final String? region;
  final String? date;
  final Color titleColor;
  final Color suffixColor;
  final bool isSkeleton;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: CustomAnimationDurations.lowMedium,
      switchInCurve: Curves.linearToEaseOut,
      switchOutCurve: Curves.easeInToLinear,
      transitionBuilder: AnimatedSwitchers.fadeBlurXTransition,
      child: Row(
        key: ValueKey('${isSkeleton}_$factId'),
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  interest,
                  style: h5.copyWith(
                    color: titleColor,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                if (region != null) ...[
                  const Spacer(),
                  _buildSuffixInfo(
                    context: context,
                    color: suffixColor,
                    iconPath: AppConstants.assets.icons.locationLinear,
                    info: region!,
                  ),
                ] else if (region == null && date != null) ...[
                  const Spacer(),
                  _buildSuffixInfo(
                    context: context,
                    color: suffixColor,
                    iconPath: AppConstants.assets.icons.clockLinear,
                    info: date!,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuffixInfo({
    required BuildContext context,
    required String iconPath,
    required String info,
    required Color color,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.translate(
          offset: const Offset(0.0, 1.0),
          child: CommonAppIcon(path: iconPath, color: color, size: 13),
        ),
        6.horizontalSpace,
        Text(info, style: h6.copyWith(color: color, height: 0.0)),
      ],
    );
  }
}
