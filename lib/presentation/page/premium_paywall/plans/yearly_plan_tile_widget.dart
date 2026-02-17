part of 'package:denwee/presentation/page/premium_paywall/premium_paywall_page.dart';

class _YearlyPlan extends StatelessWidget {
  const _YearlyPlan({
    required this.package,
    required this.activeSubscription,
    required this.isPurchased,
    required this.isSelected,
    required this.onTap,
    required this.discountPercent,
  });

  final PremiumPackage package;
  final UserSubscription? activeSubscription;
  final bool isPurchased;
  final bool isSelected;
  final void Function(PremiumPackage) onTap;
  final int discountPercent;

  @override
  Widget build(BuildContext context) {
    return PaywallPackageTile(
      isSelected: isSelected,
      isPurchased: isPurchased,
      onTap: () => onTap(package),
      title: _title(context),
      subtitle: _subtitle(context),
      suffixBadge: PaywallPackageDiscountBadge(
        context.tr(
          LocaleKeys.subscription_paywall_package_yearly_discount_badge,
          args: [discountPercent.toString()],
        ),
      ),
    );
  }

  String _title(BuildContext context) {
    return context.tr(LocaleKeys.subscription_paywall_package_yearly_title);
  }

  String _subtitle(BuildContext context) {
    if (isPurchased) return activeSubscription!.expiryText(context);
    return context.tr(
      LocaleKeys.subscription_paywall_package_yearly_price_string,
      args: [package.formattedPriceString],
    );
  }
}
