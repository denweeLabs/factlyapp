import 'dart:ui';

import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in.dart';
import 'package:denwee/core/ui/widget/animations/animated_icons/smiling_star_animated_icon_widget.dart';
import 'package:denwee/core/ui/widget/animations/animated_icons/fire_animatied_icon_widget.dart';
import 'package:denwee/core/ui/widget/animations/animated_icons/question_animated_icon_widget.dart';
import 'package:denwee/core/ui/widget/animations/common_animations/common_animations.dart';
import 'package:denwee/core/ui/widget/animations/constants/animation_bipos.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/transitions/hero_transition.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/common/common_dismiss_ontap_widget.dart';
import 'package:denwee/core/ui/widget/common/common_pop_scope_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/pages/account/ui/widget/profile_overlay/profile_overlay_user_statistics_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class StatHint extends StatefulWidget {
  const StatHint({super.key, required this.item});

  final StatisticItem item;

  @override
  State<StatHint> createState() => _StatHintState();
}

class _StatHintState extends State<StatHint> {
  var isFramePassed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => isFramePassed = true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonPopScope(
      onWillPop: Navigator.of(context).pop,
      child: CommonDismissOnTap(
        dismiss: Navigator.of(context).pop,
        child: Material(
          type: MaterialType.transparency,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      24.verticalSpace,
                      RepaintBoundary(
                        child: HeroTransition(
                          tag: widget.item.title(context),
                          child: SizedBox.square(
                            dimension: 80.w,
                            child: _buildLargeIcon(widget.item),
                          ),
                        ),
                      ),
                      24.verticalSpace,
                      Text(
                        widget.item.title(context),
                        style: h1.copyWith(color: context.textColor),
                      ).autoFadeIn(sequencePos: 0),
                      12.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Text(
                          widget.item.hint(context),
                          textAlign: TextAlign.center,
                          style: bodyM.copyWith(color: context.textColorSecondary),
                        ).autoFadeIn(sequencePos: 1),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: context.bottomPadding + 32.h,
                  child: Center(
                    child: BackdropSurfaceContainer.circle(
                      blur: 0.0,
                      onTap: Navigator.of(context).pop,
                      hoverColor: context.theme.colorScheme.primary,
                      borderColor: context.theme.dividerColor,
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: CommonAppIcon(
                          path: AppConstants.assets.icons.crossLinear,
                          size: 22,
                        ),
                      ),
                    ).fadeScaleRotation(
                      fades: const BiPos(0.0, 1.0),
                      scales: const BiPos(0.0, 1.0),
                      rotations: const BiPos(1.0, 0.0),
                      delay: const Duration(milliseconds: 1000)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLargeIcon(StatisticItem item) {
    switch (item) {
      case StatisticItem.stars:
        return const SmilingStarAnimatedIcon(animate: true);
      case StatisticItem.streak:
        return FireAnimatedIcon(
          animate: false,
          onInit: (controller) {
            if (isFramePassed) return;
            Future.delayed(
              CustomAnimationDurations.ultraLow,
              controller.loop,
            );
          },
        );
      case StatisticItem.facts:
        return QuestionAnimatedIcon(
          animate: false,
          initValue: 0.5,
        );
    }
  }
}
