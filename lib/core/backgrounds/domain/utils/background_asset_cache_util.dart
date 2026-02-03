import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:denwee/core/backgrounds/data/source/remote/backgrounds_remote_source.dart';
import 'package:denwee/core/backgrounds/domain/entity/active_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/resolved_background_asset.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class _BackgroundAssetExtensions {
  const _BackgroundAssetExtensions._();

  static const video = 'mp4';
  static const image = 'webp';
  static const audio = 'opus';
}

@LazySingleton()
class BackgroundAssetCacheUtil {
  final String _envPrefix;
  final BackgroundsRemoteSource _remoteSource;

  BackgroundAssetCacheUtil(
    @ENV_PREFIX this._envPrefix,
    this._remoteSource,
  );

  static const folderName = 'background_assets';

  Directory? _cachedBaseDir;

  Future<Directory> _baseDir() async {
    if (_cachedBaseDir != null) return _cachedBaseDir!;
    final dir = await getApplicationSupportDirectory();
    final base = Directory(p.join(dir.path, folderName));
    _cachedBaseDir = base;
    return base;
  }

  String _visualFileName({
    required String assetPath,
    required int version,
    required AvailableBackgroundType type,
  }) {
    final ext = type == AvailableBackgroundType.video
        ? _BackgroundAssetExtensions.video
        : _BackgroundAssetExtensions.image;

    final safePath = assetPath.replaceAll('/', '_');
    return '${_envPrefix}_${safePath}_v$version.$ext';
  }

  String _audioFileName({
    required String assetPath,
    required int version,
  }) {
    final safePath = assetPath.replaceAll('/', '_');
    return '${_envPrefix}_${safePath}_audio_v$version.${_BackgroundAssetExtensions.audio}';
  }

  Future<File> _resolveVisualFile(
    Directory baseDir,
    ActiveBackground background,
  ) {
    return Future.value(File(p.join(
      baseDir.path,
      _visualFileName(
        assetPath: background.asset.path,
        version: background.asset.version,
        type: background.asset.type,
      ),
    )));
  }

  Future<File> _resolveAudioFile(
    Directory baseDir,
    ActiveBackground background,
  ) {
    return Future.value(File(p.join(
      baseDir.path,
      _audioFileName(
        assetPath: background.asset.path,
        version: background.asset.version,
      ),
    )));
  }

  Future<void> _cleanupOldVersions({
    required Directory baseDir,
    required String assetPath,
    required int currentVersion,
    required bool audio,
  }) async {
    if (!await baseDir.exists()) return;

    final safePath = assetPath.replaceAll('/', '_');
    final prefix = audio
        ? '${_envPrefix}_${safePath}_audio_v'
        : '${_envPrefix}_${safePath}_v';

    await for (final entity in baseDir.list()) {
      if (entity is! File) continue;

      final name = p.basename(entity.path);
      if (!name.startsWith(prefix)) continue;

      final match = RegExp(r'_v(\d+)').firstMatch(name);
      if (match == null) continue;

      final version = int.tryParse(match.group(1)!);
      if (version != null && version < currentVersion) {
        try {
          await entity.delete();
        } catch (_) {}
      }
    }
  }

  Future<ResolvedBackgroundAsset> downloadBackgroundIfNeeded(
    ActiveBackground background,
  ) async {
    final baseDir = await _baseDir();
    await baseDir.create(recursive: true);

    final visualFile = await _resolveVisualFile(baseDir, background);
    File? audioFile;

    // cleanup
    unawaited(_cleanupOldVersions(
      baseDir: baseDir,
      assetPath: background.asset.path,
      currentVersion: background.asset.version,
      audio: false,
    ));

    if (!await visualFile.exists()) {
      await _remoteSource.downloadAssetFile(
        background.asset.link.value,
        visualFile.path,
      );
    }

    if (background.asset.hasSound &&
        background.asset.audioLink.isSome()) {
      audioFile = await _resolveAudioFile(baseDir, background);

      unawaited(_cleanupOldVersions(
        baseDir: baseDir,
        assetPath: background.asset.path,
        currentVersion: background.asset.version,
        audio: true,
      ));

      if (!await audioFile.exists()) {
        await _remoteSource.downloadAssetFile(
          background.asset.audioLink.toNullable()!.value,
          audioFile.path,
        );
      }
    }

    return ResolvedBackgroundAsset(
      background: background,
      visualFile: visualFile,
      audioFile: optionOf(audioFile),
    );
  }
}