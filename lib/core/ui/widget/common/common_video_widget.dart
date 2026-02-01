import 'dart:io';

import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/shimmer_animation_widget.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

enum CommonVideoSource { network, asset, file }

class CommonVideo extends StatefulWidget {
  static const defaultVolume = 0.0;

  const CommonVideo._({
    super.key,
    required this.resource,
    required this.source,
    required this.volume,
  });

  const CommonVideo.network(
    String url, {
    Key? key,
    double volume = defaultVolume,
  }) : this._(
         source: CommonVideoSource.network,
         resource: url,
         volume: volume,
         key: key,
       );

  const CommonVideo.asset(
    String path, {
    Key? key,
    double volume = defaultVolume,
  }) : this._(
         source: CommonVideoSource.asset,
         resource: path,
         volume: volume,
         key: key,
       );

  const CommonVideo.file(String path, {Key? key, double volume = defaultVolume})
    : this._(
        source: CommonVideoSource.file,
        resource: path,
        volume: volume,
        key: key,
      );

  final String resource;
  final CommonVideoSource source;
  final double volume;

  @override
  State<CommonVideo> createState() => _CommonVideoState();
}

class _CommonVideoState extends State<CommonVideo> {
  late CachedVideoPlayerPlus videoPlayer;

  static const maxRetries = 1;
  static const retryDelay = Duration(milliseconds: 500);

  int attempt = 0;
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    tryInitVideoAndAudio();
  }

  Future<void> tryInitVideoAndAudio() async {
    while (attempt <= maxRetries && mounted) {
      try {
        attempt++;

        videoPlayer = createController();

        await videoPlayer.initialize();
        await videoPlayer.controller.setLooping(true);
        await videoPlayer.controller.setVolume(widget.volume);
        await videoPlayer.controller.play();

        isLoading = false;
        isError = false;
        if (mounted) setState(() {});
        return;
      } catch (error) {
        await videoPlayer.dispose();

        if (attempt > maxRetries) {
          isLoading = false;
          isError = true;

          if (mounted) setState(() {});
          return;
        }

        await Future.delayed(retryDelay);
      }
    }
  }

  CachedVideoPlayerPlus createController() {
    switch (widget.source) {
      case CommonVideoSource.network:
        return CachedVideoPlayerPlus.networkUrl(Uri.parse(widget.resource));
      case CommonVideoSource.asset:
        return CachedVideoPlayerPlus.asset(widget.resource);
      case CommonVideoSource.file:
        return CachedVideoPlayerPlus.file(
          File(widget.resource),
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
        );
    }
  }

  @override
  void dispose() {
    // audioPlayer.stop();
    // audioPlayer.dispose();
    videoPlayer.controller
      ..pause()
      ..setLooping(false)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: CustomAnimationDurations.ultraLow,
      layoutBuilder: (currentChild, previousChildren) => Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[...previousChildren, ?currentChild],
      ),
      child: () {
        if (isLoading) {
          return ShimmerAnimation(
            key: const ValueKey(0),
            interval: Duration.zero,
            duration: const Duration(milliseconds: 1200),
            colorOpacity: 0.1,
            color: context.isLightTheme
                ? context.darkPrimaryContainer
                : context.lightPrimaryContainer,
          );
        }

        if (isError) {
          return Center(
            key: const ValueKey(1),
            child: CommonAppIcon(
              path: AppConstants.assets.icons.infoLinear,
              color: context.iconColorTernary,
              size: 24,
            ),
          );
        }

        if (!isLoading && !isError) {
          return AspectRatio(
            key: const ValueKey(2),
            aspectRatio: videoPlayer.controller.value.aspectRatio,
            child: VideoPlayer(videoPlayer.controller),
          );
        }
      }(),
    );
  }
}
