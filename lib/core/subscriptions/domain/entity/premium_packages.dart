import 'package:denwee/core/subscriptions/domain/repo/subscriptions_repo.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

part 'premium_packages.freezed.dart';

enum PremiumPackageType { monthly, yearly }

extension PremiumPackageTypeX on PremiumPackageType {
  String get packageId {
    switch (this) {
      case PremiumPackageType.monthly: return getIt<SubscriptionsRepo>().productIds.monthly;
      case PremiumPackageType.yearly: return getIt<SubscriptionsRepo>().productIds.yearly;
    }
  }
  
  String packageTitle(BuildContext context) {
    switch (this) {
      case PremiumPackageType.monthly: return context.tr(LocaleKeys.subscription_paywall_package_monthly_title);
      case PremiumPackageType.yearly: return context.tr(LocaleKeys.subscription_paywall_package_yearly_title);
    }
  }
  
  String get metaTitle {
    switch (this) {
      case PremiumPackageType.monthly: return 'Premium Subscription (Monthly)';
      case PremiumPackageType.yearly: return 'Premium Subscription (Yearly)';
    }
  }

  String perPeriod(BuildContext context) {
    switch (this) {
      case PremiumPackageType.monthly: return context.tr(LocaleKeys.subscription_paywall_package_monthly_per_period);
      case PremiumPackageType.yearly: return context.tr(LocaleKeys.subscription_paywall_package_yearly_per_period);
    }
  }

  static PremiumPackageType fromPackageId(String id) {
    final productIds = getIt<SubscriptionsRepo>().productIds;
    if (id == productIds.monthly) return PremiumPackageType.monthly;
    if (id == productIds.yearly) return PremiumPackageType.yearly;
    return PremiumPackageType.monthly;
  }
}

@freezed
abstract class PremiumPackages with _$PremiumPackages {
  const PremiumPackages._();
  const factory PremiumPackages({
    required PremiumPackage monthly,
    required PremiumPackage yearly,
  }) = _PremiumPackages;

  factory PremiumPackages.fromOfferings(Offerings offerings) {
    final monthly = offerings.current?.monthly;
    final yearly = offerings.current?.annual;

    if (monthly == null || yearly == null) {
      throw 'Packages missing';
    }

    return PremiumPackages(
      monthly: PremiumPackage(type: PremiumPackageType.monthly, data: monthly),
      yearly: PremiumPackage(type: PremiumPackageType.yearly, data: yearly),
    );
  }

  /// Returns how much yearly subscription is cheaper than monthly (in %)
  int get yearlyDiscountPercent {
    final monthlyPrice = monthly.data.storeProduct.price;
    final yearlyPrice = yearly.data.storeProduct.price;

    if (monthlyPrice <= 0 || yearlyPrice <= 0) return 0;

    final fullYearPrice = monthlyPrice * 12;
    final discount = 1 - (yearlyPrice / fullYearPrice);

    final percent = (discount * 100).clamp(0, 100);
    return percent.round();
  }
}

@freezed
abstract class PremiumPackage with _$PremiumPackage {
  const PremiumPackage._();
  const factory PremiumPackage({
    required PremiumPackageType type,
    required Package data,
  }) = _PremiumPackage;

  String title(BuildContext context) {
    return type.packageTitle(context);
  }

  String pricePeriodString(BuildContext context) {
    return '${data.storeProduct.priceString} / ${type.perPeriod(context)}';
  }
}
