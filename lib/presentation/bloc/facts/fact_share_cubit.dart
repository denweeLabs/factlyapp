import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:denwee/core/backgrounds/domain/entity/resolved_background_asset.dart';
import 'package:denwee/core/facts/domain/util/share/fact_capture_util.dart';
import 'package:denwee/core/facts/domain/util/share/compositor/fact_share_compositor.dart';
import 'package:denwee/core/facts/domain/util/share/fact_shares_storage.dart';
import 'package:denwee/core/network/domain/entity/common_api_failure.dart';
import 'package:denwee/presentation/bloc/backgrounds/active_background_cubit.dart';
import 'package:denwee/presentation/widget/shared/sheets/fact_share/fact_share_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'fact_share_state.dart';
part 'fact_share_cubit.freezed.dart';

@LazySingleton()
class FactShareCubit extends Cubit<FactShareState> {
  final FactCaptureUtil _captureUtil;
  final FactShareCompositor _shareCompositor;
  final FactSharesStorage _sharesStorage;
  final ActiveBackgroundCubit _activeBackgroundCubit;

  FactShareCubit(
    this._captureUtil,
    this._shareCompositor,
    this._sharesStorage,
    this._activeBackgroundCubit,
  ) : super(const FactShareState.initial());

  static const layoutPrepareDuration = Duration(milliseconds: 200);
  static const capturePrepareDuration = Duration(milliseconds: 300);
  static const capturePixelRatio = 3.0;

  final factPageRepaintKey = GlobalKey();
  final factOverlayRepaintKey = GlobalKey();

  Future<Option<File>> share(FactShareSupportedTarget target) async {
    if (state.isBusy) {
      return const None();
    }
    try {
      final file = await _activeBackgroundCubit.state.appliedBackground.fold(
        () => _prepareWDefaultBackground(target: target),
        (bg) => _prepareWCustomBackground(background: bg, target: target),
      );
      return Some(file);
    } catch (error) {
      debugPrint('FactShareCubit prepare error: $error');
      emit(const FactShareState.failure(CommonApiFailure.unexpected));
      return const None();
    }
  }

  Future<File> _prepareWDefaultBackground({
    required FactShareSupportedTarget target,
  }) async {
    await prepareCaptureState(area: FactCaptureArea.page, target: target);

    final overlay = await _captureUtil.render(
      key: factPageRepaintKey,
      pixelRatio: FactShareCubit.capturePixelRatio,
    );

    final file = await _sharesStorage.save(overlay);

    emit(FactShareState.success(file));

    return file;
  }

  Future<File> _prepareWCustomBackground({
    required ResolvedBackgroundAsset background,
    required FactShareSupportedTarget target,
  }) async {
    await prepareCaptureState(area: FactCaptureArea.fact, target: target);

    final overlay = await _captureUtil.render(
      key: factOverlayRepaintKey,
      pixelRatio: FactShareCubit.capturePixelRatio,
    );

    final file = await _shareCompositor.compose(
      overlay: overlay,
      background: background,
    );

    emit(FactShareState.success(file));

    return file;
  }

  void clearState() {
    emit(const FactShareState.initial());
  }

  Future<void> prepareCaptureState({
    required FactCaptureArea area,
    required FactShareSupportedTarget target,
  }) async {
    emit(FactShareState.preparing(area, target));
    await Future<void>.delayed(capturePrepareDuration);
    emit(FactShareState.capturing(area, target));
  }
}
