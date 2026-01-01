import 'package:dartz/dartz.dart';
import 'package:denwee/core/subscriptions/domain/entity/premium_packages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:denwee/core/subscriptions/domain/repo/subscriptions_repo.dart';
import 'package:denwee/core/subscriptions/domain/use_case/get_user_subscription_use_case.dart';
import 'package:denwee/core/subscriptions/domain/entity/user_subscription.dart';
import 'package:denwee/core/subscriptions/domain/failure/subscriptions_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_subscription_state.dart';
part 'user_subscription_cubit.freezed.dart';

@LazySingleton()
class UserSubscriptionCubit extends Cubit<UserSubscriptionState> {
  // ignore: unused_field
  final SubscriptionsRepo _subscriptionsRepo;
  final GetUserSubscriptionUseCase _getUserSubscriptionUseCase;
  
  UserSubscriptionCubit(
    this._subscriptionsRepo,
    this._getUserSubscriptionUseCase,
  ) : super(_initialState(_subscriptionsRepo.getSubscriptionLocal()));

  static UserSubscriptionState _initialState(Option<UserSubscription> localSubscription) {
    final nullableSubscription = localSubscription.toNullable();
    if (nullableSubscription != null && nullableSubscription.isNotExpired()) {
      return UserSubscriptionState.subscribed(nullableSubscription);
    }
    return const UserSubscriptionState.unsubscribed();
  }

  Future<void> checkSubscription() async {
    if (!state.isSubscribed) emit(const UserSubscriptionState.checkingSubscription());
    final failureOrSuccess = await _getUserSubscriptionUseCase.untilSuccess();
    emit(failureOrSuccess.fold(
      (failure) => UserSubscriptionState.failure(failure),
      (maybeSubscription) => maybeSubscription.fold(
        UserSubscriptionState.unsubscribed,
        (subscription) => UserSubscriptionState.subscribed(subscription),
      ),
    ));
  }

  Future<UserSubscriptionState> pollSubscription({PremiumPackageType? targetPackageType}) async {
    emit(const UserSubscriptionState.checkingSubscription());
    final failureOrSuccess = await _getUserSubscriptionUseCase
        .untilSubscription(targetPackageType: targetPackageType);
    final newState = failureOrSuccess.fold(
      (failure) => UserSubscriptionState.failure(failure),
      (maybeSubscription) => maybeSubscription.fold(
        UserSubscriptionState.unsubscribed,
        (subscription) => UserSubscriptionState.subscribed(subscription),
      ),
    );
    emit(newState);
    return newState;
  }

  void clearState() {
    emit(const UserSubscriptionState.unsubscribed());
  }
}
