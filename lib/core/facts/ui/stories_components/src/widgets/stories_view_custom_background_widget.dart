import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/resolved_background_asset.dart';
import 'package:denwee/core/ui/widget/common/common_video_audio_mixed_widget.dart';
import 'package:flutter/material.dart';

class StoriesViewCustomBackground extends StatelessWidget {
  const StoriesViewCustomBackground({super.key, required this.asset});

  final ResolvedBackgroundAsset asset;

  @override
  Widget build(BuildContext context) {
    switch (asset.background.asset.type) {
      // image
      case AvailableBackgroundType.image:
        return Image.file(asset.visualFile, fit: BoxFit.cover);

      // video
      case AvailableBackgroundType.video:
        return CommonVideoAudioMixed.file(
          visualPath: asset.visualFile.path,
          audioPath: asset.audioFile.toNullable()?.path,
          volume: 1.0,
        );
    }
  }
}
