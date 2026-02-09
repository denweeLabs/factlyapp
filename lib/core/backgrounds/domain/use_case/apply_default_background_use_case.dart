import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_failure.dart';
import 'package:denwee/core/backgrounds/domain/repo/backgrounds_repo.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ApplyDefaultBackgroundUseCase {
  final BackgroundsRepo _backgroundsRepo;
  final UserPreferencesCubit _preferencesCubit;

  const ApplyDefaultBackgroundUseCase(
    this._backgroundsRepo,
    this._preferencesCubit,
  );

  Future<Either<BackgroundFailure, Unit>> execute() async {
    final defaultId = AppConstants.config.defaultBackgroundId;
    final failureOrSuccess = await _backgroundsRepo.resetBackgroundRemote();
    if (failureOrSuccess.isRight()) {
      unawaited(_preferencesCubit.updateSelectedBackgroundId(defaultId));
      unawaited(_backgroundsRepo.deleteBackgroundAssetLocal());
    }
    return failureOrSuccess;
  }
}