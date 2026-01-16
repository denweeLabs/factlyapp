import 'dart:math';

import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/widget/animations/constants/animated_switchers.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/buttons/archive_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/back_button_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoriesFactTitleAndArchiveBar extends StatelessWidget {
  const StoriesFactTitleAndArchiveBar({
    super.key,
    required this.factId,
    required this.factTitle,
    required this.scrollFraction,
    required this.onBack,
    this.ignorePointer = false,
  });

  final UniqueId factId;
  final String factTitle;
  final bool ignorePointer;
  final ValueListenable<double> scrollFraction;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignorePointer,
      child: ValueListenableBuilder(
        valueListenable: scrollFraction,
        builder: (context, scrollFraction, child) {
          final yTranslate = 30 - 10 * scrollFraction;
          final opacity = scrollFraction >= 0.5
              ? min(1.0, 2 * (scrollFraction - 0.5))
              : 0.0;

          return Transform.translate(
            offset: Offset(0.0, yTranslate),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _BackAndTitle(
                    title: factTitle,
                    opacity: opacity,
                    onBack: onBack,
                  ),
                ),
                child!,
              ],
            ),
          );
        },
        child: AppArchiveButton(
          factId: factId,
          type: AppArchiveButtonType.iconOnly,
          iconPadding: EdgeInsets.symmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}

class _BackAndTitle extends StatelessWidget {
  const _BackAndTitle({
    required this.title,
    required this.opacity,
    required this.onBack,
  });

  final String title;
  final double opacity;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Row(
        children: [
          Offstage(
            offstage: opacity <= 0.0,
            child: AppBackButton(
              onTap: onBack,
              color: context.lightIconColor,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
            ),
          ),
          const Spacer(),
          AnimatedSwitcher(
            duration: CustomAnimationDurations.lowMedium,
            transitionBuilder: AnimatedSwitchers.fadeBlurXTransition,
            switchInCurve: const Interval(
              0.2,
              1.0,
              curve: Curves.fastEaseInToSlowEaseOut,
            ),
            switchOutCurve: const Interval(0.5, 1.0, curve: Curves.ease),
            child: ConstrainedBox(
              key: ValueKey(title),
              constraints: BoxConstraints(maxWidth: 0.65.sw),
              child: BackdropSurfaceContainer.ellipse(
                borderColor: Colors.white12,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 10.h,
                  ),
                  child: Text(
                    title,
                    style: h6.copyWith(
                      color: context.lightTextColor,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
