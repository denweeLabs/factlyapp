// ignore_for_file: unused_field

import 'package:dartz/dartz.dart';
import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_style.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_failure.dart';
import 'package:denwee/core/backgrounds/domain/repo/backgrounds_repo.dart';
import 'package:denwee/core/backgrounds/domain/use_case/get_available_backgrounds_use_case.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'available_backgrounds_state.dart';
part 'available_backgrounds_cubit.freezed.dart';

@LazySingleton()
class AvailableBackgroundsCubit extends Cubit<AvailableBackgroundsState> {
  final BackgroundsRepo _backgroundsRepo;
  final GetAvailableBackgroundsUseCase _getAvailableBackgroundsUseCase;

  AvailableBackgroundsCubit(
    this._backgroundsRepo,
    this._getAvailableBackgroundsUseCase,
  ) : super(_initialState(_backgroundsRepo));

  static AvailableBackgroundsState _initialState(BackgroundsRepo repo) {
    final backgrounds = repo.getBackgroundsLocal();
    return backgrounds.isEmpty
        ? const AvailableBackgroundsState.empty()
        : AvailableBackgroundsState.success(backgrounds);
  }

  Future<void> checkBackgrounds() async {
    if (state.backgrounds.isEmpty) {
      emit(const AvailableBackgroundsState.loading());
    }

    final failureOrSuccess = await _getAvailableBackgroundsUseCase.execute();

    emit(failureOrSuccess.fold(
      (failure) => state.backgrounds.isNotEmpty ? state : AvailableBackgroundsState.failure(failure),
      (success) => AvailableBackgroundsState.success(success),
    ));
  }

  Future<void> updateBackgroundStyle({
    required UniqueId backgroundId,
    required BackgroundStyle style,
  }) async {
    if (backgroundId == AppConstants.config.defaultBackgroundId) {
      return;
    }
    emit(state.maybeWhen(
      success: (backgrounds) {
        final updatedBackgrounds = [...state.backgrounds].map((e) {
          return e.id == backgroundId ? e.copyWith(style: style) : e;
        }).toList();
        return AvailableBackgroundsState.success(updatedBackgrounds);
      },
      orElse: () => state,
    ));
  }

  void clearState() {
    emit(const AvailableBackgroundsState.empty());
  }
}
