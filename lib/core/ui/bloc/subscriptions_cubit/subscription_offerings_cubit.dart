import 'package:dartz/dartz.dart';
import 'package:denwee/core/subscriptions/domain/entity/premium_packages.dart';
import 'package:denwee/core/subscriptions/domain/failure/subscriptions_failure.dart';
import 'package:denwee/core/subscriptions/domain/repo/subscriptions_repo.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

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
    autoInit();
  }

  /// If user is anonymous or authenticated on the app launch,
  /// function will init subscription offerings right away.
  /// For case when user was unauthenticated and then logged in - check [root_bloc_listeners.dart]
  Future<void> autoInit() async {
    if (_authCubit.state.isUnauthenticated) return;
    return init();
  }

  Future<void> init({bool force = false}) async {
    // Prevent race conditions
    if (state.initInProgress) return;
    
    emit(state.copyWith(
      failure: const None(),
      packages: const None(),
      initInProgress: true,
      isGettingPackages: true,
    ));

    SubscriptionsFailure? failure;
    Option<PremiumPackages> packages = const None();

    // init
    final initResult = (await _subscriptionsRepo.init(force: force)).getEntries();
    failure = initResult.$1;

    // if success
    if (initResult.$2 != null) {

      // get packages
      final packagesResult = (await _subscriptionsRepo.getPackages()).getEntries();
      failure = packagesResult.$1;

      // store packages if success
      if (packagesResult.$2 != null) {
        packages = Some(packagesResult.$2!);
      }
    }

    emit(state.copyWith(
      initInProgress: false,
      isGettingPackages: false,
      initSuccess: failure == null,
      failure: optionOf(failure),
      packages: packages,
    ));
  }

  Future<void> purchase(PremiumPackage package) async {
    if (state.isPurchaseInProgress) return;
    
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
    if (state.isPurchaseRestoring || state.isPurchaseInProgress) return;
    
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
}
