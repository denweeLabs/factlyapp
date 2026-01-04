import 'package:dartz/dartz.dart';
import 'package:denwee/core/subscriptions/domain/entity/premium_packages.dart';
import 'package:denwee/core/subscriptions/domain/failure/subscriptions_failure.dart';
import 'package:denwee/core/subscriptions/domain/repo/subscriptions_repo.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'subscription_offerings_state.dart';
part 'subscription_offerings_cubit.freezed.dart';

@LazySingleton()
class SubscriptionOfferingsCubit extends Cubit<SubscriptionOfferingsState> {
  final SubscriptionsRepo _subscriptionsRepo;
  final AuthCubit _authCubit;

  SubscriptionOfferingsCubit(
    this._subscriptionsRepo, 
    this._authCubit,
  ) : super(SubscriptionOfferingsState.initial()) {
    getPackages();
    checkLogin();
  }

  Future<void> getPackages() async {
    if (state.isGettingPackages) {
      return;
    }
    emit(state.copyWith(
      failure: const None(),
      packages: const None(),
      isGettingPackages: true,
    ));
    final failureOrSuccess = await _subscriptionsRepo.getPackages();
    return emit(failureOrSuccess.fold(
      (failure) => state.copyWith(isGettingPackages: false, failure: Some(failure)),
      (success) => state.copyWith(isGettingPackages: false, packages: Some(success)),
    ));
  }

  Future<void> purchase(PremiumPackage package) async {
    if (state.isPurchaseInProgress) {
      return;
    }
    emit(state.copyWith(
      isPurchaseInProgress: true,
      purchasedPackage: const None(),
      failure: const None(),
    ));
    final failureOrSuccess = await _subscriptionsRepo.purchase(package);
    return emit(failureOrSuccess.fold(
      (failure) => state.copyWith(failure: Some(failure), isPurchaseInProgress: false),
      (success) => state.copyWith(purchasedPackage: Some(package), isPurchaseInProgress: false),
    ));
  }

  Future<void> restore() async {
    if (state.isPurchaseRestoring || state.isPurchaseInProgress) {
      return;
    }
    emit(state.copyWith(
      isPurchaseRestoring: true,
      isPurchaseRestoreSuccess: false,
      failure: const None(),
    ));
    final failureOrSuccess = await _subscriptionsRepo.restore();
    return emit(failureOrSuccess.fold(
      (failure) => state.copyWith(failure: Some(failure), isPurchaseRestoring: false),
      (success) => state.copyWith(isPurchaseRestoreSuccess: true, isPurchaseRestoring: false),
    ));
  }

  /// If user logged in to the app, RevenueCat must know "user_id" whose purchases will be linked to.
  /// This function double-checks that RevenueCat knows this "user_id"
  Future<void> checkLogin() async {
    if (_authCubit.state.isUnauthenticated) {
      return;
    }
    final isIdValid = await _subscriptionsRepo.isCurrentUserIdValid;
    if (!isIdValid) await _subscriptionsRepo.login();
  }
}
