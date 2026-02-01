part of 'package:denwee/pages/background_edit/background_edit_page.dart';

enum BackgroundUnlockButtonState {
  canApply,
  premiumRequired,
  canUnlockWithStars,
  insufficientStars,
}

class _UnlockButton extends StatelessWidget {
  const _UnlockButton({
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
