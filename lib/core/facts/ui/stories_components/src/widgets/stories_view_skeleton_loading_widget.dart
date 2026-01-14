import 'dart:io';

import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/facts/ui/stories_components/src/widgets/stories_bottom_action_section_widget.dart';
import 'package:denwee/core/facts/ui/stories_components/src/widgets/stories_fact_content_widget.dart';
import 'package:denwee/core/facts/ui/stories_components/src/widgets/stories_fact_tags_list_widget.dart';
import 'package:denwee/core/facts/ui/stories_components/src/widgets/stories_view_background_widget.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/constants/app/user_interests.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:utils/utils.dart';

class StoriesViewSkeletonLoading extends StatefulWidget {
  const StoriesViewSkeletonLoading({super.key, required this.onAccount});

  final VoidCallback onAccount;

  static const shimmerDuration = Duration(milliseconds: 800);
  static const shimmerBaseColor = Colors.white24;
  static const shimmerHighlightColor = Colors.white38;

  @override
  State<StoriesViewSkeletonLoading> createState() =>
      _StoriesViewSkeletonLoadingState();
}

class _StoriesViewSkeletonLoadingState
    extends State<StoriesViewSkeletonLoading> {
  static final pageContentPadding = EdgeInsets.only(
    left: 20.w,
    right: 20.w,
    bottom: 38.h,
  );

  late double bottomSectionInset;
  late double bottomSectionSafeInset;
  late double pageSafeHeight;
  late double storybarTopPadding;
  late double scrollViewTopPadding;
  late EdgeInsetsGeometry storyBarsPadding;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bottomSectionInset = getBottomSectionInset(context);
    bottomSectionSafeInset = bottomSectionInset + StoriesBottomActionSection.containerHeight;
    storybarTopPadding = context.topPadding + 12.h;
    scrollViewTopPadding = context.topPadding + 12.h + 60.h;
    pageSafeHeight = 1.sh - scrollViewTopPadding - bottomSectionSafeInset;
    storyBarsPadding = EdgeInsets.only(
      left: 20.w,
      right: 20.w,
      top: storybarTopPadding,
    );
  }

  double getBottomSectionInset(BuildContext context) {
    final bottomPadding = context.bottomPadding;
    final hasBottomPadding = bottomPadding > 0;
    if (Platform.isIOS) return hasBottomPadding ? bottomPadding : 24.h;
    return hasBottomPadding ? bottomPadding + 16.h : 24.h;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPreferencesCubit, UserPreferencesState>(
      builder: (context, state) {
        final firstInterest = state.preferences.interests.first;

        return Stack(
          children: [
            _buildBackground(imagePath: firstInterest.imagePath),
            _buildStoryBars(barsCount: state.preferences.interests.length),
            _buildStoryTitle(interestName: firstInterest.tryTranslate(context) ?? ''),
            _buildPageContent(),
            _buildBottomSection(),
          ],
        );
      },
    );
  }

  Widget _buildBackground({required String imagePath}) {
    return StoriesViewBackground(
      imagePath: imagePath,
      scrollFraction: const AlwaysStoppedAnimation(0.0),
    );
  }

  Widget _buildStoryBars({required int barsCount}) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: 0.0,
      child: Padding(
        padding: storyBarsPadding,
        child: _StoryBars(barsCount: barsCount),
      ),
    );
  }

  Widget _buildStoryTitle({required String interestName}) {
    return Positioned(
      left: 20.w,
      right: 18.w,
      top: storybarTopPadding + 22.h,
      child: _StoryTitle(interestName: interestName),
    );
  }

  Widget _buildBottomSection() {
    return Positioned(
      left: 14.w,
      right: 14.w,
      bottom: bottomSectionInset,
      child: _BottomSection(onAccount: widget.onAccount),
    );
  }

  Widget _buildPageContent() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: scrollViewTopPadding,
      child: SizedBox.fromSize(
        size: Size.fromHeight(pageSafeHeight),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: pageContentPadding.copyWith(bottom: 0.0),
                child: const _FactHeader(),
              ),
              42.verticalSpace,
              Padding(
                padding: pageContentPadding.copyWith(bottom: 0.0),
                child: const _FactContent(),
              ),
              42.verticalSpace,
              Padding(
                padding: EdgeInsets.only(
                  left: pageContentPadding.left - 6.0,
                  right: pageContentPadding.right - 6.0,
                  bottom: pageContentPadding.bottom,
                ),
                child: const _FactTags(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FactTags extends StatelessWidget {
  const _FactTags();

  static const dummyTile = DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      color: Colors.white,
    ),
  );

  static const spacing = 6.0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: SizedBox(
        height: StoriesFactTagsList.listHeight - 4,
        width: double.infinity,
        child: Skeletonizer(
          effect: const ShimmerEffect(
            baseColor: Colors.black26,
            highlightColor: Color(0x05FFFFFF),
            duration: StoriesViewSkeletonLoading.shimmerDuration,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 4.0),
            children: const [
              SizedBox(width: 160, child: dummyTile),
              SizedBox(width: spacing),
              SizedBox(width: 140, child: dummyTile),
              SizedBox(width: spacing),
              SizedBox(width: 100, child: dummyTile),
              SizedBox(width: spacing),
            ],
          ),
        ),
      ),
    );
  }
}

