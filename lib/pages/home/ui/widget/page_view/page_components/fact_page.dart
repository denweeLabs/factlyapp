import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/ui/constants/app/user_interests.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/scroll_physics/less_responsive_scroll_physics.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/core/ui/widget/misc/fading_edge_widget.dart';
import 'package:denwee/pages/fact_details/ui/cubit/fact_explanation_cubit.dart';
import 'package:denwee/pages/fact_details/ui/widget/components/scroll_back_button_widget.dart';
import 'package:denwee/pages/fact_details/ui/widget/components/tags_list_widget.dart';
import 'package:denwee/pages/fact_details/ui/widget/pages/fact_default_content_page_widget.dart';
import 'package:denwee/pages/fact_details/ui/widget/pages/fact_detailed_content_page_widget.dart';
import 'package:denwee/pages/fact_details/ui/fact_details_listeners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_scroll_physics/snap_scroll_physics.dart';
import 'package:utils/utils.dart';

class FactPage extends StatefulWidget {
  const FactPage({
    super.key,
    required this.fact,
    required this.cubit,
    required this.verticalScrollOffset,
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
  final ValueNotifier<double> verticalScrollOffset;
  final void Function(double) onVerticalScrollChanged;
  final double scrollViewTopPadding;
  final double pageHeight;
  final VoidCallback? onFactLoadingStarted;
  final VoidCallback? onFactLoadingFinished;

  @override
  State<FactPage> createState() => FactPageState();
}

class FactPageState extends State<FactPage> {
  static const edgesFadeStops = [0.0, 0.08, 0.75, 1.0];

  late final scrollController = ScrollController(
    initialScrollOffset: widget.verticalScrollOffset.value,
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
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.position.axis == Axis.vertical) {
      final offset = scrollController.offset.abs();
      widget.onVerticalScrollChanged(offset);
    }
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
    final snapScrollPhysics = SnapScrollPhysics(
      snaps: [Snap.avoidZone(0, widget.pageHeight)],
      parent: const LessResponsiveScrollPhysics(),
    );

    return Padding(
      padding: EdgeInsets.only(top: widget.scrollViewTopPadding),
      child: BlocSelector<FactExplanationCubit, FactExplanationState, bool>(
        bloc: widget.cubit,
        selector: (state) => state.hasExplanation,
        builder: (context, hasExplanation) {
          final scrollPhysics = hasExplanation
              ? snapScrollPhysics
              : const NeverScrollableScrollPhysics();

          return FadingEdge(
            axis: Axis.vertical,
            stops: edgesFadeStops,
            child: ListView(
              padding: EdgeInsets.zero,
              controller: scrollController,
              physics: scrollPhysics,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                _defaultContent(),
                _detailedContent(),
                _overscrollFiller(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _defaultContent() {
    return SizedBox.fromSize(
      size: Size.fromHeight(widget.pageHeight),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ValueListenableBuilder(
          valueListenable: widget.verticalScrollOffset,
          builder: (context, offset, child) {
            final fraction = (offset / widget.pageHeight).clamp(0.0, 1.0);
            final opacity = 1.0 - fraction;
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
              FactDefaultContentPage(
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
                  child: FactTagsList(
                    padding: EdgeInsets.only(left: 4.w, right: 18.w),
                    fact: widget.fact,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailedContent() {
    return ValueListenableBuilder(
      valueListenable: widget.verticalScrollOffset,
      builder: (context, offset, child) {
        final fraction = (offset / widget.pageHeight).clamp(0.0, 1.0);
        final opacity = fraction;
        final offstage = opacity <= 0.0;

        return Offstage(
          offstage: offstage,
          child: Opacity(opacity: opacity, child: child),
        );
      },
      child: BlocBuilder<FactExplanationCubit, FactExplanationState>(
        bloc: widget.cubit,
        builder: (context, state) => FactDetailedContentPage(
          fullContent: state.explanation.toNullable()?.content,
          streamedContent: widget.cubit.explanationController.stream,
          padding: widget.detailedContentPadding,
        ),
      ),
    );
  }

  Widget _overscrollFiller() {
    return ValueListenableBuilder(
      valueListenable: widget.verticalScrollOffset,
      builder: (context, offset, child) {
        final fraction = (offset / widget.pageHeight);
        final offstage = fraction >= 1.5;

        return Offstage(
          offstage: offstage,
          child: SizedBox(
            height: widget.pageHeight,
            width: double.infinity,
            child: child!,
          ),
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  Widget _buildScrollBackButton() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: context.bottomPadding + 24.h,
      child: ValueListenableBuilder(
        valueListenable: widget.verticalScrollOffset,
        builder: (context, offset, child) {
          final animate = offset >= widget.pageHeight;

          return AnimatedScale(
            scale: animate ? 1.0 : 0.0,
            duration: CustomAnimationDurations.low,
            curve: CustomAnimationCurves.lowElasticOut,
            child: child,
          );
        },
        child: FactScrollBackButton(onTap: () => scrollPageTo(0.0)),
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

Widget buildFactHeader(BuildContext context, DailyFact fact) {
  final date = fact.displayDateText();

  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      BackdropSurfaceContainer.ellipse(
        size: Size.square(46.w),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        child: Center(
          child: Text(
            fact.interest.emoji ?? '?',
            style: TextStyle(fontSize: 20.sp, color: Colors.black),
          ),
        ),
      ),
      12.horizontalSpace,
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              fact.title,
              style: factHeaderTitle.copyWith(color: context.lightTextColor),
              overflow: TextOverflow.ellipsis,
              maxLines: date != null ? 1 : 2,
            ),
            if (date != null) ...[
              1.verticalSpace,
              Text(
                fact.displayDateText() ?? '-',
                style: bodyM.copyWith(color: context.lightTextColorSecondary),
              ),
            ],
          ],
        ),
      ),
    ],
  );
}
