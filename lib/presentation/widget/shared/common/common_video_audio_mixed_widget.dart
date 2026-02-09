// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/animations/shimmer_animation_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';

enum _CommonVideoAudioMixedSourceType { network, file }

class CommonVideoAudioMixed extends StatefulWidget {
  const CommonVideoAudioMixed._({
    super.key,
    required this.visualResource,
    required this.audioResource,
    required this.type,
    required this.volume,
  });

  const CommonVideoAudioMixed.network({
    required String visualUrl,
    required String? audioUrl,
    required double volume,
    Key? key,
  }) : this._(
          key: key,
          visualResource: visualUrl,
          audioResource: audioUrl,
          volume: volume,
          type: _CommonVideoAudioMixedSourceType.network,
        );

  const CommonVideoAudioMixed.file({
    required String visualPath,
    required String? audioPath,
    required double volume,
    Key? key,
  }) : this._(
          key: key,
          visualResource: visualPath,
          audioResource: audioPath,
          volume: volume,
          type: _CommonVideoAudioMixedSourceType.file,
        );

  final String visualResource;
  final String? audioResource;
  final _CommonVideoAudioMixedSourceType type;
  final double volume;

  @override
  State<CommonVideoAudioMixed> createState() =>
      _CommonVideoAudioMixedState();
}

class _CommonVideoAudioMixedState extends State<CommonVideoAudioMixed> {
  static const int _maxRetries = 2;
  static const Duration _retryDelay = Duration(milliseconds: 500);

  late final videoPlayerOptions = VideoPlayerOptions(mixWithOthers: true);

  CachedVideoPlayerPlus? _video;
  AudioPlayer? _audio;

  int _attempt = 0;
  bool _isLoading = true;
  bool _isError = false;

  bool get _shouldUseAudio =>
      widget.volume > 0.0 && widget.audioResource != null;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    while (_attempt <= _maxRetries && mounted) {
      try {
        _attempt++;

        await _disposeControllers();

        // --- VIDEO ---
        _video = _createVideoController();
        await _video!.initialize();
        await _video!.controller.setLooping(true);
        await _video!.controller.setVolume(0.0); // audio handled separately

        // --- AUDIO (optional) ---
        if (_shouldUseAudio) {
          _audio = AudioPlayer();

          if (widget.type == _CommonVideoAudioMixedSourceType.network) {
            _audio!.setUrl(widget.audioResource!);
          } else {
            _audio!.setFilePath(widget.audioResource!);
          }

          _audio!.setLoopMode(LoopMode.one);
          _audio!.setVolume(widget.volume);
        }

        // --- START ---
        await _video!.controller.play();
        _audio?.play();

        // --- UPDATE SUCCESS STATE ---
        _isLoading = false;
        _isError = false;
        if (mounted) setState(() {});
        return;
      } catch (e) {
        await _disposeControllers();

        if (_attempt > _maxRetries) {
          _isLoading = false;
          _isError = true;
          if (mounted) setState(() {});
          return;
        }

        await Future.delayed(_retryDelay);
      }
    }
  }

  CachedVideoPlayerPlus _createVideoController() {
    switch (widget.type) {
      case _CommonVideoAudioMixedSourceType.network:
        return CachedVideoPlayerPlus.networkUrl(
          Uri.parse(widget.visualResource),
          videoPlayerOptions: videoPlayerOptions,
        );

      case _CommonVideoAudioMixedSourceType.file:
        return CachedVideoPlayerPlus.file(
          File(widget.visualResource),
          videoPlayerOptions: videoPlayerOptions,
        );
    }
  }

  Future<void> _disposeControllers() async {
    try {
      await _audio?.stop();
      await _audio?.dispose();
    } catch (_) {}

    try {
      await _video?.controller.pause();
      await _video?.controller.setLooping(false);
      await _video?.dispose();
    } catch (_) {}

    _audio = null;
    _video = null;
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: CustomAnimationDurations.ultraLow,
      layoutBuilder: (current, previous) => Stack(
        fit: StackFit.expand,
        children: [...previous, if (current != null) current],
      ),
      child: () {
        if (_isLoading) {
          return ShimmerAnimation(
            key: const ValueKey('loading'),
            interval: Duration.zero,
            duration: const Duration(milliseconds: 1200),
            colorOpacity: 0.1,
            color: context.isLightTheme
                ? context.darkPrimaryContainer
                : context.lightPrimaryContainer,
          );
        }

        if (_isError || _video == null) {
          return Center(
            key: const ValueKey('error'),
            child: CommonAppIcon(
              path: AppConstants.assets.icons.infoLinear,
              color: context.iconColorTernary,
              size: 24,
            ),
          );
        }

        return AspectRatio(
          key: const ValueKey('video'),
          aspectRatio: _video!.controller.value.aspectRatio,
          child: VideoPlayer(_video!.controller),
        );
      }(),
    );
  }
}