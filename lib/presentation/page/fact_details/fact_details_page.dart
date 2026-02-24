// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:denwee/core/backgrounds/domain/entity/background_style.dart';
import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/presentation/bloc/backgrounds/active_background_cubit.dart';
import 'package:denwee/presentation/bloc/facts/fact_share_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/user_interests.dart';
import 'package:denwee/presentation/shared/router/root_router.dart';
import 'package:denwee/presentation/shared/theme/app_colors.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/utils/navigation_util.dart';
import 'package:denwee/presentation/widget/facts/stories_components/src/widgets/stories_fact_capture_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/archive_button_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/back_button_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_pop_scope_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_scaffold_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/surface_container_widget.dart';
import 'package:denwee/presentation/bloc/facts/fact_explanation_cubit.dart';
import 'package:denwee/presentation/widget/facts/stories_components/src/widgets/stories_scrollup_button_widget.dart';
import 'package:denwee/presentation/widget/facts/stories_components/src/widgets/stories_view_background_widget.dart';
import 'package:denwee/presentation/widget/facts/stories_components/src/widgets/stories_bottom_action_section_widget.dart';
import 'package:denwee/presentation/widget/facts/stories_components/src/widgets/stories_fact_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class FactDetailsPage extends StatefulWidget {
  const FactDetailsPage({super.key, required this.fact});

  final DailyFact fact;

  static const routeName = 'FactDetailsPage';

  @override
  State<FactDetailsPage> createState() => _FactDetailsPageState();
}

class _FactDetailsPageState extends State<FactDetailsPage> {
  late final verticalScrollFraction = ValueNotifier<double>(0.0);
  late final pageKey = GlobalKey<StoriesFactPageState>();

  late double bottomSectionInset;
  late double bottomSectionSafeInset;
  late double scrollViewTopPadding;
  late double pageSafeHeight;
  late double pageHeightInv;

  @override
  void initState() {
    super.initState();
    context.read<FactExplanationCubit>().checkFactExplanation();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bottomSectionInset = getBottomSectionInset(context);
    bottomSectionSafeInset = bottomSectionInset + StoriesBottomActionSection.containerHeight;
    scrollViewTopPadding = context.topPadding + 78.h;
    pageSafeHeight = 1.sh - scrollViewTopPadding - bottomSectionSafeInset;
    pageHeightInv = 1 / pageSafeHeight;
  }

  @override
  void dispose() {
    verticalScrollFraction.dispose();
    super.dispose();
  }

  double getBottomSectionInset(BuildContext context) {
    final bottomPadding = context.bottomPadding;
    final hasBottomPadding = bottomPadding > 0;
    if (Platform.isIOS) return hasBottomPadding ? bottomPadding : 24.h;
    return hasBottomPadding ? bottomPadding + 16.h : 24.h;
  }

  double resolveScrollFraction(double offset) {
    final value = offset * pageHeightInv;
    if (value <= 0.0) return 0.0;
    if (value >= 1.0) return 1.0;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    final backgroundStyle = context
        .read<ActiveBackgroundCubit>()
        .state
        .appliedBackground
        .toNullable()
        ?.background
        .style;

    final backgroundBrightness = backgroundStyle?.brightness ?? Brightness.dark;
    final systemOverlayType = backgroundBrightness == Brightness.light
        ? ThemeType.light
        : ThemeType.dark;
    
    return CommonPopScope(
      onWillPop: Navigator.of(context).pop,
      child: CommonScaffold(
        systemOverlayType: systemOverlayType,
        systemNavigationBarContrastEnforced: false,
        backgroundColor: AppColors.primaryBackground[ThemeType.dark],
        body: StoriesFactCapture(
          builder: (context, captureArea, isWatermark, factOverlayKey) {
            /// Function checks if widget is visible during fact screenshot
            Widget _ifVisible(Widget Function() child) {
              return AnimatedOpacity(
                duration: FactShareCubit.layoutPrepareDuration,
                opacity: captureArea == FactCaptureArea.page ? 0.0 : 1.0,
                child: child(),
              );
            }

            return Stack(
              children: [
                _buildBackground(),
                _buildFactPage(
                  showWatermark: isWatermark,
                  isCapturing: captureArea != null,
                  overlayKey: factOverlayKey,
                  brightness: backgroundBrightness,
                  backgroundStyle: backgroundStyle,
                ),
                _ifVisible(() => _buildAppBar(
                  backgroundStyle: backgroundStyle,
                )),
                _ifVisible(() => _buildBottomSection(
                  backgroundStyle: backgroundStyle,
                )),
              ],
            );
          },
        ),
      ),
    );
  }

