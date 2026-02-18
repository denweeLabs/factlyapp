import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/elastic_in.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/animations/tap_animations/bounce_tap_fade_animation.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/surface_container_widget.dart';
import 'package:denwee/presentation/widget/shared/animations/bubbles_animation_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaywallPackageTile extends StatelessWidget {
  const PaywallPackageTile({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.isPurchased,
    required this.title,
    required this.subtitle,
    this.suffixBadge,
  });

  final VoidCallback onTap;
  final bool isPurchased;
  final bool isSelected;
  final String title;
  final String subtitle;
  final Widget? suffixBadge;

  static const _unselectedBorderColor = Colors.white38;

  @override
  Widget build(BuildContext context) {
    final borderColor = isSelected ? Colors.white : _unselectedBorderColor;

    final backgroundColor = context.darkPrimaryContainer.withValues(
      alpha: _backgroundOpacity,
    );

    final lightText = context.lightTextColor;
    final lightSecondaryText = context.lightTextColorSecondary;

    return BounceTapFadeAnimation(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          RepaintBoundary(
            child: SurfaceContainer.ellipse(
              borderColor: borderColor,
              color: backgroundColor,
              borderRadius: BorderRadius.all(
                AppConstants.style.radius.cardSmall,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                child: Row(
                  children: [
                    _TextBlock(
                      title: title,
                      subtitle: subtitle,
                      suffixBadge: suffixBadge,
                      lightText: lightText,
                      secondaryText: lightSecondaryText,
                    ),

                    _Checkmark(
                      isSelected: isSelected,
                      isPurchased: isPurchased,
                    ),
                  ],
                ),
              ),
            ),
          ),

          _SelectionOverlay(isSelected: isSelected),

          if (isPurchased) _PurchasedBadge(isPurchased: isPurchased),
        ],
      ),
    );
  }

  double get _backgroundOpacity {
    if (isPurchased) return 0.80;
    if (isSelected) return 0.65;
    return 0.0;
  }
}

class _TextBlock extends StatelessWidget {
  const _TextBlock({
    required this.title,
    required this.subtitle,
    required this.suffixBadge,
    required this.lightText,
    required this.secondaryText,
  });

  final String title;
  final String subtitle;
  final Widget? suffixBadge;

  final Color lightText;
  final Color secondaryText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: h4.copyWith(
                  color: lightText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (suffixBadge != null) ...[8.horizontalSpace, suffixBadge!],
            ],
          ),
          Text(
            subtitle,
            style: bodyM.copyWith(
              color: secondaryText,
              fontFamily: AppConstants.style.textStyle.secondaryFontFamiliy,
            ),
          ),
        ],
      ),
    );
  }
}

class _Checkmark extends StatelessWidget {
  const _Checkmark({required this.isSelected, required this.isPurchased});

  final bool isSelected;
  final bool isPurchased;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedContainer(
        width: 26.w,
        height: 26.w,
        curve: Curves.ease,
        duration: CustomAnimationDurations.ultraLow,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withValues(alpha: isSelected ? 1.0 : 0.0),
          border: Border.all(
            color: PaywallPackageTile._unselectedBorderColor,
          ),
        ),
        padding: const EdgeInsets.all(4),
        child: AnimatedScale(
          curve: Curves.ease,
          duration: CustomAnimationDurations.ultraLow,
          scale: isSelected ? 1.0 : 0.0,
          child: CommonAppIcon(
            path: AppConstants.assets.icons.checkmarkLinear,
            color: isSelected
                ? context.theme.colorScheme.primary
                : Colors.white,
            size: 16,
          ),
        ),
      ).autoElasticIn(animate: !isPurchased, forceComplete: false),
    );
  }
}

class _SelectionOverlay extends StatelessWidget {
  const _SelectionOverlay({required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: RepaintBoundary(
        child: ClipRRect(
          borderRadius: BorderRadius.all(AppConstants.style.radius.cardSmall),
          child: AnimatedOpacity(
            curve: Curves.ease,
            opacity: isSelected ? 1.0 : 0.0,
            duration: CustomAnimationDurations.ultraLow,
            child: const BubblesAnimation(),
          ),
        ),
      ),
    );
  }
}

class _PurchasedBadge extends StatelessWidget {
  const _PurchasedBadge({required this.isPurchased});

  final bool isPurchased;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 18.w,
      top: -8,
      child: RepaintBoundary(
        child:
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(42)),
                color: context.lightPrimaryContainer,
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2),
              child: Text(
                context.tr(LocaleKeys.subscription_active_plan).toUpperCase(),
                style: bodyS.copyWith(
                  fontSize: 11.sp,
                  color: context.darkTextColor.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.65,
                ),
              ),
            ).autoElasticIn(
              animate: isPurchased,
              forceComplete: false,
              sequencePos: 1,
            ),
      ),
    );
  }
}