class _FactContent extends StatelessWidget {
  const _FactContent();

  static const dummyLine = DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      color: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: const ShimmerEffect(
        baseColor: Colors.white12,
        highlightColor: Colors.white24,
        duration: StoriesViewSkeletonLoading.shimmerDuration,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.h,
              width: constraints.maxWidth * 0.98,
              child: dummyLine,
            ),
            10.verticalSpace,
            SizedBox(
              height: 12.h,
              width: constraints.maxWidth * 0.83,
              child: dummyLine,
            ),
            10.verticalSpace,
            SizedBox(
              height: 12.h,
              width: constraints.maxWidth * 0.68,
              child: dummyLine,
            ),
          ],
        ),
      ),
    );
  }
}

class _FactHeader extends StatelessWidget {
  const _FactHeader();

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: const ShimmerEffect(
        baseColor: StoriesViewSkeletonLoading.shimmerBaseColor,
        highlightColor: StoriesViewSkeletonLoading.shimmerHighlightColor,
        duration: StoriesViewSkeletonLoading.shimmerDuration,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      child: StoriesFactShortContent.buildFactHeader(
        context: context,
        emoji: '',
        title: 'Skeleton long fact title',
        date: '15 years',
        elipseColor: StoriesViewSkeletonLoading.shimmerBaseColor,
      ),
    );
  }
}

class _BottomSection extends StatelessWidget {
  const _BottomSection({required this.onAccount});

  final VoidCallback onAccount;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      ignorePointers: false,
      effect: const ShimmerEffect(
        baseColor: StoriesViewSkeletonLoading.shimmerBaseColor,
        highlightColor: StoriesViewSkeletonLoading.shimmerHighlightColor,
        duration: StoriesViewSkeletonLoading.shimmerDuration,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      child: StoriesBottomActionSection(
        isShimmering: false,
        isLoading: false,
        ignoreCtaPointer: true,
        onAccountTap: onAccount,
        onReadMoreTap: () {},
      ),
    );
  }
}

class _StoryBars extends StatelessWidget {
  const _StoryBars({required this.barsCount});

  final int barsCount;

  double get spacing => () {
    if (barsCount > 15) return 2.0;
    if (barsCount > 10) return 3.0;
    return 4.0;
  }();

  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(barsCount, buildBar));
  }

  Widget buildBar(int index) {
    final isLast = index == barsCount - 1;
    final padding = isLast ? 0.0 : spacing;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: padding),
        child: const SizedBox(
          height: 5,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: Colors.white38,
            ),
          ),
        ),
      ),
    );
  }
}

class _StoryTitle extends StatelessWidget {
  const _StoryTitle({required this.interestName});

  final String interestName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Skeletonizer(
          effect: ShimmerEffect(
            baseColor: StoriesViewSkeletonLoading.shimmerBaseColor,
            highlightColor: StoriesViewSkeletonLoading.shimmerHighlightColor,
            duration: StoriesViewSkeletonLoading.shimmerDuration,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          child: Text(
            interestName,
            style: h5.copyWith(
              color: context.lightTextColor,
              fontWeight: FontWeight.w700,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const SizedBox(
          width: 30,
          height: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: StoriesViewSkeletonLoading.shimmerBaseColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
