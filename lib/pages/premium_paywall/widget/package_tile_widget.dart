import 'package:denwee/core/subscriptions/domain/entity/premium_packages.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/elastic_in.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_fade_animation.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/core/ui/widget/misc/bubbles_animation_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaywallPackageTile extends StatelessWidget {
  const PaywallPackageTile({
    super.key,
    required this.package,
    required this.onTap,
    required this.isSelected,
    required this.isPurchased,
    this.discountBadge,
    this.priceBuilder,
  });

  final PremiumPackage package;
  final void Function(PremiumPackage) onTap;
  final Widget? discountBadge;
  final String? Function(bool isPurchased)? priceBuilder;
  final bool isPurchased;
  final bool isSelected;

  static const unselectedBorderColor = Colors.white38;

  @override
  Widget build(BuildContext context) {
    final borderColor = isSelected ? Colors.white : unselectedBorderColor;
    final color = context.theme.colorScheme.primary.withValues(
      alpha: _getBackgroundColorOpacity(),
    );

    return BounceTapFadeAnimation(
      onTap: () => onTap(package),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BackdropSurfaceContainer.ellipse(
            borderColor: borderColor,
            color: color,
            borderRadius: BorderRadius.all(AppConstants.style.radius.cardSmall),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              package.title(context),
                              style: h4.copyWith(
                                color: context.lightTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (discountBadge != null) ...[
                              8.horizontalSpace,
                              discountBadge!,
                            ],
                          ],
                        ),
                        Text(
                          priceBuilder?.call(isPurchased) ??
                              package.pricePeriodString(context),
                          style: bodyM.copyWith(
                            color: context.lightTextColorSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    width: 26.w,
                    height: 26.w,
                    curve: Curves.ease,
                    duration: CustomAnimationDurations.ultraLow,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: isSelected ? 1.0 : 0.0),
                      border: Border.all(color: unselectedBorderColor),
                    ),
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
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
                    ),
                  ).autoElasticIn(animate: !isPurchased, forceComplete: false),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                AppConstants.style.radius.cardSmall,
              ),
              child: AnimatedOpacity(
                curve: Curves.ease,
                opacity: isSelected ? 1.0 : 0.0,
                duration: CustomAnimationDurations.ultraLow,
                child: const BubblesAnimation(),
              ),
            ),
          ),
          Positioned(
            right: 18.w,
            top: -10.0,
            child:
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(42)),
                    color: context.lightPrimaryContainer,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.0),
                  child: Center(
                    child: Text(
                      context
                          .tr(LocaleKeys.subscription_active_plan)
                          .toUpperCase(),
                      style: bodyS.copyWith(
                        fontSize: 11.sp,
                        color: context.darkTextColor.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.65,
                      ),
                    ),
                  ),
                ).autoElasticIn(
                  animate: isPurchased,
                  forceComplete: false,
                  sequencePos: 1,
                ),
          ),
        ],
      ),
    );
  }

  double _getBackgroundColorOpacity() {
    if (isPurchased) return 0.9;
    if (isSelected) return 0.6;
    return 0.0;
  }
}
