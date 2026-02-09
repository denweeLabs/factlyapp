import 'dart:math';
import 'dart:ui';

import 'package:denwee/core/backgrounds/domain/entity/resolved_background_asset.dart';
import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/presentation/widget/facts/stories_components/src/widgets/stories_interest_background_image_widget.dart';
import 'package:denwee/presentation/widget/facts/stories_components/src/widgets/stories_view_custom_background_widget.dart';
import 'package:denwee/presentation/bloc/backgrounds/active_background_cubit.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/misc/fading_edge_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoriesViewBackground extends StatelessWidget {
  const StoriesViewBackground({
    super.key,
    required this.scrollFraction,
    this.defaultCustomImagePath,
    this.isDefaultStaticImage = false,
    this.defaultPageIndex = 0,
  });

  final ValueListenable<double> scrollFraction;
  final String? defaultCustomImagePath;
  final bool isDefaultStaticImage;
  final int defaultPageIndex;

  static final _topFadeHeight = 0.25.sh;
  static final _screenSize = Size(1.sw, 1.sh);

  static const _defaultMinFade = 0.70;
  static const _defaultMaxFade = 0.90;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPreferencesCubit, UserPreferencesState>(
      builder: (_, preferencesState) {
        return BlocBuilder<ActiveBackgroundCubit, ActiveBackgroundState>(
          builder: (_, backgroundState) {
            return ValueListenableBuilder<double>(
              valueListenable: scrollFraction,
              builder: (_, scroll, child) => DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  color: _foregroundColor(
                    context: context,
                    backgroundState: backgroundState,
                    scrollFraction: scroll,
                  ),
                ),
                child: child!,
              ),
              child: _buildStack(
                context: context,
                preferences: preferencesState,
                backgroundState: backgroundState,
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildStack({
    required BuildContext context,
    required UserPreferencesState preferences,
    required ActiveBackgroundState backgroundState,
  }) {
    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedSwitcher(
            duration: CustomAnimationDurations.low,
            layoutBuilder: (currentChild, previousChildren) => Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [...previousChildren, ?currentChild],
            ),
            child: backgroundState.maybeWhen(
              applied: _buildCustomBackground,
              orElse: () =>
                  _buildDefaultBackground(preferences.preferences.interests),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: _topFadeHeight,
          child: const IgnorePointer(
            child: FadingSingleEdge(
              axis: Axis.vertical,
              child: ColoredBox(color: Colors.black12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultBackground(List<UserInterest> interests) {
    final imagePath = isDefaultStaticImage
        ? interests.first.imagePath
        : defaultCustomImagePath ?? interests[defaultPageIndex].imagePath;
    final key = ValueKey(imagePath);

    return StoriesInterestBackgroundAnimatedImage(
      key: key,
      path: imagePath,
      size: _screenSize,
    );
  }

  Widget _buildCustomBackground(bool _, ResolvedBackgroundAsset data) {
    final key = ValueKey(data.visualFile.path);

    return StoriesViewCustomBackground(asset: data, key: key);
  }

  Color _foregroundColor({
    required BuildContext context,
    required ActiveBackgroundState backgroundState,
    required double scrollFraction,
  }) {
    return backgroundState.maybeWhen(
      // applied background custom fade
      applied: (_, data) {
        return data.background.style.backgroundFadeColor.withValues(
          alpha: lerpDouble(
            data.background.style.backgroundFade,
            max(data.background.style.backgroundFade, _defaultMaxFade),
            scrollFraction,
          ),
        );
      },

      // default background fade
      orElse: () {
        return context.darkPrimaryContainer.withValues(
          alpha: lerpDouble(_defaultMinFade, _defaultMaxFade, scrollFraction),
        );
      },
    );
  }
}
