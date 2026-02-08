import 'dart:math';

import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/animated_switchers.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/buttons/archive_button_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/back_button_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/backdrop_surface_container_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoriesFactTitle extends StatelessWidget {
  const StoriesFactTitle({
    super.key,
    required this.factId,
    required this.factTitle,
    required this.scrollFraction,
    required this.onBack,
    required this.backgroundBrightness,
    this.ignorePointer = false,
  });

  final UniqueId factId;
  final String factTitle;
  final bool ignorePointer;
  final ValueListenable<double> scrollFraction;
  final VoidCallback onBack;
  final Brightness backgroundBrightness;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignorePointer,
      child: ValueListenableBuilder(
        valueListenable: scrollFraction,
        builder: (context, scrollFraction, child) {
          final opacity = scrollFraction >= 0.5
              ? min(1.0, 2 * (scrollFraction - 0.5))
              : 0.0;

          return Opacity(opacity: opacity, child: child);
        },
        child: Padding(
          padding: EdgeInsets.only(top: 18.h),
          child: _TitleBar(
            title: factTitle,
            onBack: onBack,
            factId: factId,
            backgroundBrightness: backgroundBrightness,
          ),
        ),
      ),
    );
  }
}

class _TitleBar extends StatelessWidget {
  const _TitleBar({
    required this.title,
    required this.onBack,
    required this.factId,
    required this.backgroundBrightness,
  });

  final String title;
  final VoidCallback onBack;
  final UniqueId factId;
  final Brightness backgroundBrightness;

  @override
  Widget build(BuildContext context) {
    final color = backgroundBrightness == Brightness.light
        ? context.darkTextColor
        : context.lightTextColor;
    
    return Row(
      children: [
        AppBackButton(
          onTap: onBack,
          color: color,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
            key: UniqueKey(),
            constraints: BoxConstraints(maxWidth: 0.65.sw),
            child: BackdropSurfaceContainer.ellipse(
              borderColor: color.withValues(alpha: .15),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                child: Text(
                  title,
                  style: h6.copyWith(
                    color: color,
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
        AppArchiveButton(
          factId: factId,
          iconColor: color,
          iconPadding: EdgeInsets.symmetric(horizontal: 20.w),
        ),
      ],
    );
  }
}
