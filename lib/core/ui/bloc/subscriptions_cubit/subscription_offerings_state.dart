part of 'subscription_offerings_cubit.dart';

@freezed
abstract class SubscriptionOfferingsState with _$SubscriptionOfferingsState {
  const factory SubscriptionOfferingsState({
    @Default(false) bool initSuccess,
    @Default(false) bool initInProgress,
    @Default(false) bool isPurchaseInProgress,
    @Default(false) bool isGettingPackages,
    @Default(false) bool isPurchaseRestoring,
    @Default(false) bool isPurchaseRestoreSuccess,
    @Default(None()) Option<PremiumPackages> packages,
    @Default(None()) Option<PremiumPackage> purchasedPackage,
    @Default(None()) Option<SubscriptionsFailure> failure,
  }) = _SubscriptionOfferingsState;

  factory SubscriptionOfferingsState.initial() =>
      const SubscriptionOfferingsState();
}
