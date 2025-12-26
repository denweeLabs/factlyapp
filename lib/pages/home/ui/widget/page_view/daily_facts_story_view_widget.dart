import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/misc/data/storage/common_storage.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/constants/app/user_interests.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/utils/navigation_util.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/elastic_in.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/elastic_out.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in_up.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_out_down.dart';
import 'package:denwee/core/ui/widget/animations/animated_icons/swipe_gesture_animation_widget.dart';
import 'package:denwee/core/ui/widget/animations/constants/animated_switchers.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/stars_change_overlay_animation_widget.dart';
import 'package:denwee/core/ui/widget/buttons/app_solid_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/archive_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/back_button_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/core/ui/widget/misc/swipe_detector_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:denwee/pages/fact_details/ui/cubit/fact_explanation_cubit.dart';
import 'package:denwee/pages/fact_details/ui/widget/components/scroll_back_button_widget.dart';
import 'package:denwee/pages/home/ui/widget/page_view/components/background.dart';
import 'package:denwee/pages/home/ui/widget/page_view/components/bottom_section.dart';
import 'package:denwee/pages/home/ui/widget/page_view/page_components/fact_page.dart';
import 'package:denwee/pages/home/ui/widget/story_view/facts_story_view_widget.dart';
import 'package:denwee/pages/home/ui/widget/story_view/story_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

part 'components/story_title.dart';
part 'components/back_and_title.dart';

class DailyFactsStoryView extends StatefulWidget {
  const DailyFactsStoryView({
    super.key,
    required this.facts,
    required this.goToAccount,
  });

  final List<DailyFact> facts;
  final VoidCallback goToAccount;

  @override
  State<DailyFactsStoryView> createState() => _DailyFactsStoryViewState();
}

class _DailyFactsStoryViewState extends State<DailyFactsStoryView> with SingleTickerProviderStateMixin {  
  static const storyDuration = Duration(seconds: 40);
  static const scrollSwitchDuration = Duration(milliseconds: 1000);
  static const checkShowcaseDelay = Duration(milliseconds: 1300);
  static const pageSwitchDuration = Duration(milliseconds: 500);

  late final storyController = StoryController();
  late final pageController = PageController();
  late final scrollSwitchController = AnimationController.unbounded(vsync: this);
  late Animation<double> scrollSwitchAnimation = AlwaysStoppedAnimation<double>(0.0);

  late final storyItems = widget.facts
      .map((e) => StoryItem(const SizedBox.shrink(), duration: storyDuration))
      .toList();

  late final cubits = widget.facts
      .map((fact) => getIt<FactExplanationCubit>(param1: fact))
      .toList();

  late final pageKeys =
      widget.facts.map((_) => GlobalKey<FactPageState>()).toList();

  late final verticalScrollOffsets =
      widget.facts.map((_) => ValueNotifier<double>(0.0)).toList();

  late final switcherScrollOffset = ValueNotifier<double>(0.0);
  late final pageIndex = ValueNotifier<int>(0);

  late double bottomSectionInset;
  late double bottomSectionSafeInset;
  late double pageSafeHeight;
  late double storybarTopPadding;
  late double scrollViewTopPadding;

  var isPageChanging = false;
  var isShowcaseDismissed = false;
  var isShowcase = false;

  @override
  void initState() {
    super.initState();
    scrollSwitchController.addListener(scrollSwitchListener);
    Future.delayed(checkShowcaseDelay, () => checkShowcase());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bottomSectionInset = getBottomSectionInset(context);
    bottomSectionSafeInset = bottomSectionInset + BottomSection.containerHeight;
    storybarTopPadding = context.topPadding + 12.h;
    scrollViewTopPadding = context.topPadding + 12.h + 60.h;
    pageSafeHeight = 1.sh - scrollViewTopPadding - bottomSectionSafeInset;
  }

  @override
  void dispose() {
    pageIndex.dispose();
    storyController.dispose();
    switcherScrollOffset.dispose();
    pageController.dispose();

    scrollSwitchController
      ..removeListener(scrollSwitchListener)
      ..dispose();

    for (final cubit in cubits) {
      cubit.close();
    }
    for (final scrollOffset in verticalScrollOffsets) {
      scrollOffset.dispose();
    }
    super.dispose();
  }

  double getBottomSectionInset(BuildContext context) {
    final bottomPadding = context.bottomPadding;
    final hasBottomPadding = bottomPadding > 0;
    if (Platform.isIOS) return hasBottomPadding ? bottomPadding : 24.h;
    return hasBottomPadding ? bottomPadding + 16.h : 24.h;
  }

