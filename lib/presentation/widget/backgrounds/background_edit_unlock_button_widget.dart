import 'dart:math';

import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_selection_item.dart';
import 'package:denwee/presentation/page/available_backgrounds/util/background_selection_util.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/widget/shared/animations/animated_icons/smiling_star_animated_icon_widget.dart';
import 'package:denwee/presentation/widget/shared/animations/animated_icons/sparkles_animated_icon_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/app_solid_button_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/backdrop_surface_container_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';

enum BackgroundUnlockButtonState {
  canApply,
  premiumRequired,
  canUnlockWithStars,
  insufficientStars,
}

class BackgroundEditUnlockButton extends StatelessWidget {
  const BackgroundEditUnlockButton({
    super.key,
    required this.hasChanges,
    required this.background,
    required this.onTap,
  });

  final bool hasChanges;
  final AvailableBackground background;
  final void Function(BackgroundUnlockButtonState) onTap;

  Widget _stateProvider({
    required Widget Function(
      bool isSubscribed,
      bool isUnlocked,
      bool isSelected,
      int starsBalance,
      bool isApplying,
    )
    builder,
  }) {
    // whether background is selected
    return BackgroundSelectionUtil.isBackgroundItemSelected(
      item: BackgroundSelectionItem.availableBackground(background),
      builder: (isSelected) {
        // subscription state
        return BackgroundSelectionUtil.isSubscribedProvider(
          builder: (isSubscribed) {
            // is background unlocked state
            return BackgroundSelectionUtil.isBackgroundUnlockedProvider(
              backgroundId: background.id,
              builder: (isUnlocked) {
                // stars balance state
                return BackgroundSelectionUtil.starsBalanceProvider(
                  builder: (starsBalance) {
                    // is background applying state
                    return BackgroundSelectionUtil.isBackgroundApplyingProvider(
                      backgroundId: background.id,
                      builder: (isApplying) => builder(
                        isSubscribed,
                        isUnlocked,
                        isSelected,
                        starsBalance,
                        isApplying,
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _stateProvider(
      builder:
          (isSubscribed, isUnlocked, isSelected, starsBalance, isApplying) {
            final state = _resolveButtonState(
              isSubscribed: isSubscribed,
              isUnlocked: isUnlocked,
              starsBalance: starsBalance,
            );

            final text = _resolveButtonText(
              context: context,
              state: state,
              isSelected: isSelected,
            );

            return AppSolidButton(
              text: text,
              displayWidget: _buildBodyForState(context, state),
              onTap: isApplying ? null : () => onTap(state),
              textColor: context.lightTextColor,
              hideShadow: true,
              isBusy: isApplying,
            );
          },
    );
  }

  String _resolveButtonText({
    required BuildContext context,
    required BackgroundUnlockButtonState state,
    required bool isSelected,
  }) {
    if (state != BackgroundUnlockButtonState.canApply) return '';
    if (isSelected && !hasChanges) {
      return context.tr(LocaleKeys.backgrounds_selected);
    }
    return context.tr(LocaleKeys.backgrounds_apply);
  }

  BackgroundUnlockButtonState _resolveButtonState({
    required bool isSubscribed,
    required bool isUnlocked,
    required int starsBalance,
  }) {
    // Subscribed users can always apply
    if (isSubscribed) {
      return BackgroundUnlockButtonState.canApply;
    }

    // Already unlocked or free
    if (isUnlocked || background.isFree) {
      return BackgroundUnlockButtonState.canApply;
    }

    // Premium-only and not subscribed
    if (background.isPremiumOnly) {
      return BackgroundUnlockButtonState.premiumRequired;
    }

    // Stars-based background
    if (starsBalance >= background.price) {
      return BackgroundUnlockButtonState.canUnlockWithStars;
    }

    return BackgroundUnlockButtonState.insufficientStars;
  }

  Widget? _buildBodyForState(
    BuildContext context,
    BackgroundUnlockButtonState state,
  ) {
    switch (state) {
      case BackgroundUnlockButtonState.canApply:
        return null;

      case BackgroundUnlockButtonState.canUnlockWithStars:
      case BackgroundUnlockButtonState.insufficientStars:
        return _buildUnlockWithStarsBody(context);

      case BackgroundUnlockButtonState.premiumRequired:
        return _buildUnlockWithPremiumBody(context);
    }
  }

  Widget _buildUnlockWithStarsBody(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.tr(LocaleKeys.backgrounds_unlock).toUpperCase(),
            style: solidButton.copyWith(color: context.lightTextColor),
          ),
          8.horizontalSpace,
          BackdropSurfaceContainer.ellipse(
            color: context.darkPrimaryContainer,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  CustomAnimationBuilder<double>(
                    control: Control.loop,
                    duration: const Duration(milliseconds: 6000),
                    curve: const Interval(
                      0.0,
                      0.25,
                      curve: Curves.easeInOutQuart,
                    ),
                    tween: Tween(begin: pi * 2, end: 0.0),
                    builder: (context, value, child) {
                      return Transform.rotate(angle: value, child: child);
                    },
                    child: const SmilingStarAnimatedIcon(animate: false),
                  ),
                  const SizedBox(width: 2),
                  Text(
                    background.price.toString(),
                    style: bodyS.copyWith(
                      color: context.lightTextColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnlockWithPremiumBody(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.tr(LocaleKeys.subscription_premium_plan).toUpperCase(),
            style: solidButton.copyWith(color: context.lightTextColor),
          ),
          8.horizontalSpace,
          const SparklesAnimatedIcon(animate: true),
        ],
      ),
    );
  }
}
