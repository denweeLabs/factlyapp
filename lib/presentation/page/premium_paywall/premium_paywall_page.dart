import 'package:denwee/core/subscriptions/domain/entity/premium_packages.dart';
import 'package:denwee/core/subscriptions/domain/entity/user_subscription.dart';
import 'package:denwee/presentation/bloc/subscriptions/subscription_offerings_cubit.dart';
import 'package:denwee/presentation/bloc/subscriptions/user_subscription_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/utils/dialogs_util.dart';
import 'package:denwee/presentation/shared/utils/haptic_util.dart';
import 'package:denwee/presentation/shared/utils/launcher_util.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/elastic_in.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in_left.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in_right.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in_up.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/scale_in_up.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/animations/shimmer_animation_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/app_solid_button_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/back_button_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_loading_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_pop_scope_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_scaffold_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/fading_edge_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/widget/profile/paywall_discount_badge_widget.dart';
import 'package:denwee/presentation/widget/profile/paywall_footer_links_widget.dart';
import 'package:denwee/presentation/widget/profile/paywall_package_tile_widget.dart';
import 'package:denwee/presentation/widget/profile/paywall_premium_benefits_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

part 'plans/weekly_plan_tile_widget.dart';
part 'plans/monthly_plan_tile_widget.dart';
part 'plans/yearly_plan_tile_widget.dart';

class PremiumPaywallPage extends StatefulWidget {
  const PremiumPaywallPage({super.key});

  static const routeName = 'PremiumPaywallPage';

  @override
  State<PremiumPaywallPage> createState() => _PremiumPaywallPageState();
}

class _PremiumPaywallPageState extends State<PremiumPaywallPage> {
  late ValueNotifier<PremiumPackage?> selectedPackage;

  @override
  void initState() {
    super.initState();
    initPackagesData();
  }

  @override
  void dispose() {
    selectedPackage.dispose();
    super.dispose();
  }

  void initPackagesData() {
    final packages = getIt<SubscriptionOfferingsCubit>().state.packages
        .toNullable();

    if (packages == null) {
      getIt<SubscriptionOfferingsCubit>().getPackages();
      selectedPackage = ValueNotifier(null);
      return;
    }

    final activeSubscription = getIt<UserSubscriptionCubit>()
        .state
        .activeSubscription
        .toNullable();

    if (activeSubscription != null) {
      switch (activeSubscription.packageType) {
        case PremiumPackageType.weekly: selectedPackage = ValueNotifier(packages.weekly);
        case PremiumPackageType.monthly: selectedPackage = ValueNotifier(packages.monthly);
        case PremiumPackageType.yearly: selectedPackage = ValueNotifier(packages.yearly);
      }
    } else {
      selectedPackage = ValueNotifier(packages.weekly);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonPopScope(
      onWillPop: Navigator.of(context).pop,
      child: CommonScaffold(
        systemOverlayType: ThemeType.dark,
        style: CommonBackgroundStyle.colored,
        body: BlocConsumer<SubscriptionOfferingsCubit, SubscriptionOfferingsState>(
          listener: (_, __) => initPackagesData(),
          listenWhen: (p, c) => p.packages.isNone() && c.packages.isSome(),
          builder: (context, offeringsState) => AnimatedSwitcher(
            duration: CustomAnimationDurations.ultraLow,
            child: _buildBody(offeringsState),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(SubscriptionOfferingsState state) {
    if (state.isGettingPackages) {
      return Center(
        key: const ValueKey(0),
        child: CommonLoading(color: context.lightIconColor),
      );
    }

    if (state.packages.isNone()) {
      return Center(
        key: const ValueKey(1),
        child: BackdropSurfaceContainer.circle(
          onTap: initPackagesData,
          borderColor: Colors.white70,
          size: Size.square(62.h),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: CommonAppIcon(
                path: AppConstants.assets.icons.refresh2Linear,
                color: context.lightIconColor,
                size: 24,
              ),
            ),
          ),
        ),
      );
    }
    
    return Stack(
      key: const ValueKey(2),
      children: [
        FadingEdge(
          axis: Axis.vertical,
          stops: const [0.0, 0.15, 0.77, 1.0],
          child: ListView(
            padding: EdgeInsets.only(
              top: context.topPadding,
              bottom: context.bottomPadding + 168.h,
            ),
            children: [
              _buildCloseButton(context),
              4.verticalSpace,
              _buildPlanName(context),
              38.verticalSpace,
              _buildHeaderTitle(context),
              42.verticalSpace,
              _buildBenefits(context),
              42.verticalSpace,
              _buildPackages(context, state),
              42.verticalSpace,
              _buildLinkFooterButtons(context),
            ],
          ),
        ),
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: context.bottomPadding + 28.h,
          child: _buildSubscribeButton(state),
        ),
      ],
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: AppBackButton(
        size: 20,
        type: AppBackButtonType.cross,
        color: context.lightIconColorSecondary,
        padding: EdgeInsets.fromLTRB(24.w, 24.h, 32.w, 0.0),
      ).autoFadeIn(sequencePos: 5),
    );
  }

  Widget _buildPlanName(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          BackdropSurfaceContainer.ellipse(
            onTap: HapticUtil.heavy,
            onLongTap: HapticUtil.heavy,
            color: Colors.white.withValues(alpha: 0.08),
            borderColor: Colors.white24,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: Text(
                context.tr(LocaleKeys.subscription_premium_plan).toUpperCase(),
                style: textButton.copyWith(color: context.lightTextColor),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BackdropSurfaceContainer.defaultBorderRadius,
              child: const ShimmerAnimation(),
            ),
          ),
        ],
      ).autoFadeIn(sequencePos: 3),
    );
  }

