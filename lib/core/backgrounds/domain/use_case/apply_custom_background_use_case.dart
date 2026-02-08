import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:denwee/core/backgrounds/domain/entity/apply_background_body.dart';
import 'package:denwee/core/backgrounds/domain/entity/apply_background_result.dart';
import 'package:denwee/core/backgrounds/domain/entity/resolved_background_asset.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_failure.dart';
import 'package:denwee/core/backgrounds/domain/repo/backgrounds_repo.dart';
import 'package:denwee/presentation/bloc/profile/profile_cubit.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:denwee/presentation/bloc/user_statistics/user_statistics_cubit.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@LazySingleton()
class ApplyCustomBackgroundUseCase {
  final BackgroundsRepo _backgroundsRepo;
  final UserPreferencesCubit _preferencesCubit;
  final UserStatisticsCubit _statisticsCubit;
  final ProfileCubit _profileCubit;

  const ApplyCustomBackgroundUseCase(
    this._backgroundsRepo,
    this._preferencesCubit,
    this._statisticsCubit,
    this._profileCubit,
  );

  Future<Either<BackgroundFailure, (ResolvedBackgroundAsset, ApplyBackgroundResult)>> execute(ApplyBackgroundBody data) async {
    final failureOrSuccess = await _backgroundsRepo.applyBackgroundRemote(data);
    final submittedData = (failureOrSuccess.getEntries()).$2;

    if (submittedData != null) {
      unawaited(_backgroundsRepo.storeBackgroundAssetLocal(submittedData.$1));
      unawaited(_profileCubit.updateUnlockedBackgroundIds(submittedData.$2.unlockedBackgroundIds));
      unawaited(_preferencesCubit.updateSelectedBackgroundId(submittedData.$2.activeBackground.id));
      unawaited(_statisticsCubit.updateStarsBalance(submittedData.$2.starsBalance));
    }

    return failureOrSuccess;
  }
}