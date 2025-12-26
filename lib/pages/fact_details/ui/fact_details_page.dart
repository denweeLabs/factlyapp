import 'dart:io';

import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/constants/app/user_interests.dart';
import 'package:denwee/core/ui/router/root_router.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/navigation_util.dart';
import 'package:denwee/core/ui/widget/buttons/archive_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/back_button_widget.dart';
import 'package:denwee/core/ui/widget/common/common_pop_scope_widget.dart';
import 'package:denwee/core/ui/widget/common/common_scaffold_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/pages/fact_details/ui/cubit/fact_explanation_cubit.dart';
import 'package:denwee/pages/fact_details/ui/widget/components/scroll_back_button_widget.dart';
import 'package:denwee/pages/home/ui/widget/page_view/components/background.dart';
import 'package:denwee/pages/home/ui/widget/page_view/components/bottom_section.dart';
import 'package:denwee/pages/home/ui/widget/page_view/page_components/fact_page.dart';
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
  late final verticalScrollOffset = ValueNotifier<double>(0.0);
  late final pageKey = GlobalKey<FactPageState>();

  late double bottomSectionInset;
  late double bottomSectionSafeInset;
  late double scrollViewTopPadding;
  late double pageSafeHeight;

  @override
  void initState() {
    super.initState();
    context.read<FactExplanationCubit>().checkFactExplanation();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bottomSectionInset = getBottomSectionInset(context);
    bottomSectionSafeInset = bottomSectionInset + BottomSection.containerHeight;
    scrollViewTopPadding = context.topPadding + 78.h;
    pageSafeHeight = 1.sh - scrollViewTopPadding - bottomSectionSafeInset;
  }

  @override
  void dispose() {
    verticalScrollOffset.dispose();
    super.dispose();
  }

  double getBottomSectionInset(BuildContext context) {
    final bottomPadding = context.bottomPadding;
    final hasBottomPadding = bottomPadding > 0;
    if (Platform.isIOS) return hasBottomPadding ? bottomPadding : 24.h;
    return hasBottomPadding ? bottomPadding + 16.h : 24.h;
  }

  @override
  Widget build(BuildContext context) {
    return CommonPopScope(
      onWillPop: Navigator.of(context).pop,
      child: CommonScaffold(
        systemOverlayType: ThemeType.dark,
        style: CommonBackgroundStyle.solid,
        body: Stack(
          children: [
            _buildBackground(),
            _buildFactPage(),
            _buildAppBar(),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  FactBackgroundImage _buildBackground() {
    return FactBackgroundImage(
      pageHeight: pageSafeHeight,
      scrollOffset: verticalScrollOffset,
      imagePath: AppConstants.assets.images.interest(
        widget.fact.interest.id.value,
      ),
    );
  }

  Widget _buildFactPage() {
    return FactPage(
      key: pageKey,
      fact: widget.fact,
      pageHeight: pageSafeHeight,
      cubit: context.read<FactExplanationCubit>(),
      verticalScrollOffset: verticalScrollOffset,
      onVerticalScrollChanged: _onVerticalScrollChanged,
      scrollViewTopPadding: scrollViewTopPadding,
      defaultContentPadding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 38.h),
      detailedContentPadding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: context.bottomPadding +
            32.h +
            FactScrollBackButton.size +
            42.h,
      ),
    );
  }

  Widget _buildBottomSection() {
    return Positioned(
      left: 14.w,
      right: 14.w,
      bottom: bottomSectionInset,
      child: ValueListenableBuilder(
        valueListenable: verticalScrollOffset,
        builder: (context, offset, child) {
          final rawFraction = (offset / pageSafeHeight).clamp(0.0, 1.0);
          final fraction = Curves.easeInOut.transform(rawFraction);
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
          builder: (context, state) => BottomSection(
            isLoading: state.loadingFactExplanation,
            onAccountTap: () => context.restorablePushReplacementNamedArgs(Routes.account),
            onReadMoreTap: () => NavigationUtil.onExplainFact(
              context: context,
              cubit: context.read<FactExplanationCubit>(),
              scrollToExplanationCallback: () =>
                  pageKey.currentState?.scrollPageTo(pageSafeHeight),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: context.topPadding + 20.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBackButton(
            color: context.lightIconColor,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
          ),
          BackdropSurfaceContainer.ellipse(
            borderColor: Colors.white12,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18.w,
                vertical: 10.h,
              ),
              child: Text(
                widget.fact.interest.tryTranslate(context) ?? '',
                style: h6.copyWith(
                  color: context.lightTextColor,
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
            type: AppArchiveButtonType.iconOnly,
            iconPadding: EdgeInsets.symmetric(horizontal: 20.w),
          ),
        ],
      ),
    );
  }

  void _onVerticalScrollChanged(double offset) {
    verticalScrollOffset.value = offset;
  }
}
