import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/scroll_physics/less_responsive_scroll_physics.dart';
import 'package:denwee/core/ui/widget/misc/fading_edge_widget.dart';
import 'package:denwee/pages/fact_details/ui/cubit/fact_explanation_cubit.dart';
import 'package:denwee/core/facts/ui/stories_components/src/widgets/stories_scrollup_button_widget.dart';
import 'package:denwee/core/facts/ui/stories_components/src/widgets/stories_fact_tags_list_widget.dart';
import 'package:denwee/core/facts/ui/stories_components/src/widgets/stories_fact_content_widget.dart';
import 'package:denwee/pages/fact_details/ui/fact_details_listeners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_scroll_physics/snap_scroll_physics.dart';
import 'package:utils/utils.dart';

class StoriesFactPage extends StatefulWidget {
  const StoriesFactPage({
    super.key,
    required this.fact,
    required this.cubit,
    required this.initialScrollOffset,
    required this.onVerticalScrollChanged,
    required this.defaultContentPadding,
    required this.detailedContentPadding,
    required this.scrollViewTopPadding,
    required this.pageHeight,
    this.onFactLoadingStarted,
    this.onFactLoadingFinished,
  });

  final DailyFact fact;
  final FactExplanationCubit cubit;
  final EdgeInsets defaultContentPadding;
  final EdgeInsets detailedContentPadding;
  final double initialScrollOffset;
  final void Function(double) onVerticalScrollChanged;
  final double scrollViewTopPadding;
  final double pageHeight;
  final VoidCallback? onFactLoadingStarted;
  final VoidCallback? onFactLoadingFinished;

  @override
  State<StoriesFactPage> createState() => StoriesFactPageState();
}

class StoriesFactPageState extends State<StoriesFactPage> with SingleTickerProviderStateMixin {
  static const edgesFadeStops = [0.0, 0.08, 0.75, 1.0];
  static const scrollUpperBound = 1.5;

  late final pageHeightInv = 1 / widget.pageHeight;

  late final scrollController = ScrollController(
    initialScrollOffset: widget.initialScrollOffset,
  );
  
  late final scrollFractionController = AnimationController.unbounded(
    vsync: this,
    value: resolveScrollFraction(widget.initialScrollOffset),
  );

  late final scrollPhysics = SnapScrollPhysics(
    snaps: [Snap.avoidZone(0, widget.pageHeight)],
    parent: const LessResponsiveScrollPhysics(),
  );

  @override
  void initState() {
    widget.cubit.checkFactExplanation();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(scrollListener)
      ..dispose();
    scrollFractionController.dispose();
    super.dispose();
  }

  void scrollListener() {
    final offset = scrollController.offset.abs();
    scrollFractionController.value = resolveScrollFraction(offset);
    widget.onVerticalScrollChanged(offset);
  }

  double resolveScrollFraction(double offset) {
    final value = offset * pageHeightInv;
    if (value <= 0.0) return 0.0;
    if (value >= scrollUpperBound) return scrollUpperBound;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return FactDetailsListeners(
      onFactLoadingStarted: widget.onFactLoadingStarted,
      onFactLoadingFinished: widget.onFactLoadingFinished,
      onFactDetailsLoaded: () => scrollPageTo(widget.pageHeight),
      child: Stack(
        children: [
          _buildScrollableContent(),
          _buildScrollBackButton(),
        ],
      ),
    );
  }

  Widget _buildScrollableContent() {
    return Padding(
      padding: EdgeInsets.only(top: widget.scrollViewTopPadding),
      child: BlocSelector<FactExplanationCubit, FactExplanationState, bool>(
        bloc: widget.cubit,
        selector: (state) => state.hasExplanation,
        builder: (context, hasExplanation) => FadingEdge(
          axis: Axis.vertical,
          stops: edgesFadeStops,
          child: ListView(
            padding: EdgeInsets.zero,
            controller: scrollController,
            physics: hasExplanation ? scrollPhysics : const NeverScrollableScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            addRepaintBoundaries: false,
            addAutomaticKeepAlives: false,
            addSemanticIndexes: false,
            children: [
              _defaultContent(),
              _detailedContent(),
              _overscrollFiller(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _defaultContent() {
    return SizedBox.fromSize(
      size: Size.fromHeight(widget.pageHeight),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RepaintBoundary(
          child: AnimatedBuilder(
            animation: scrollFractionController,
            builder: (context, child) {
              final value = scrollFractionController.value;
              final fade = value < 1.0 ? value : 1.0;
              final opacity = 1.0 - fade;
              final offstage = opacity <= 0.0;
          
              return Offstage(
                offstage: offstage,
                child: Opacity(opacity: opacity, child: child),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StoriesFactShortContent(
                  fact: widget.fact,
                  padding: widget.defaultContentPadding.copyWith(bottom: 0.0),
                ),
                28.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(
                    left: widget.defaultContentPadding.left - 6.0,
                    right: widget.defaultContentPadding.right - 6.0,
                    bottom: widget.defaultContentPadding.bottom,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: StoriesFactTagsList(
                      padding: EdgeInsets.only(left: 4.w, right: 18.w),
                      fact: widget.fact,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailedContent() {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: scrollFractionController,
        builder: (context, child) {
          final value = scrollFractionController.value;
          final fade = value < 1.0 ? value : 1.0;
          final opacity = fade;
          final offstage = opacity <= 0.0;
      
          return Offstage(
            offstage: offstage,
            child: Opacity(opacity: opacity, child: child),
          );
        },
        child: BlocBuilder<FactExplanationCubit, FactExplanationState>(
          bloc: widget.cubit,
          buildWhen: (p, c) => p.explanation != c.explanation,
          builder: (context, state) => StoriesFactLongContent(
            fullContent: state.explanation.toNullable()?.content,
            streamedContent: widget.cubit.explanationController.stream,
            padding: widget.detailedContentPadding,
          ),
        ),
      ),
    );
  }

  Widget _overscrollFiller() {
    return AnimatedBuilder(
      animation: scrollFractionController,
      builder: (context, _) {
        final offstage = scrollFractionController.value >= scrollUpperBound;

        return Offstage(
          offstage: offstage,
          child: SizedBox(
            height: widget.pageHeight,
            width: double.infinity,
          ),
        );
      }
    );
  }

  Widget _buildScrollBackButton() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: context.bottomPadding + 24.h,
      child: AnimatedBuilder(
        animation: scrollFractionController,
        builder: (context, child) {
          final animate = scrollFractionController.value >= 1.0;

          return AnimatedScale(
            scale: animate ? 1.0 : 0.0,
            duration: CustomAnimationDurations.low,
            curve: CustomAnimationCurves.lowElasticOut,
            child: child,
          );
        },
        child: StoriesScrollupButton(onTap: () => scrollPageTo(0.0)),
      ),
    );
  }

  Future<void> scrollPageTo(double px) {
    primaryFocus?.unfocus();
    return scrollController.animateTo(
      px,
      duration: CustomAnimationDurations.lowMedium,
      curve: Curves.ease,
    );
  }
}