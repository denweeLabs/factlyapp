import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:denwee/core/backgrounds/domain/entity/active_background.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resolved_background_asset.freezed.dart';

@freezed
abstract class ResolvedBackgroundAsset with _$ResolvedBackgroundAsset {
  const factory ResolvedBackgroundAsset({
    required ActiveBackground background,
    required File visualFile,
    required Option<File> audioFile,
  }) = _ResolvedBackgroundAsset;
}
