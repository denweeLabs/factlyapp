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

  static final _screenSize = Size(1.sw, 1.sh);

  static const _defaultMinFade = 0.70;
  static const _defaultMaxFade = 0.90;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveBackgroundCubit, ActiveBackgroundState>(
      builder: (_, backgroundState) {
        return _buildStack(context: context, backgroundState: backgroundState);
      },
    );
  }

  Widget _buildStack({
    required BuildContext context,
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
            child: KeyedSubtree(
              key: ValueKey(backgroundState.selectedId),
              child: backgroundState.maybeWhen(
                applied: _buildCustomBackground,
                orElse: _buildDefaultBackground,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: RepaintBoundary(
            child: ValueListenableBuilder(
              valueListenable: scrollFraction,
              builder: (context, scrollFraction, _) => ColoredBox(
                color: _foregroundColor(
                  context: context,
                  backgroundState: backgroundState,
                  scrollFraction: scrollFraction,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultBackground() {
    return RepaintBoundary(
      child: BlocSelector<
        UserPreferencesCubit,
        UserPreferencesState,
        List<UserInterest>
      >(
        selector: (state) => state.preferences.interests,
        builder: (context, interests) {
          final imagePath = isDefaultStaticImage
              ? interests.first.imagePath
              : defaultCustomImagePath ?? interests[defaultPageIndex].imagePath;
          final key = ValueKey(imagePath);
      
          return AnimatedSwitcher(
            duration: CustomAnimationDurations.low,
            layoutBuilder: (currentChild, previousChildren) => Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [...previousChildren, ?currentChild],
            ),
            child: StoriesInterestBackgroundAnimatedImage(
              key: key,
              path: imagePath,
              size: _screenSize,
            ),
          );
        },
      ),
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
