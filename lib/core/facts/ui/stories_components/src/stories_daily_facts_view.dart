import 'dart:io';

import 'package:denwee/core/backgrounds/domain/entity/background_style.dart';
import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/misc/data/storage/common_storage.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:denwee/core/ui/constants/app/user_interests.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/utils/navigation_util.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/elastic_out.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_out_down.dart';
import 'package:denwee/core/ui/widget/animations/stars_change_overlay_animation_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/pages/fact_details/ui/cubit/fact_explanation_cubit.dart';
import 'package:denwee/core/facts/ui/stories_components/stories_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class StoriesDailyFactsView extends StatefulWidget {
  const StoriesDailyFactsView({
    super.key,
    required this.isLoading,
    required this.facts,
    required this.interests,
    required this.goToAccount,
    required this.goToBackgrounds,
    required this.backgroundStyle,
    required this.backgroundBrightness,
  });

  final bool isLoading;
  final List<DailyFact> facts;
  final List<UserInterest> interests;
  final VoidCallback goToAccount;
  final VoidCallback goToBackgrounds;
  final BackgroundStyle? backgroundStyle;
  final Brightness backgroundBrightness;

  @override
  State<StoriesDailyFactsView> createState() => _StoriesDailyFactsViewState();
}

class _StoriesDailyFactsViewState extends State<StoriesDailyFactsView>
    with SingleTickerProviderStateMixin {
  /// Total duration of a single story item playback
  static const storyDuration = Duration(seconds: 40);

  /// Duration of the animated transition when switching vertical scroll offsets
  /// between pages
  static const scrollSwitchDuration = Duration(milliseconds: 1000);

  /// Delay before checking whether the onboarding showcase should be shown
  static const checkShowcaseDelay = Duration(milliseconds: 1300);

  /// Duration of the horizontal page view transition animation
  static const pageSwitchDuration = Duration(milliseconds: 500);

  /// Controls story playback progress (play, pause, next, previous)
  late final storyController = StoryController();

  /// Controls horizontal paging between fact pages
  late final pageController = PageController();

  /// Animation controller used to interpolate vertical scroll offset
  /// when switching between pages
  late final scrollSwitchController = AnimationController.unbounded(
    vsync: this,
  );

  /// Animation that represents the interpolated vertical scroll offset
  /// during page transitions
  late Animation<double> scrollSwitchAnimation = AlwaysStoppedAnimation<double>(
    0.0,
  );

  /// List of story items mapped with daily facts
  late final storyItems = widget.interests
      .map((e) => StoryItem(const SizedBox.shrink(), duration: storyDuration))
      .toList();

  /// Cubits responsible for loading and managing explanations
  /// for each daily fact
  late List<FactExplanationCubit> cubits;

  /// Global keys for accessing and controlling individual fact pages
  late final pageKeys = widget.interests
      .map((_) => GlobalKey<StoriesFactPageState>())
      .toList();

  /// Per-page vertical scroll offsets used to sync UI state across fact pages
  late final verticalScrollOffsets = widget.interests.map((_) => 0.0).toList();

  late final verticalScrollFraction = ValueNotifier<double>(0.0);
  late final pageIndex = ValueNotifier<int>(0);

  late double bottomSectionInset;
  late double bottomSectionSafeInset;
  late double pageSafeHeight;
  late double storybarTopPadding;
  late double scrollViewTopPadding;
  late double pageHeightInv;
  late EdgeInsetsGeometry storyBarsPadding;

  var isPageChanging = false;
  var isShowcaseDismissed = false;
  var isShowcase = false;

  @override
  void initState() {
    super.initState();
    scrollSwitchController.addListener(scrollSwitchListener);
    Future.delayed(checkShowcaseDelay, () => checkShowcase());
    initFactPages();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bottomSectionInset = getBottomSectionInset(context);
    bottomSectionSafeInset = bottomSectionInset + StoriesBottomActionSection.containerHeight;
    storybarTopPadding = context.topPadding + 12.h;
    scrollViewTopPadding = context.topPadding + 12.h + 60.h;
    pageSafeHeight = 1.sh - scrollViewTopPadding - bottomSectionSafeInset;
    pageHeightInv = 1 / pageSafeHeight;
    storyBarsPadding = EdgeInsets.only(left: 20.w, right: 20.w, top: storybarTopPadding);
  }

  @override
  void didUpdateWidget(covariant StoriesDailyFactsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isLoading && !widget.isLoading) {
      initFactPages();
    }
  }

  @override
  void dispose() {
    pageIndex.dispose();
    storyController.dispose();
    verticalScrollFraction.dispose();
    pageController.dispose();

    scrollSwitchController
      ..removeListener(scrollSwitchListener)
      ..dispose();

    for (final cubit in cubits) {
      cubit.close();
    }

    super.dispose();
  }

  void initFactPages() {
    if (widget.facts.isEmpty) return;

    cubits = widget.facts
        .map((fact) => getIt<FactExplanationCubit>(param1: fact))
        .toList();

    cubits.first.checkFactExplanation();
  }

  double getBottomSectionInset(BuildContext context) {
    final bottomPadding = context.bottomPadding;
    final hasBottomPadding = bottomPadding > 0;
    if (Platform.isIOS) return hasBottomPadding ? bottomPadding + 8.h : 24.h;
    return hasBottomPadding ? bottomPadding + 18.h : 24.h;
  }

  void checkShowcase() {
    // Showcase starts only when the user arrives on homepage for the first time after onboarding
    isShowcase =
        getIt<AuthCubit>().state.isAnonymous &&
        !getIt<CommonStorage>().isShowcaseDisplayed();
    if (isShowcase) {
      getIt<CommonStorage>().setIsShowcaseDisplayed(true);
      storyController.pause();
      HapticUtil.medium();
      setState(() {});
    }
  }

  void dismissShowcase() {
    HapticUtil.light();
    storyController.play();
    setState(() => isShowcaseDismissed = true);
  }

  void scrollSwitchListener() {
    if (!mounted) return;
    verticalScrollFraction.value = resolveScrollFraction(
      scrollSwitchAnimation.value,
    );
  }

  double resolveScrollFraction(double offset) {
    final value = offset * pageHeightInv;
    if (value <= 0.0) return 0.0;
    if (value >= 1.0) return 1.0;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(),
        _buildStoriesBars(),
        _buildStoryTitle(),
        _buildFactPages(),
        _buildStoryGestures(),
        _buildTitleAndArchiveButton(),
        _buildBottomSection(),
        _buildEarnedStarAnimation(),
        _buildShowcase(),
      ],
    );
  }

  Widget _buildBackground() {
    return Positioned.fill(
      child: AnimatedOpacity(
        opacity: isShowcase ? 0.4 : 1.0,
        curve: Curves.fastEaseInToSlowEaseOut,
        duration: isShowcase
            ? const Duration(milliseconds: 1500)
            : const Duration(milliseconds: 1000),
        child: pageIndexProvider(
          builder: (index) => StoriesViewBackground(
            isDefaultStaticImage: widget.isLoading,
            scrollFraction: verticalScrollFraction,
            defaultPageIndex: index,
          ),
        ),
      ),
    );
  }

  Widget _buildStoriesBars() {
    return StoriesViewTopBars(
      items: storyItems,
      controller: storyController,
      padding: storyBarsPadding,
      scrollFraction: verticalScrollFraction,
      onStoryChanged: animateToFactPage,
      backgroundStyle: widget.backgroundStyle,
    );
  }

  Widget _buildStoryTitle() {
    return Positioned(
      left: 20.w,
      right: 20.w,
      top: storybarTopPadding + 22.h,
      child: pageIndexProvider(
        builder: (index) {
          final fact = widget.facts.asMap()[index];

          if (fact == null) {
            return const SizedBox.shrink();
          }

          return StoriesInterestTopTitle(
            factId: fact.id.value,
            interest: fact.interest.tryTranslate(context) ?? '',
            region: fact.region.toNullable(),
            date: fact.displayDateText(),
            scrollFraction: verticalScrollFraction,
            isSkeleton: widget.isLoading,
            backgroundStyle: widget.backgroundStyle,
          );
        },
      ),
    );
  }

  Widget _buildFactPages() {
    return Positioned.fill(
      child: IgnorePointer(
        ignoring: isShowcase,
        child:
            PageView.builder(
              controller: pageController,
              itemCount: widget.facts.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, index) {
                final fact = widget.facts[index];

                return ValueListenableBuilder(
                  valueListenable: pageIndex,
                  builder: (context, pageIndex, child) => AnimatedOpacity(
                    opacity: pageIndex == index ? 1.0 : 0.0,
                    duration: pageSwitchDuration,
                    curve: Curves.ease,
                    child: child!,
                  ),
                  child: BlocProvider.value(
                    value: cubits[index],
                    child: StoriesFactPage(
                      fact: fact,
                      key: pageKeys[index],
                      cubit: cubits[index],
                      pageHeight: pageSafeHeight,
                      scrollViewTopPadding: scrollViewTopPadding,
                      initialScrollOffset: verticalScrollOffsets[index],
                      onVerticalScrollChanged: (offset) => onVerticalScrollChanged(offset, index),
                      defaultContentPadding: EdgeInsets.symmetric(horizontal: 14.w),
                      detailedContentPadding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        bottom: context.bottomPadding + 74.h + StoriesScrollupButton.size,
                      ),
                      onFactLoadingStarted: storyController.pause,
                      onFactLoadingFinished: storyController.play,
                      isSkeleton: widget.isLoading,
                      backgroundStyle: widget.backgroundStyle,
                      backgroundBrightness: widget.backgroundBrightness,
                    ),
                  ),
                );
              },
            ).autoElasticOut(
              animate: isShowcase,
              duration: const Duration(milliseconds: 1000),
              reverseDuration: const Duration(milliseconds: 400),
              scaleCurve: Curves.easeInOutSine,
              scaleReverseCurve: const Interval(0.999, 1.0),
              forceComplete: false,
            ),
      ),
    );
  }

  Widget _buildStoryGestures() {
    return StoriesViewGesturesArea(
      ignorePointer: isShowcase || widget.isLoading,
      onHold: storyController.pause,
      onRelease: storyController.play,
      onLeft: storyController.previous,
      onRight: storyController.next,
    );
  }

  Widget _buildTitleAndArchiveButton() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: context.topPadding,
      child: pageIndexProvider(
        builder: (index) {
          final fact = widget.facts.asMap()[index];
          
          if (fact == null) {
            return const SizedBox.shrink();
          }
          
          return StoriesFactTitle(
            factId: fact.id,
            factTitle: fact.title,
            scrollFraction: verticalScrollFraction,
            onBack: () => pageKeys[index].currentState?.scrollPageTo(0.0),
            ignorePointer: isShowcase,
            backgroundBrightness: widget.backgroundBrightness,
          );
        },
      ),
    );
  }

  Widget _buildBottomSection() {
    return Positioned(
      left: 14.w,
      right: 14.w,
      bottom: bottomSectionInset,
      child: IgnorePointer(
        ignoring: isShowcase,
        child: ValueListenableBuilder(
          valueListenable: verticalScrollFraction,
          builder: (context, scrollFraction, child) {
            final fraction = Curves.easeInQuad.transform(scrollFraction);
            final yTranslate = (bottomSectionSafeInset * 1.2) * fraction;
            final offstage = fraction >= 1.0;

            return Transform.translate(
              offset: Offset(0.0, yTranslate),
              child: Offstage(offstage: offstage, child: child!),
            );
          },
          child:
              pageIndexProvider(
                builder: (index) {
                  return BlocBuilder<
                    FactExplanationCubit,
                    FactExplanationState
                  >(
                    bloc: cubits[index],
                    builder: (context, state) => StoriesBottomActionSection(
                      isSkeleton: widget.isLoading,
                      ignoreCtaPointer: widget.isLoading,
                      isLoadingExplanation: state.loadingFactExplanation,
                      onAccountTap: widget.goToAccount,
                      onBackgroundsTap: widget.goToBackgrounds,
                      onReadMoreTap: () => _onReadMoreTap(index),
                      backgroundStyle: widget.backgroundStyle,
                    ),
                  );
                },
              ).autoFadeOutDown(
                animate: isShowcase,
                duration: const Duration(milliseconds: 800),
                reverseDuration: const Duration(milliseconds: 400),
                slideCurve: Curves.easeInOutSine,
                slideReverseCurve: const Interval(0.999, 1.0),
                slideTo: bottomSectionSafeInset + 72.h,
                forceComplete: false,
              ),
        ),
      ),
    );
  }

  Widget _buildEarnedStarAnimation() {
    return Positioned(
      left: 0.0,
      bottom: context.bottomPadding + 36.h,
      child: const Center(child: StarsChangeOverlayAnimation()),
    );
  }

  Widget _buildShowcase() {
    return StoriesViewShowcase(
      isEnabled: isShowcase,
      isDismissed: isShowcaseDismissed,
      onDismiss: dismissShowcase,
      onFinished: () => setState(() => isShowcase = false),
    );
  }

  Widget pageIndexProvider({required Widget Function(int) builder}) {
    return ValueListenableBuilder(
      valueListenable: pageIndex,
      builder: (_, index, _) => builder(index),
    );
  }

  void onPageChanged(int newPageIndex) {
    // If page swiped manually by hand - update story controller position
    if (!isPageChanging) {
      newPageIndex > pageIndex.value
          ? storyController.jumpNext()
          : storyController.jumpPrevious();
    }

    // Previous & current scrolls
    final prevScrollOffset = verticalScrollOffsets[pageIndex.value];
    final newScrollOffset = verticalScrollOffsets[newPageIndex];

    // Check if new page is scrolled down we should stop stories playback
    checkPlaybackForScrollOffset(newScrollOffset);

    // Update new page index
    pageIndex.value = newPageIndex;

    // Ignore pages transition animation in case no offset
    if (prevScrollOffset == 0 && newScrollOffset == 0) return;

    // Prepare pages transition animation
    scrollSwitchAnimation =
        Tween<double>(begin: prevScrollOffset, end: newScrollOffset).animate(
          CurvedAnimation(
            parent: scrollSwitchController,
            curve: Curves.fastEaseInToSlowEaseOut,
            reverseCurve: Curves.fastEaseInToSlowEaseOut,
          ),
        );

    // Reset animation controller and start transition
    scrollSwitchController
      ..value = 0.0
      ..animateTo(1.0, duration: scrollSwitchDuration);
  }

  void animateToFactPage(int index, {Curve curve = Curves.ease}) async {
    if (!pageController.hasClients) return;
    isPageChanging = true;
    await pageController.animateToPage(
      index,
      duration: pageSwitchDuration,
      curve: curve,
    );
    isPageChanging = false;
  }

  void onVerticalScrollChanged(double offset, int index) {
    checkPlaybackForScrollOffset(offset);

    verticalScrollOffsets[index] = offset;

    if (pageIndex.value == index) {
      scrollSwitchController.stop();
      verticalScrollFraction.value = resolveScrollFraction(offset);
    }
  }

  void checkPlaybackForScrollOffset(double offset) {
    final playbackState = storyController.playbackNotifier.valueOrNull;

    if (offset >= 100) {
      if (playbackState != PlaybackState.pause) {
        storyController.pause();
      }
    } else {
      if (playbackState != PlaybackState.play) {
        storyController.play();
      }
    }
  }

  void _onReadMoreTap(int index) {
    NavigationUtil.onExplainFact(
      context: context,
      cubit: cubits[index],
      scrollToExplanationCallback: () => pageKeys[index].currentState?.scrollPageTo(pageSafeHeight),
      onUnlockProceedCallback: storyController.pause,
      onUnlockMethodDismissedCallback: storyController.play,
    );
  }
}
