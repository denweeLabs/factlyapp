import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:denwee/core/subscriptions/domain/entity/user_subscription.dart';
import 'package:denwee/core/ui/bloc/subscriptions_cubit/user_subscription_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/router/root_router.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/widget/animations/animated_icons/sparkles_animated_icon_widget.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/buttons/app_solid_button_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final decoration = ShapeDecoration(
      shape: RoundedSuperellipseBorder(
        borderRadius: BorderRadius.all(AppConstants.style.radius.cardMedium),
        side: BorderSide(color: context.theme.dividerColor),
      ),
      shadows: [AppConstants.style.colors.commonShadow],
      color: context.primaryContainer,
    );

    return GestureDetector(
      onTap: () => _onTap(context),
      child: DecoratedBox(
        decoration: decoration,
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 24.h, 20.w, 24.h),
          child: BlocBuilder<UserSubscriptionCubit, UserSubscriptionState>(
            builder: (context, userSubscriptionState) {
              final activeSubscription = userSubscriptionState
                  .activeSubscription
                  .toNullable();

              return AnimatedSwitcherPlus.flipX(
                duration: CustomAnimationDurations.low,
                switchOutCurve: const Interval(0.0, 0.5),
                switchInCurve: const Interval(0.5, 1.0),
                child: _buildBody(
                  context: context,
                  activeSubscription: activeSubscription,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody({
    required BuildContext context,
    required UserSubscription? activeSubscription,
  }) {
    final isSubscribed = activeSubscription != null;

    return Row(
      key: ValueKey(isSubscribed),
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context: context, isSubscribed: isSubscribed),
              2.verticalSpace,
              _buildSubtitle(
                context: context,
                expiryText: activeSubscription
                    ?.expiryText(context)
                    .toUpperCase(),
              ),
            ],
          ),
        ),
        8.horizontalSpace,
        AppSolidButton(
          width: null,
          onTap: () => _onTap(context),
          text: isSubscribed
              ? context.tr(LocaleKeys.subscription_active_plan).toUpperCase()
              : context.tr(LocaleKeys.subscription_upgrade_cta).toUpperCase(),
          isShimmering: true,
          buttonHeight: 34.h,
          hideShadow: true,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
        ),
      ],
    );
  }

  Widget _buildTitle({
    required BuildContext context,
    required bool isSubscribed,
  }) {
    if (isSubscribed) {
      return Row(
        children: [
          Text(
            context.tr(LocaleKeys.subscription_premium_plan),
            style: h4.copyWith(
              color: context.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          4.horizontalSpace,
          const SparklesAnimatedIcon(animate: true),
        ],
      );
    }

    return Text(
      context.tr(LocaleKeys.subscription_basic_plan),
      style: h4.copyWith(color: context.textColor, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSubtitle({
    required BuildContext context,
    required String? expiryText,
  }) {
    return Text(
      expiryText ??
          context.tr(LocaleKeys.subscription_active_plan).toUpperCase(),
      style: textButton.copyWith(
        fontSize: 11.sp,
        letterSpacing: 0.65,
        color: context.textColor.withValues(alpha: 0.3),
      ),
    );
  }

  void _onTap(BuildContext context) {
    context.restorablePushNamedArgs(Routes.premiumPaywall, rootNavigator: true);
  }
}
