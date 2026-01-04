import 'package:denwee/core/subscriptions/domain/entity/premium_packages.dart';
import 'package:denwee/core/ui/bloc/subscriptions_cubit/subscription_offerings_cubit.dart';
import 'package:denwee/core/ui/bloc/subscriptions_cubit/user_subscription_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/utils/launcher_util.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/shimmer_animation_widget.dart';
import 'package:denwee/core/ui/widget/buttons/app_solid_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/back_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/common/common_loading_widget.dart';
import 'package:denwee/core/ui/widget/common/common_pop_scope_widget.dart';
import 'package:denwee/core/ui/widget/common/common_scaffold_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/core/ui/widget/misc/fading_edge_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:denwee/pages/premium_paywall/widget/discount_badge_widget.dart';
import 'package:denwee/pages/premium_paywall/widget/footer_links_widget.dart';
import 'package:denwee/pages/premium_paywall/widget/package_tile_widget.dart';
import 'package:denwee/pages/premium_paywall/widget/premium_benefits_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

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
        case PremiumPackageType.monthly: selectedPackage = ValueNotifier(packages.monthly);
        case PremiumPackageType.yearly: selectedPackage = ValueNotifier(packages.yearly);
      }
    } else {
      selectedPackage = ValueNotifier(packages.monthly);
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
      ),
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
      ),
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
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildBenefits(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(right: 28.w),
        child: const PremiumBenefits(),
      ),
    );
  }

  Widget _buildPackages(BuildContext context, SubscriptionOfferingsState offeringsState) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: BlocBuilder<UserSubscriptionCubit, UserSubscriptionState>(
        builder: (context, userSubscriptionState) {
          // already purchased package (if present)
          final purchasedPackage = userSubscriptionState.activeSubscription
              .toNullable();

          // available packages to buy
          final packages = offeringsState.packages.toNullable()!;

          return ValueListenableBuilder(
            valueListenable: selectedPackage,
            builder: (context, selectedPackage, _) => Column(
              children: [
                PaywallPackageTile(
                  package: packages.monthly,
                  isSelected: selectedPackage == packages.monthly,
                  isPurchased: packages.monthly.type == purchasedPackage?.packageType,
                  onTap: (package) => this.selectedPackage.value = package,
                  priceBuilder: (isPurchased) => isPurchased
                      ? purchasedPackage?.expiryText(context)
                      : null,
                ),
                12.verticalSpace,
                PaywallPackageTile(
                  package: packages.yearly,
                  isSelected: selectedPackage == packages.yearly,
                  isPurchased: packages.yearly.type == purchasedPackage?.packageType,
                  onTap: (package) => this.selectedPackage.value = package,
                  priceBuilder: (isPurchased) => isPurchased
                      ? purchasedPackage?.expiryText(context)
                      : null,
                  discountBadge: PackageDiscountBadge(
                    percent: packages.yearlyDiscountPercent,
                  ),
                ),
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
        ),
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
                  text: isAlreadyPurchasedPackage
                      ? context.tr(LocaleKeys.subscription_active_plan)
                      : context.tr(LocaleKeys.subscription_upgrade_cta),
                  backgroundColors: [
                    context.lightPrimaryContainer,
                    context.lightPrimaryContainer,
                  ],
                  textColor: context.theme.colorScheme.primary,
                  ignoreTapScale: isAlreadyPurchasedPackage,
                  shadowColor: Colors.black45,
                  isBusy: isLoading,
                );
              },
            );
          },
        ),
      ),
    );
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