  Widget _buildHeaderTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Text(
        context.tr(LocaleKeys.subscription_paywall_title),
        style: h1.copyWith(
          color: context.lightTextColor,
          fontWeight: FontWeight.w900,
          fontFamily: AppConstants.style.textStyle.secondaryFontFamiliy,
        ),
        textAlign: TextAlign.center,
      ).autoScaleInUp(sequencePos: 1, slideFrom: 40),
    );
  }

  Widget _buildBenefits(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(right: 28.w),
        child: const PaywallPremiumBenefits(),
      ),
    );
  }

  Widget _buildPackages(BuildContext context, SubscriptionOfferingsState offeringsState) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: BlocBuilder<UserSubscriptionCubit, UserSubscriptionState>(
        builder: (context, userSubscriptionState) {
          // already purchased package (if present)
          final activeSubscription = userSubscriptionState.activeSubscription
              .toNullable();

          // available packages to buy
          final packages = offeringsState.packages.toNullable()!;

          return ValueListenableBuilder(
            valueListenable: selectedPackage,
            builder: (context, selectedPackage, _) => Column(
              children: [
                _YearlyPlan(
                  package: packages.yearly,
                  activeSubscription: activeSubscription,
                  isPurchased: packages.yearly.type == activeSubscription?.packageType,
                  isSelected: selectedPackage == packages.yearly,
                  onTap: (package) => this.selectedPackage.value = package,
                  discountPercent: packages.yearlyDiscountPercentVersusWeekly,
                ).autoFadeInRight(sequencePos: 5, slideFrom: 50),

                12.verticalSpace,

                _WeeklyPlan(
                  package: packages.weekly,
                  activeSubscription: activeSubscription,
                  isPurchased: packages.weekly.type == activeSubscription?.packageType,
                  isSelected: selectedPackage == packages.weekly,
                  onTap: (package) => this.selectedPackage.value = package,
                ).autoFadeInLeft(sequencePos: 5, slideFrom: 50),

                if (packages.monthly != null) ...[
                  12.verticalSpace,

                  _MonthlyPlan(
                    package: packages.monthly!,
                    activeSubscription: activeSubscription,
                    isPurchased: packages.monthly!.type == activeSubscription?.packageType,
                    isSelected: selectedPackage == packages.monthly,
                    onTap: (package) => this.selectedPackage.value = package,
                  ).autoFadeInUp(sequencePos: 5, slideFrom: 20),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLinkFooterButtons(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: PaywallFooterLinks(
          onRestore: _onRestore,
          onPrivacy: _onPrivacy,
          onTerms: _onTerms,
        ).autoFadeIn(sequencePos: 7),
      ),
    );
  }

  Widget _buildSubscribeButton(SubscriptionOfferingsState offeringsState) {
    return Center(
      child: SizedBox(
        width: 0.6.sw,
        child: ValueListenableBuilder(
          valueListenable: selectedPackage,
          builder: (context, selectedPackage, _) {
            return BlocBuilder<UserSubscriptionCubit, UserSubscriptionState>(
              builder: (context, userSubscriptionState) {
                // already purchased package (if present)
                final purchasedPackage = userSubscriptionState
                    .activeSubscription
                    .toNullable();

                // if currently selected package has already been purchased
                final isAlreadyPurchasedPackage =
                    selectedPackage?.type == purchasedPackage?.packageType;

                // loading state
                final isLoading =
                    offeringsState.isPurchaseInProgress ||
                    offeringsState.isPurchaseRestoring ||
                    userSubscriptionState.isLoading;

                return AppSolidButton(
                  onTap: _onUpgrade,
                  text: _upgradeButtonText(isAlreadyPurchasedPackage),
                  backgroundColors: [
                    context.lightPrimaryContainer,
                    context.lightPrimaryContainer,
                  ],
                  textColor: context.theme.colorScheme.primary,
                  ignoreTapScale: isAlreadyPurchasedPackage,
                  shadowColor: Colors.black45,
                  isBusy: isLoading,
                ).autoElasticIn(sequencePos: 6);
              },
            );
          },
        ),
      ),
    );
  }

  String _upgradeButtonText(bool isAlreadyPurchasedPackage) {
    if (isAlreadyPurchasedPackage) {
      return context.tr(LocaleKeys.subscription_active_plan);
    }
    if (selectedPackage.value?.type == PremiumPackageType.weekly) {
      return context.tr(LocaleKeys.subscription_trial_cta);
    }
    return context.tr(LocaleKeys.subscription_upgrade_cta);
  }

  void _onPrivacy() {
    LauncherUtil.launchPrivacyPolicy(context);
  }

  void _onTerms() {
    LauncherUtil.launchTermsOfUse(context);
  }

  void _onRestore() {
    getIt<SubscriptionOfferingsCubit>().restore();
  }

  void _onUpgrade() async {
    if (selectedPackage.value == null) return;
    
    final activeSubscription = getIt<UserSubscriptionCubit>()
        .state
        .activeSubscription
        .toNullable();
    final isAlreadyPurchasedPackage =
        selectedPackage.value?.type == activeSubscription?.packageType;

    // do not allow to buy already purchased package
    if (isAlreadyPurchasedPackage) {
      return;
    }

    // perform purchase right away if user does not have any other active subscription
    if (activeSubscription == null) {
      return getIt<SubscriptionOfferingsCubit>().purchase(
        selectedPackage.value!,
      );
    }

    // show warning message about packages switch
    final result = await AppDialogs.showSubscriptionSwitchWarningDialog(context);

    // confirm user's acknowledge
    if (result == true) {
      return getIt<SubscriptionOfferingsCubit>().purchase(
        selectedPackage.value!,
      );
    } 
  }
}
