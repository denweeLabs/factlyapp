import 'package:dartz/dartz.dart';
import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_asset.dart';
import 'package:denwee/core/network/domain/entity/network_link.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'background_asset_dto.g.dart';

@JsonSerializable(includeIfNull: false)
@immutable
class BackgroundAssetDto {
  final String path;
  final String type;
  final int version;
  final String url;
  @JsonKey(name: 'has_sound') final bool hasSound;
  @JsonKey(name: 'audio_url') final String? audioUrl;

  const BackgroundAssetDto({
    required this.path,
    required this.type,
    required this.version,
    required this.hasSound,
    required this.url,
    required this.audioUrl,
  });

  factory BackgroundAssetDto.fromDomain(BackgroundAsset asset) {
    return BackgroundAssetDto(
      path: asset.path,
      type: asset.type.name,
      version: asset.version,
      hasSound: asset.hasSound,
      url: asset.link.value,
      audioUrl: asset.audioLink.toNullable()?.value,
    );
  }

  BackgroundAsset toDomain() {
    return BackgroundAsset(
      path: path,
      type: AvailableBackgroundType.fromString(type),
      hasSound: hasSound,
      version: version,
      link: NetworkLink.pure(url),
      audioLink: Option.when(
        audioUrl != null,
        NetworkLink.pure(audioUrl ?? ''),
      ),
    );
  }

  factory BackgroundAssetDto.fromJson(Map<String, dynamic> json) =>
      _$BackgroundAssetDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BackgroundAssetDtoToJson(this);
}
