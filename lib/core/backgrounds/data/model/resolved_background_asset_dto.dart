import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:denwee/core/backgrounds/data/model/active_background_dto.dart';
import 'package:denwee/core/backgrounds/domain/entity/resolved_background_asset.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resolved_background_asset_dto.g.dart';

@JsonSerializable(includeIfNull: false)
@immutable
class ResolvedBackgroundAssetDto {
  @JsonKey(name: 'active_background') final ActiveBackgroundDto activeBackground;
  @JsonKey(name: 'visual_file_path') final String visualFilePath;
  @JsonKey(name: 'audio_file_path') final String? audioFilePath;

  const ResolvedBackgroundAssetDto({
    required this.activeBackground,
    required this.visualFilePath,
    required this.audioFilePath,
  });

  factory ResolvedBackgroundAssetDto.fromDomain(ResolvedBackgroundAsset asset) {
    return ResolvedBackgroundAssetDto(
      activeBackground: ActiveBackgroundDto.fromDomain(asset.background),
      visualFilePath: asset.visualFile.path,
      audioFilePath: asset.audioFile.toNullable()?.path,
    );
  }

  ResolvedBackgroundAsset toDomain() {
    return ResolvedBackgroundAsset(
      background: activeBackground.toDomain(),
      visualFile: File(visualFilePath),
      audioFile: Option.when(audioFilePath != null, File(audioFilePath ?? '')),
    );
  }

  factory ResolvedBackgroundAssetDto.fromJson(Map<String, dynamic> json) =>
      _$ResolvedBackgroundAssetDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResolvedBackgroundAssetDtoToJson(this);
}
