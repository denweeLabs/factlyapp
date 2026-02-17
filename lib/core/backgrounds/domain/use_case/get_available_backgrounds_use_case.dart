import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/resolved_background_asset.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_failure.dart';
import 'package:denwee/core/backgrounds/domain/repo/backgrounds_repo.dart';
import 'package:denwee/presentation/bloc/backgrounds/active_background_cubit.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@LazySingleton()
class GetAvailableBackgroundsUseCase {
  final BackgroundsRepo _backgroundsRepo;
  final UserPreferencesCubit _preferencesCubit;
  final ActiveBackgroundCubit _activeBackgroundCubit;

  const GetAvailableBackgroundsUseCase(
    this._backgroundsRepo,
    this._preferencesCubit,
    this._activeBackgroundCubit,
  );

  Future<Either<BackgroundFailure, (Option<ResolvedBackgroundAsset>, List<AvailableBackground>)>> execute() async {
    final languageCode = _preferencesCubit.state.preferences.language.languageCode;
    final failureOrSuccess = await _backgroundsRepo.getBackgroundsRemote(
      languageCode: languageCode,
    );
    final (failure, (tuple)) = failureOrSuccess.getEntries();
    final activeBackground = tuple?.$1.toNullable();
    final availableBackgrounds = tuple?.$2 ?? const <AvailableBackground>[];
    
    if (failure == null) {
      if (activeBackground != null) {
        unawaited(_activeBackgroundCubit.setCustomBackground(activeBackground));
        unawaited(_backgroundsRepo.storeBackgroundAssetLocal(activeBackground));
      } else {
        unawaited(_activeBackgroundCubit.clearState());
        unawaited(_backgroundsRepo.deleteBackgroundAssetLocal());
      }
    }

    if (availableBackgrounds.isNotEmpty) {
      unawaited(_backgroundsRepo.storeBackgroundsLocal(availableBackgrounds));
    }

    return failureOrSuccess;
  }
}