import 'package:dartz/dartz.dart';
import 'package:denwee/core/statistics/domain/repo/analytics_repo.dart';
import 'package:denwee/core/subscriptions/domain/failure/subscriptions_failure.dart';
import 'package:denwee/core/subscriptions/domain/repo/subscriptions_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RestoreSubscriptionUseCase {
  final SubscriptionsRepo _subscriptionsRepo;
  final AnalyticsRepo _analyticsRepo;

  const RestoreSubscriptionUseCase(
    this._subscriptionsRepo,
    this._analyticsRepo,
  );

  Future<Either<SubscriptionsFailure, Unit>> execute() async {
    final failureOrSuccess = await _subscriptionsRepo.restore();
    if (failureOrSuccess.isRight()) {
      _analyticsRepo.logSubscriptionRestore();
    }
    return failureOrSuccess;
  }
}