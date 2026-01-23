part of 'user_subscription_cubit.dart';

@freezed
abstract class UserSubscriptionState with _$UserSubscriptionState {
  const UserSubscriptionState._();
  const factory UserSubscriptionState.checkingSubscription() = _CheckingSubscription;
  const factory UserSubscriptionState.unsubscribed() = _Unsubscribed;
  const factory UserSubscriptionState.subscribed(UserSubscription subscription) = _Subscribed;
  const factory UserSubscriptionState.failure(SubscriptionsFailure failure) = _Failure;

  bool get isLoading =>
      maybeWhen(checkingSubscription: () => true, orElse: () => false);

  bool get isSubscribed =>
      maybeWhen(subscribed: (_) => true, orElse: () => false);

  Option<UserSubscription> get activeSubscription => maybeWhen(
    subscribed: (subscription) => Some(subscription),
    orElse: () => const None(),
  );
}