  void checkShowcase() {
    // Showcase starts only when the user arrives on homepage for the first time after onboarding
    isShowcase = getIt<AuthCubit>().state.isAnonymous &&
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

  void onPageChanged(int newPageIndex) {
    if (!isPageChanging) {
      newPageIndex > pageIndex.value
          ? storyController.jumpNext()
          : storyController.jumpPrevious();
    }

    final prevScrollOffset = verticalScrollOffsets[pageIndex.value].value;
    final newScrollOffset = verticalScrollOffsets[newPageIndex].value;

    checkPlaybackForScrollOffset(newScrollOffset);
    animateToFactPage(newPageIndex, curve: Curves.fastEaseInToSlowEaseOut);

    pageIndex.value = newPageIndex;

    // ignore switching animation in case no offset
    if (prevScrollOffset == 0 && newScrollOffset == 0) return;

    scrollSwitchAnimation =
        Tween<double>(begin: prevScrollOffset, end: newScrollOffset)
            .animate(CurvedAnimation(
      parent: scrollSwitchController,
      curve: Curves.fastEaseInToSlowEaseOut,
      reverseCurve: Curves.fastEaseInToSlowEaseOut,
    ));

    scrollSwitchController
      ..value = 0.0
      ..animateTo(1.0, duration: scrollSwitchDuration);
  }

  void scrollSwitchListener() {
    if (!mounted) return;
    switcherScrollOffset.value = scrollSwitchAnimation.value;
  }

  Widget pageIndexProvider({required Widget Function(int) builder}) =>
      ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (_, index, _) => builder(index),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(),
        _buildStoryView(),
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

  Widget _buildShowcase() {
    return Offstage(
      offstage: !isShowcase,
      child: SwipeDetector(
        onLeft: dismissShowcase,
        onRight: dismissShowcase,
        child: AnimatedOpacity(
          opacity: isShowcaseDismissed ? 0.0 : 1.0,
          duration: CustomAnimationDurations.ultraLow,
          onEnd: () => setState(() => isShowcase = false),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RotatedBox(
                      quarterTurns: -1,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 1),
                        child: isShowcase
                            ? SwipeGestureAnimation(delay: const Duration(milliseconds: 1200))
                            : const SizedBox.shrink(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 42.w),
                      child: Text(
                        context.tr(LocaleKeys.showcase_title),
                        style: h5.copyWith(
                          color: context.lightTextColor,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ).autoFadeInUp(sequencePos: 4, animate: isShowcase)
                    ),
                    2.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        context.tr(LocaleKeys.showcase_subtitle),
                        style: h5.copyWith(color: context.lightTextColorSecondary),
                        textAlign: TextAlign.center,
                      ).autoFadeIn(sequencePos: 6, animate: isShowcase),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: context.bottomPadding + 48.h,
                child: FractionallySizedBox(
                  widthFactor: 0.48,
                  child: AppSolidButton(
                    onTap: dismissShowcase,
                    shadowColor: Colors.black,
                    text: context.tr(LocaleKeys.showcase_button),
                    backgroundColors: [context.lightPrimaryContainer, context.lightPrimaryContainer],
                    textColor: context.theme.colorScheme.primary,
                  ).autoElasticIn(sequencePos: 6, animate: isShowcase),
                ),
              ),
            ],
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

  Widget _buildBackground() {
    return Positioned.fill(
      child: AnimatedOpacity(
        opacity: isShowcase ? 0.4 : 1.0,
        curve: Curves.fastEaseInToSlowEaseOut,
        duration: isShowcase
            ? const Duration(milliseconds: 1500)
            : const Duration(milliseconds: 1000),
        child: pageIndexProvider(
          builder: (pageIndex) => FactBackgroundImage(
            scrollOffset: switcherScrollOffset,
            pageHeight: pageSafeHeight,
            imagePath: AppConstants.assets.images.interest(
              widget.facts[pageIndex].interest.id.value,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFactPages() {
    final defaultContentPadding = EdgeInsets.only(
      left: 20.w,
      right: 20.w,
      bottom: 38.h,
    );
    final detailedContentPadding = EdgeInsets.only(
      left: 20.w,
      right: 20.w,
      bottom: context.bottomPadding +
          32.h +
          FactScrollBackButton.size +
          42.h,
    );

    return Positioned.fill(
      child: IgnorePointer(
        ignoring: isShowcase,
        child: PageView.builder(
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
                child: FactPage(
                  key: pageKeys[index],
                  fact: fact,
                  cubit: cubits[index],
                  pageHeight: pageSafeHeight,
                  scrollViewTopPadding: scrollViewTopPadding,
                  verticalScrollOffset: verticalScrollOffsets[index],
                  onVerticalScrollChanged: (offset) => onVerticalScrollChanged(offset, index),
                  defaultContentPadding: defaultContentPadding,
                  detailedContentPadding: detailedContentPadding,
                  onFactLoadingStarted: storyController.pause,
                  onFactLoadingFinished: storyController.play,
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

  Widget _buildStoryView() {
    final indicatorOuterPadding = EdgeInsets.only(
      left: 20.w,
      right: 20.w,
      top: storybarTopPadding,
    );

    return Positioned.fill(
      child: ValueListenableBuilder(
        valueListenable: switcherScrollOffset,
        builder: (context, offset, child) {
          final fraction = (offset / pageSafeHeight).clamp(0.0, 1.0);
          final opacity = max(0.0, 1 - 2 * fraction);
          final offstage = opacity <= 0.0;

          return Offstage(
            offstage: offstage,
            child: Opacity(
              opacity: opacity,
              child: child!,
            ),
          );
        },
        child: FactsStoryView(
          controller: storyController,
          indicatorOuterPadding: indicatorOuterPadding,
          onStoryShow: (_, index) => animateToFactPage(index),
          storyItems: storyItems,
        ),
      ),
    );
  }

  Widget _buildStoryGestures() {
    return IgnorePointer(
      ignoring: isShowcase,
      child: Stack(
        children: [
          Align(
            heightFactor: 0.6,
            alignment: Alignment.center,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTapDown: (_) => storyController.pause(),
              onTapUp: (_) => storyController.play(),
              onTapCancel: () => storyController.play(),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            heightFactor: 1,
            child: SizedBox(
              width: 70.w,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: storyController.next,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            heightFactor: 1,
            child: SizedBox(
              width: 70.w,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: storyController.previous,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryTitle() {
    return Positioned(
      left: 20.w,
      right: 20.w + 32.w,
      top: storybarTopPadding + 22.h,
      child: ValueListenableBuilder(
        valueListenable: switcherScrollOffset,
        builder: (context, offset, child) {
          final fraction = (offset / pageSafeHeight).clamp(0.0, 1.0);
          final opacity = max(0.0, 1 - 2 * fraction);
          final blurY = 8 * fraction;
          final offstage = opacity <= 0.0;

          return Offstage(
            offstage: offstage,
            child: Opacity(
              opacity: opacity,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaY: blurY),
                child: child!,
              ),
            ),
          );
        },
        child: pageIndexProvider(
          builder: (pageIndex) => _StoryTitle(
            fact: widget.facts[pageIndex],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndArchiveButton() {
    return pageIndexProvider(
      builder: (pageIndex) => ValueListenableBuilder(
        valueListenable: switcherScrollOffset,
        builder: (context, offset, child) {
          final fraction = (offset / pageSafeHeight).clamp(0.0, 1.0);
          final yTranslate = 28 - 10 * fraction;
          final opacity = fraction >= 0.5 ? min(1.0, 2 * (fraction - 0.5)) : 0.0;
          final title = widget.facts[pageIndex].title;

          return Positioned(
            left: 0.0,
            right: 0.0,
            top: context.topPadding + yTranslate.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _BackAndTitle(
                    title: title,
                    opacity: opacity,
                    onBack: () => pageKeys[pageIndex].currentState?.scrollPageTo(0.0),
                  ),
                ),
                child!,
              ],
            ),
          );
        },
        child: IgnorePointer(
          ignoring: isShowcase,
          child: AppArchiveButton(
            factId: widget.facts[pageIndex].id,
            type: AppArchiveButtonType.iconOnly,
            iconPadding: EdgeInsets.symmetric(horizontal: 20.w),
          ),
        ),
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
          valueListenable: switcherScrollOffset,
          builder: (context, offset, child) {
            final rawFraction = (offset / pageSafeHeight).clamp(0.0, 1.0);
            final fraction = Curves.easeInQuad.transform(rawFraction);
            final yTranslate = bottomSectionSafeInset * fraction;
            final offstage = fraction >= 1.0;

            return Transform.translate(
              offset: Offset(0.0, yTranslate),
              child: Offstage(
                offstage: offstage,
                child: child!,
              ),
            );
          },
          child: pageIndexProvider(
            builder: (pageIndex) => BlocBuilder<FactExplanationCubit, FactExplanationState>(
              bloc: cubits[pageIndex],
              builder: (context, state) => BottomSection(
                isLoading: state.loadingFactExplanation,
                onAccountTap: widget.goToAccount,
                onReadMoreTap: () => NavigationUtil.onExplainFact(
                  context: context,
                  cubit: cubits[pageIndex],
                  scrollToExplanationCallback: () => pageKeys[pageIndex]
                      .currentState
                      ?.scrollPageTo(pageSafeHeight),
                  onUnlockProceedCallback: storyController.pause,
                  onUnlockMethodDismissedCallback: storyController.play,
                ),
              ),
            ),
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
    if (pageIndex.value == index) switcherScrollOffset.value = offset;
    verticalScrollOffsets[index].value = offset;
    checkPlaybackForScrollOffset(offset);
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
}
