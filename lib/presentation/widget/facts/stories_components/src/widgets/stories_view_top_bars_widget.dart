import 'dart:math';

import 'package:denwee/core/backgrounds/domain/entity/background_style.dart';
import 'package:denwee/presentation/widget/facts/stories_components/src/controller/story_controller.dart';
import 'package:denwee/presentation/widget/facts/stories_components/src/controller/story_items_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StoriesViewTopBars extends StatelessWidget {
  const StoriesViewTopBars({
    super.key,
    required this.items,
    required this.controller,
    required this.padding,
    required this.scrollFraction,
    required this.onStoryChanged,
    required this.backgroundStyle,
  });

  final List<StoryItem?> items;
  final StoryController controller;
  final EdgeInsetsGeometry padding;
  final ValueListenable<double> scrollFraction;
  final ValueChanged<int> onStoryChanged;
  final BackgroundStyle? backgroundStyle;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: scrollFraction,
      builder: (context, scrollFraction, child) {
        final opacity = max(0.0, 1 - 2 * scrollFraction);
        final offstage = opacity <= 0.0;

        return Offstage(
          offstage: offstage,
          child: Opacity(opacity: opacity, child: child!),
        );
      },
      child: StoryItemsView(
        controller: controller,
        indicatorOuterPadding: padding,
        onStoryShow: (_, index) => onStoryChanged(index),
        storyItems: items,
        indicatorColor: backgroundStyle?.textColor.withValues(alpha: .4),
        indicatorForegroundColor: backgroundStyle?.textColor.withValues(alpha: .8),
      ),
    );
  }
}
