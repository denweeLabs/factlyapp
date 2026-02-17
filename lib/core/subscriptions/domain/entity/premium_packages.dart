import 'package:denwee/core/subscriptions/domain/repo/subscriptions_repo.dart';
import 'package:denwee/di/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

part 'premium_packages.freezed.dart';

enum PremiumPackageType { weekly, monthly, yearly }

extension PremiumPackageTypeX on PremiumPackageType {
  String get packageId {
    switch (this) {
      case PremiumPackageType.weekly: return getIt<SubscriptionsRepo>().productIds.weekly;
      case PremiumPackageType.monthly: return getIt<SubscriptionsRepo>().productIds.monthly;
      case PremiumPackageType.yearly: return getIt<SubscriptionsRepo>().productIds.yearly;
    }
  }

  String get metaTitle {
    switch (this) {
      case PremiumPackageType.weekly: return 'Premium Subscription (Weekly)';
      case PremiumPackageType.monthly: return 'Premium Subscription (Monthly)';
      case PremiumPackageType.yearly: return 'Premium Subscription (Yearly)';
    }
  }

  static PremiumPackageType fromPackageId(String id) {
    final productIds = getIt<SubscriptionsRepo>().productIds;
    if (id == productIds.weekly) return PremiumPackageType.weekly;
    if (id == productIds.monthly) return PremiumPackageType.monthly;
    if (id == productIds.yearly) return PremiumPackageType.yearly;
    return PremiumPackageType.weekly;
  }
}

@freezed
abstract class PremiumPackages with _$PremiumPackages {
  const PremiumPackages._();
  const factory PremiumPackages({
    required PremiumPackage weekly,
    required PremiumPackage? monthly,
    required PremiumPackage yearly,
  }) = _PremiumPackages;

  factory PremiumPackages.fromOfferings(Offerings offerings) {
    final weekly = offerings.current?.weekly;
    final monthly = offerings.current?.monthly;
    final yearly = offerings.current?.annual;

    if (weekly == null || yearly == null) {
      throw 'Packages missing';
    }

    return PremiumPackages(
      weekly: PremiumPackage(type: PremiumPackageType.weekly, data: weekly),
      monthly: monthly != null
          ? PremiumPackage(type: PremiumPackageType.monthly, data: monthly)
          : null,
      yearly: PremiumPackage(type: PremiumPackageType.yearly, data: yearly),
    );
  }

  /// Returns how much yearly subscription is cheaper than monthly (in %)
  int get yearlyDiscountPercentVersusMonthly {
    if (monthly == null) return 0;
    
    final monthlyPrice = monthly!.data.storeProduct.price;
    final yearlyPrice = yearly.data.storeProduct.price;

    if (monthlyPrice <= 0 || yearlyPrice <= 0) return 0;

    final fullYearPrice = monthlyPrice * 12;
    final discount = 1 - (yearlyPrice / fullYearPrice);

    final percent = (discount * 100).clamp(0, 100);
    return percent.round();
  }

  /// Returns how much yearly subscription is cheaper than weekly (in %)
  int get yearlyDiscountPercentVersusWeekly {
    final weeklyPrice = weekly.data.storeProduct.price;
    final yearlyPrice = yearly.data.storeProduct.price;

    if (weeklyPrice <= 0 || yearlyPrice <= 0) return 0;

    final fullYearPrice = weeklyPrice * 52;
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

  String get formattedPriceString {
    final product = data.storeProduct;

    final price = product.price;
    final currencyCode = product.currencyCode;

    if (price <= 0 || currencyCode.isEmpty) {
      return product.priceString;
    }

    final format = NumberFormat.simpleCurrency(
      name: currencyCode,
      decimalDigits: price.truncateToDouble() == price ? 0 : 2,
      locale: 'en',
    );

    return format.format(price);
  }
}
