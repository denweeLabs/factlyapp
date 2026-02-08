import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_asset.dart';
import 'package:denwee/presentation/widget/shared/common/common_network_image_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_video_audio_mixed_widget.dart';
import 'package:flutter/material.dart';

class BackgroundPreviewContent extends StatelessWidget {
  const BackgroundPreviewContent({
    super.key,
    required this.asset,
    required this.volume,
    this.foregroundColor,
  });

  final BackgroundAsset asset;
  final Color? foregroundColor;
  final double volume;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(color: foregroundColor),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (asset.type) {
      // image
      case AvailableBackgroundType.image:
        return CommonNetworkImage(url: asset.link.value);

      // video
      case AvailableBackgroundType.video:
        return CommonVideoAudioMixed.network(
          visualUrl: asset.link.value,
          audioUrl: asset.audioLink.toNullable()?.value,
          volume: volume,
        );
    }
  }
}
