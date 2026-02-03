// ignore_for_file: unused_field

import 'package:denwee/core/backgrounds/domain/entity/apply_background_body.dart';
import 'package:denwee/core/backgrounds/domain/entity/resolved_background_asset.dart';
import 'package:denwee/core/backgrounds/domain/failure/background_failure.dart';
import 'package:denwee/core/backgrounds/domain/repo/backgrounds_repo.dart';
import 'package:denwee/core/backgrounds/domain/use_case/apply_custom_background_use_case.dart';
import 'package:denwee/core/backgrounds/domain/use_case/apply_default_background_use_case.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'active_background_state.dart';
part 'active_background_cubit.freezed.dart';

@LazySingleton()
class ActiveBackgroundCubit extends Cubit<ActiveBackgroundState> {
  final BackgroundsRepo _backgroundsRepo;
  final ApplyDefaultBackgroundUseCase _applyDefaultBackgroundUseCase;
  final ApplyCustomBackgroundUseCase _applyCustomBackgroundUseCase;

  ActiveBackgroundCubit(
    this._backgroundsRepo,
    this._applyDefaultBackgroundUseCase,
    this._applyCustomBackgroundUseCase,
  ) : super(_initialState(_backgroundsRepo));

  static ActiveBackgroundState _initialState(BackgroundsRepo repo) {
    return repo.getBackgroundAssetLocal().fold(
      ActiveBackgroundState.defaultBackground,
      (asset) => ActiveBackgroundState.applied(
        isPurchasedViaStars: false,
        asset: asset,
      ),
    );
  }

  Future<void> applyDefaultBackground() async {
    if (state.isApplying) return;

    emit(ActiveBackgroundState.applying(
      AppConstants.config.defaultBackgroundId,
    ));

    final failureOrSuccess = await _applyDefaultBackgroundUseCase.execute();

    emit(failureOrSuccess.fold(
      ActiveBackgroundState.failure,
      (_) => const ActiveBackgroundState.defaultBackground(),
    ));
  }

  Future<void> applyCustomBackground(ApplyBackgroundBody data) async {
    if (data.backgroundId == AppConstants.config.defaultBackgroundId) return;
    if (state.isApplying) return;

    emit(ActiveBackgroundState.applying(
      data.backgroundId,
    ));

    final failureOrSuccess = await _applyCustomBackgroundUseCase.execute(data);

    emit(failureOrSuccess.fold(
      ActiveBackgroundState.failure,
      (success) => ActiveBackgroundState.applied(
        isPurchasedViaStars: success.$2.isPurchased,
        asset: success.$1,
      ),
    ));
  }

  void setCustomBackground(ResolvedBackgroundAsset asset) {
    emit(ActiveBackgroundState.applied(isPurchasedViaStars: false, asset: asset));
  }

  void clearState() {
    emit(const ActiveBackgroundState.defaultBackground());
  }
}
