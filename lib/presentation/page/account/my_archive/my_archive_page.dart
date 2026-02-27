import 'package:denwee/core/facts/domain/entity/archived_fact.dart';
import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/presentation/bloc/facts/facts_archive_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/constants/formatters/date_formatters.dart';
import 'package:denwee/presentation/shared/router/root_router.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/animations/scroll_physics/less_responsive_scroll_physics.dart';
import 'package:denwee/presentation/widget/shared/common/common_app_bar_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_loading_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_no_results_found_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_scaffold_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/widget/facts/archived_fact_tile_widget.dart';
import 'package:denwee/presentation/page/fact_details/args/fact_details_page_args.dart';
import 'package:denwee/presentation/widget/shared/misc/solid_fading_edge_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:utils/utils.dart';

class MyArchivePage extends StatefulWidget {
  const MyArchivePage({super.key});

  static const routeName = 'MyArchivePage';

  @override
  State<MyArchivePage> createState() => _MyArchivePageState();
}

class _MyArchivePageState extends State<MyArchivePage> {
  late final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    context.read<FactsArchiveCubit>().fetchArchiveList();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      iconPath: AppConstants.assets.icons.archiveTickLinear,
      body: BlocBuilder<FactsArchiveCubit, FactsArchiveState>(
        builder: (context, state) => Column(
          children: [
            CommonAppBar(
              backgroundColor: _getHeaderBackgroundColor(state.archiveIds.isNotEmpty),
              title: context.tr(
                LocaleKeys.account_section_daily_facts_items_archive,
              ),
            ),
            Expanded(
              child: AnimatedSwitcher(
                switchInCurve: Curves.fastEaseInToSlowEaseOut,
                switchOutCurve: const Interval(0.5, 1.0, curve: Curves.ease),
                duration: CustomAnimationDurations.medium,
                child: () {
                  if (state.archiveIds.isEmpty) return _buildNoResults();
                  if (state.isFetching && state.archiveList.isEmpty) return _buildLoading();
                  return _buildGroups(state, context);
                }(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoResults() {
    return const Center(
      key: ValueKey(0),
      child: CommonNoResultsFound(
        of: NoResultsFoundOf.archive,
        padding: EdgeInsets.only(bottom: 32.0),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      key: ValueKey(1),
      child: CommonLoading(),
    );
  }

  Widget _buildGroups(FactsArchiveState state, BuildContext context) {
    final data = state.groupedByMonth;

    return SolidVerticalFadingEdge(
      key: const ValueKey(2),
      backgroundColor: context.theme.colorScheme.background,
      size: const FadingEdges.bottom(100),
      child: CustomScrollView(
        controller: scrollController,
        physics: const LessResponsiveScrollPhysics(
          parent: ClampingScrollPhysics(),
        ),
        slivers: [
          ...data.entries.map(
            (group) => _buildStickyGroup(context, group),
          ),
          SliverToBoxAdapter(
            child: AnimatedSwitcher(
              duration: CustomAnimationDurations.ultraLow,
              child: state.isFetchingMore
                  ? _buildLoadingMore()
                  : const SizedBox.shrink(key: ValueKey(false)),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 32.h + context.bottomPadding),
          ),
        ],
      ),
    );
  }

  Widget _buildStickyGroup(
    BuildContext context,
    MapEntry<DateTime, List<ArchivedFact>> group,
  ) {
    final monthAndYear = archive_month.format(group.key);

    return SliverStickyHeader.builder(
      builder: (context, state) {
        final backgroundColor = _getHeaderBackgroundColor(state.isPinned);
        
        return PhysicalModel(
          color: backgroundColor,
          elevation: state.isPinned ? 4.0 : 0.0,
          shadowColor: Colors.black26,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Center(
              child: Text(
                monthAndYear.capitalizeFirstLetter,
                style: h4.copyWith(color: context.textColor),
              ),
            ),
          ),
        );
      },
      sliver: SliverPadding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final archivedFact = group.value[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
                child: ArchivedFactTile(
                  fact: archivedFact.fact,
                  onTap: () => _onTap(context, archivedFact.fact),
                ),
              );
            },
            childCount: group.value.length,
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingMore() {
    return SizedBox(
      key: const ValueKey(true),
      width: 70.h,
      height: 60.h,
      child: const CommonLoading(),
    );
  }

  void _onTap(BuildContext context, DailyFact fact) {
    final args = FactDetailsPageArgs(fact: fact);
    context.restorablePushNamedArgs(
      Routes.factDetails,
      argsToJson: args.toJson,
      rootNavigator: true,
    );
  }

  void _scrollListener() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 100) {
      context.read<FactsArchiveCubit>().fetchMoreArchiveList();
    }
  }

  Color _getHeaderBackgroundColor(bool isPinned) {
    final opacity = isPinned ? 1.0 : 0.0;
    if (context.isLightTheme) {
      return context.theme.colorScheme.background.withValues(alpha: opacity);
    }
    return context.primaryContainer.withValues(alpha: opacity);
  }
}
