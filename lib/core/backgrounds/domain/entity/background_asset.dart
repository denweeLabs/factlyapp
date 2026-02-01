import 'package:dartz/dartz.dart';
import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/network/domain/entity/network_link.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'background_asset.freezed.dart';

@freezed
abstract class BackgroundAsset with _$BackgroundAsset {
  const factory BackgroundAsset({
    required String path,
    required AvailableBackgroundType type,
    required int version,
    required bool hasSound,
    required NetworkLink link,
    required Option<NetworkLink> audioLink,
  }) = _BackgroundAsset;
}
