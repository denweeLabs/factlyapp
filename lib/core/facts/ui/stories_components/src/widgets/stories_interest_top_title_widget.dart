import 'dart:math';
import 'dart:ui';

import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/widget/animations/constants/animated_switchers.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoriesInterestTopTitle extends StatelessWidget {
  const StoriesInterestTopTitle({
    super.key,
    required this.factId,
    required this.interest,
    required this.region,
    required this.scrollFraction,
  });

  final int factId;
  final String interest;
  final String? region;
  final ValueListenable<double> scrollFraction;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: scrollFraction,
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
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.factId,
    required this.interest,
    required this.region,
  });

  final int factId;
  final String interest;
  final String? region;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: CustomAnimationDurations.lowMedium,
      switchInCurve: Curves.linearToEaseOut,
      switchOutCurve: Curves.easeInToLinear,
      transitionBuilder: AnimatedSwitchers.fadeBlurXTransition,
      child: Row(
        key: ValueKey(factId),
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  interest,
                  style: h5.copyWith(
                    color: context.lightTextColor,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                if (region != null) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Text(
                      '•',
                      style: h6.copyWith(
                        color: context.lightTextColor,
                        height: 0.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      region!,
                      style: h6.copyWith(
                        color: context.lightTextColorSecondary,
                        height: 0.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
