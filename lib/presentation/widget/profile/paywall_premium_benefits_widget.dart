import 'package:animate_do/animate_do.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:denwee/core/ads/domain/repo/ads_repo.dart';
import 'package:denwee/presentation/bloc/profile/profile_cubit.dart';
import 'package:denwee/presentation/bloc/subscriptions/user_subscription_cubit.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/scale_in_up.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/surface_container_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:el_tooltip/el_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class PaywallPremiumBenefits extends StatefulWidget {
  const PaywallPremiumBenefits({super.key});

  @override
  State<PaywallPremiumBenefits> createState() => _PaywallPremiumBenefitsState();
}

class _PaywallPremiumBenefitsState extends State<PaywallPremiumBenefits> {
  static const adTooltipDissapearDuration = Duration(milliseconds: 200);
  static final adTooltipWidth = 175.w;

  /// Average duration of a rewarded ad
  static const avgSecondsPerAd = 30;

  /// How many minutes a user spent just by viewing ads
  int? minSpentOnAds;

  bool showAdsTooltip(UserSubscriptionState state) {
    return minSpentOnAds != null && !state.isSubscribed;
  }

  @override
  void initState() {
    super.initState();
    if (!getIt<UserSubscriptionCubit>().state.isSubscribed) {
      checkAdViews();
    }
  }

  void checkAdViews() async {
    final profileId = getIt<ProfileCubit>().state.profile.toNullable()?.id;
    if (profileId == null) return;

    final result = (await getIt<AdsRepo>()
        .getTotalAdvertismentViewsCount(profileId)).getEntries();
    final viewsCount = result.$2;

    // Each ad view considered to be about 30 seconds long
    if (viewsCount != null) {
      final secondsSpent = viewsCount * avgSecondsPerAd;
      final minutes = (secondsSpent / 60).ceil();

      // Show tooltip if user has spent at least 'n' minutes on watching ads
      if (minutes >= 2 && mounted) {
        setState(() => minSpentOnAds = minutes);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Benefit(
          iconPath: AppConstants.assets.icons.checkmarkLinear,
          text: context.tr(LocaleKeys.subscription_paywall_benefits_line_1),
        ).autoScaleInUp(
          sequencePos: 2,
          slideFrom: 30,
          scaleCurve: Curves.linearToEaseOut,
          duration: CustomAnimationDurations.medium,
        ),
        _Benefit(
          iconPath: AppConstants.assets.icons.galleryLinear,
          text: context.tr(LocaleKeys.subscription_paywall_benefits_line_2),
        ).autoScaleInUp(
          sequencePos: 3,
          slideFrom: 30,
          scaleCurve: Curves.linearToEaseOut,
          duration: CustomAnimationDurations.medium,
        ),
        BlocBuilder<UserSubscriptionCubit, UserSubscriptionState>(
          builder: (context, state) => _Benefit(
            iconPath: AppConstants.assets.icons.videoPlayLinear,
            text: context.tr(LocaleKeys.subscription_paywall_benefits_line_3),
            tooltipBuilder: (child) => _buildAdTooltip(child, state),
            useRippleEffect: showAdsTooltip(state),
          ),
        ).autoScaleInUp(
          sequencePos: 4,
          slideFrom: 30,
          scaleCurve: Curves.linearToEaseOut,
          duration: CustomAnimationDurations.medium,
        ),
      ].insertBetween(14.verticalSpace),
    );
  }

  Widget _buildAdTooltip(Widget child, UserSubscriptionState state) {
    if (!showAdsTooltip(state)) return child;

    return ElTooltip(
      content: SizedBox(
        width: adTooltipWidth,
        child: Text(
          context.plural(
            LocaleKeys.subscription_paywall_benefits_ads_encourage_msg,
            minSpentOnAds!,
          ),
          style: bodyM.copyWith(
            color: context.theme.colorScheme.secondary,
            height: 1.3,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
        ),
      ),
      color: context.lightIconColor,
      radius: const Radius.circular(22),
      modalConfiguration: const ModalConfiguration(opacity: 0.4),
      disappearAnimationDuration: adTooltipDissapearDuration,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      position: getIt<UserPreferencesCubit>().state.whenLanguage(
        en: () => ElTooltipPosition.bottomStart,
        zh: () => ElTooltipPosition.bottomCenter,
      ),
      showModal: true,
      distance: 6.0,
      child: child,
    );
  }
}

class _Benefit extends StatelessWidget {
  const _Benefit({
    required this.iconPath,
    required this.text,
    this.tooltipBuilder,
    this.useRippleEffect = false,
  });

  final String iconPath;
  final String text;
  final Widget Function(Widget)? tooltipBuilder;
  final bool useRippleEffect;

  static const curve = Interval(0.5, 1.0, curve: Curves.ease);
  static const rippleDuration = Duration(milliseconds: 3000);
  static final tadaDuration = Duration(
    milliseconds: rippleDuration.inMilliseconds * 2,
  );

  @override
  Widget build(BuildContext context) {
    Widget buildBullet({Key? key}) {
      return SurfaceContainer.circle(
        key: key,
        color: Colors.white,
        size: Size.square(28.w),
        borderColor: Colors.transparent,
        child: Center(
          child: CommonAppIcon(
            path: iconPath,
            color: context.theme.colorScheme.primary,
            size: 14,
          ),
        ),
      );
    }

    Widget buildBulletPoint() {
      return AnimatedSwitcher(
        duration: CustomAnimationDurations.ultraLow,
        child: useRippleEffect
            ? AvatarGlow(
                key: const ValueKey(0),
                glowRadiusFactor: 0.95,
                curve: curve,
                duration: rippleDuration,
                child: buildBullet().tada(
                  duration: tadaDuration,
                  infinite: true,
                  curve: curve,
                ),
              )
            : buildBullet(key: const ValueKey(1)),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        tooltipBuilder?.call(buildBulletPoint()) ?? buildBulletPoint(),
        14.horizontalSpace,
        Text(
          text,
          style: bodyL.copyWith(
            fontWeight: FontWeight.bold,
            color: context.lightTextColorSecondary,
            letterSpacing: -0.2,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
