import 'dart:io';
import 'dart:typed_data';

import 'package:denwee/core/backgrounds/domain/entity/resolved_background_asset.dart';
import 'package:denwee/core/facts/domain/util/share/compositor/fact_compositor.dart';
import 'package:denwee/core/facts/domain/util/share/fact_shares_storage.dart';
import 'package:denwee/core/misc/domain/service/ffmpeg_service.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class FactVideoCompositor implements FactCompositor {
  final ResolvedBackgroundAsset _background;
  final FactSharesStorage _storage;

  const FactVideoCompositor(this._background, this._storage);

  static const backgroundResolution = '1080:1920';
  static const overlayScale = '1080*1.0';

  @override
  Future<File> compose(Uint8List overlay) async {
    final dir = await _storage.getDirectory();
    final overlayFile = await _storage.save(overlay);
    final backgroundFile = _background.visualFile;
    final audioFile = _background.audioFile.toNullable();
    final outputFile = File(
      '${dir.path}/fact_share_${DateTime.now().millisecondsSinceEpoch}.mp4',
    );

    final command = audioFile != null
        ? _withAudio(
            backgroundPath: backgroundFile.path,
            overlayPath: overlayFile.path,
            audioPath: audioFile.path,
            outputPath: outputFile.path,
          )
        : _noAudio(
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

  String _baseFilter() {
    final hexColor = _background.background.style.backgroundFadeColor
        .toHexString(enableAlpha: false, includeHashSign: true)
        .substring(2);
    final fade = _background.background.style.backgroundFade;
    
    return '[0:v]scale=$backgroundResolution,format=rgba,'
        'drawbox=x=0:y=0:w=iw:h=ih:color=0x$hexColor@$fade:t=fill,'
        'format=yuv420p[bg];'
        '[1:v]scale=$overlayScale:-1[ovr];'
        '[bg][ovr]overlay=(W-w)/2:(H-h)/2[v]';
  }

  String _withAudio({
    required String backgroundPath,
    required String overlayPath,
    required String audioPath,
    required String outputPath,
  }) {
    final filter = _baseFilter();

    final command =
        '-y '
        // '-stream_loop 1 '
        '-i "$backgroundPath" '
        '-i "$overlayPath" '
        '-i "$audioPath" '
        '-filter_complex "$filter" '
        '-map "[v]" '
        '-map 2:a '
        '-c:v libx264 '
        '-pix_fmt yuv420p '
        '-profile:v main '
        '-level 4.0 '
        '-preset veryfast '
        '-movflags +faststart '
        '-c:a aac '
        '-shortest '
        '"$outputPath"';

    return command;
  }

  String _noAudio({
    required String backgroundPath,
    required String overlayPath,
    required String outputPath,
  }) {
    final filter = _baseFilter();

    final command =
        '-y '
        '-i "$backgroundPath" '
        '-i "$overlayPath" '
        '-filter_complex "$filter" '
        '-map "[v]" '
        '-c:v libx264 '
        '-pix_fmt yuv420p '
        '-profile:v main '
        '-level 4.0 '
        '-preset veryfast '
        '-movflags +faststart '
        '"$outputPath"';

    return command;
  }
}
