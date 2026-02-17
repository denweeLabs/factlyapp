part of 'package:denwee/presentation/page/premium_paywall/premium_paywall_page.dart';

class _WeeklyPlan extends StatelessWidget {
  const _WeeklyPlan({
    required this.package,
    required this.activeSubscription,
    required this.isPurchased,
    required this.isSelected,
    required this.onTap,
  });

  final PremiumPackage package;
  final UserSubscription? activeSubscription;
  final bool isPurchased;
  final bool isSelected;
  final void Function(PremiumPackage) onTap;

  @override
  Widget build(BuildContext context) {
    return PaywallPackageTile(
      isSelected: isSelected,
      isPurchased: isPurchased,
      onTap: () => onTap(package),
      title: _title(context),
      subtitle: _subtitle(context),
    );
  }

  String _title(BuildContext context) {
    return context.tr(LocaleKeys.subscription_paywall_package_weekly_title);
  }

  String _subtitle(BuildContext context) {
    if (isPurchased) return activeSubscription!.expiryText(context);
    return context.tr(
      LocaleKeys.subscription_paywall_package_weekly_price_string,
      args: [package.formattedPriceString],
    );
  }
}
