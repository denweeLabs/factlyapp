import 'dart:async';

import 'package:denwee/core/facts/domain/entity/daily_facts_bucket.dart';
import 'package:denwee/core/facts/domain/entity/facts_failure.dart';
import 'package:denwee/core/facts/domain/repo/daily_facts_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetDailyFactsBucketUseCase {
  final DailyFactsRepo _dailyFactsRepo;
  final UserPreferencesCubit _preferencesCubit;

  const GetDailyFactsBucketUseCase(
    this._dailyFactsRepo,
    this._preferencesCubit,
  );

  Future<Either<FactsFailure, DailyFactsBucket>> execute({
    String? languageCode,
    List<String>? interests,
  }) async {
    final effectiveLanguageCode = languageCode ?? _preferencesCubit.state.preferences.language.languageCode;
    final effectiveInterests = interests ?? _preferencesCubit.state.preferences.interests.map((e) => e.id.stringValue).toList();

    final failureOrSuccess = await _dailyFactsRepo.getBucketRemote(
      languageCode: effectiveLanguageCode,
      interests: effectiveInterests,
    );
    final bucket = failureOrSuccess.fold((_) => null, (bucket) => bucket);

    if (bucket != null) {
      await _dailyFactsRepo.storeBucketLocal(bucket);
    }

    return failureOrSuccess.map((bucket) => bucket.normalized());
  }
}
