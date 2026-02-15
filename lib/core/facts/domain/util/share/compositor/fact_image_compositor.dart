import 'dart:io';
import 'dart:typed_data';

import 'package:denwee/core/backgrounds/domain/entity/resolved_background_asset.dart';
import 'package:denwee/core/facts/domain/util/share/compositor/fact_compositor.dart';
import 'package:denwee/core/facts/domain/util/share/fact_shares_storage.dart';
import 'package:denwee/core/misc/domain/service/ffmpeg_service.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class FactImageCompositor implements FactCompositor {
  final ResolvedBackgroundAsset _background;
  final FactSharesStorage _storage;

  const FactImageCompositor(this._background, this._storage);

  static const backgroundResolution = '1440:2560';
  static const overlayScale = '1440*0.93';

  @override
  Future<File> compose(Uint8List overlay) async {
    final dir = await _storage.getDirectory();
    final overlayFile = await _storage.save(overlay);
    final backgroundFile = _background.visualFile;
    final outputFile = File(
      '${dir.path}/fact_share_${DateTime.now().millisecondsSinceEpoch}.jpg'
    );

    final command = _getCommand(
      backgroundPath: backgroundFile.path,
      overlayPath: overlayFile.path,
      outputPath: outputFile.path,
    );

    await FfmpegService.process(command);

    if (!await outputFile.exists()) {
      throw 'Output file missing';
    }

    return outputFile;
  }

  String _getCommand({
    required String backgroundPath,
    required String overlayPath,
    required String outputPath,
  }) {
    final hexColor = _background.background.style.backgroundFadeColor
        .toHexString(enableAlpha: false, includeHashSign: true)
        .substring(2);
    final fade = _background.background.style.backgroundFade;

    final command =
        '-y '
        '-i "$backgroundPath" '
        '-i "$overlayPath" '
        '-filter_complex "'
        '[0:v]scale=$backgroundResolution,format=rgba,'
        'drawbox=x=0:y=0:w=iw:h=ih:color=0x$hexColor@$fade:t=fill,'
        'format=yuv420p[bg];'
        '[1:v]scale=$overlayScale:-1[ovr];'
        '[bg][ovr]overlay=(W-w)/2:(H-h)/2'
        '" '
        '"$outputPath"';

    return command;
  }
}