  StoriesViewBackground _buildBackground() {
    return StoriesViewBackground(
      scrollFraction: verticalScrollFraction,
      defaultCustomImagePath: widget.fact.interest.imagePath,
    );
  }

  Widget _buildFactPage({
    required bool showWatermark,
    required bool isCapturing,
    required GlobalKey overlayKey,
    required Brightness brightness,
    required BackgroundStyle? backgroundStyle,
  }) {
    return Positioned.fill(
      child: RepaintBoundary(
        key: overlayKey,
        child: StoriesFactPage(
          key: pageKey,
          fact: widget.fact,
          pageHeight: pageSafeHeight,
          cubit: context.read<FactExplanationCubit>(),
          initialScrollOffset: 0.0,
          onVerticalScrollChanged: _onVerticalScrollChanged,
          scrollViewTopPadding: scrollViewTopPadding,
          showWatermark: showWatermark,
          isCapturing: isCapturing,
          defaultContentPadding: EdgeInsets.symmetric(horizontal: 14.w),
          detailedContentPadding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            bottom: context.bottomPadding +
                32.h +
                StoriesScrollupButton.size +
                42.h,
          ),
          backgroundBrightness: brightness,
          backgroundStyle: backgroundStyle,
        ),
      ),
    );
  }

  Widget _buildBottomSection({
    required BackgroundStyle? backgroundStyle,
  }) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.fromLTRB(14.w, 0.0, 14.w, bottomSectionInset),
        child: ValueListenableBuilder(
          valueListenable: verticalScrollFraction,
          builder: (context, scrollFraction, child) {
            final fraction = Curves.easeInOut.transform(scrollFraction);
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
          child: BlocBuilder<FactExplanationCubit, FactExplanationState>(
            builder: (context, state) => StoriesBottomActionSection(
              isLoadingExplanation: state.loadingFactExplanation,
              onAccountTap: () => context.restorablePushReplacementNamedArgs(Routes.account),
              onBackgroundsTap: () => context.restorablePushReplacementNamedArgs(Routes.availableBackgrounds),
              onReadMoreTap: () => NavigationUtil.onExplainFact(
                context: context,
                cubit: context.read<FactExplanationCubit>(),
                scrollToExplanationCallback: () =>
                    pageKey.currentState?.scrollPageTo(pageSafeHeight),
              ),
              backgroundStyle: backgroundStyle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar({
    required BackgroundStyle? backgroundStyle,
  }) {
    final bubbleBorderColor = backgroundStyle?.textColor ?? Colors.white;
    
    return Padding(
      padding: EdgeInsets.only(top: context.topPadding + 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBackButton(
            color: backgroundStyle?.textColor ?? context.lightIconColor,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
          ),
          SurfaceContainer.ellipse(
            borderColor: bubbleBorderColor.withValues(alpha: 0.12),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18.w,
                vertical: 10.h,
              ),
              child: Text(
                widget.fact.interest.tryTranslate(context) ?? '',
                style: h6.copyWith(
                  color: backgroundStyle?.textColor ?? context.lightTextColor,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          AppArchiveButton(
            factId: widget.fact.id,
            iconColor: backgroundStyle?.textColor,
            iconPadding: EdgeInsets.symmetric(horizontal: 20.w),
          ),
        ],
      ),
    );
  }

  void _onVerticalScrollChanged(double offset) {
    verticalScrollFraction.value = resolveScrollFraction(offset);
  }
}
