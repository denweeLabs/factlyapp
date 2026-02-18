import 'dart:io';
import 'dart:typed_data';

import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/resolved_background_asset.dart';
import 'package:denwee/core/facts/domain/util/share/fact_shares_storage.dart';
import 'package:injectable/injectable.dart';

import 'fact_image_compositor.dart';
import 'fact_video_compositor.dart';

@LazySingleton()
class FactShareCompositor {
  final FactSharesStorage _storage;

  const FactShareCompositor(this._storage);
  
  Future<File> compose({
    required Uint8List overlay,
    required ResolvedBackgroundAsset background,
  }) async {
    final type = background.background.asset.type;

    final compositor = type == AvailableBackgroundType.video
        ? FactVideoCompositor(background, _storage)
        : FactImageCompositor(background, _storage);

    return compositor.compose(overlay);
  }
}
