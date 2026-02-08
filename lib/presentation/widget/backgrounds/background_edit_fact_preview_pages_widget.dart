import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/bloc/backgrounds/background_edit_cubit.dart';
import 'package:denwee/presentation/bloc/facts/daily_facts_cubit.dart';
import 'package:denwee/presentation/bloc/facts/fact_explanation_cubit.dart';
import 'package:denwee/presentation/widget/facts/stories_components/src/widgets/stories_fact_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class BackgroundEditFactPreviewPages extends StatefulWidget {
  const BackgroundEditFactPreviewPages({
    super.key,
    required this.pageController,
    required this.pageSwitchDuration,
    required this.pageSwitchCurve,
  });

  final PageController pageController;
  final Duration pageSwitchDuration;
  final Curve pageSwitchCurve;

  @override
  State<BackgroundEditFactPreviewPages> createState() =>
      _PreviewFactPagesState();
}

class _PreviewFactPagesState extends State<BackgroundEditFactPreviewPages> {
  late final pageHeight = 0.75.sh;
  late final topPadding = context.topPadding + 24.h;

  late final controller = PageController();
  late final pageIndex = ValueNotifier<int>(0);

  late List<FactExplanationCubit> cubits = [];

  @override
  void initState() {
    super.initState();
    cubits = getIt<DailyFactsCubit>().state.facts
        .map((fact) => getIt<FactExplanationCubit>(param1: fact))
        .toList();
  }

  @override
  void dispose() {
    for (final cubit in cubits) {
      cubit.close();
    }
    controller.dispose();
    pageIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyFactsCubit, DailyFactsState>(
      builder: (context, factsState) {
        final facts = factsState.facts;

        if (facts.isEmpty) return const SizedBox.shrink();

        return PageView.builder(
          itemCount: facts.length,
          controller: widget.pageController,
          onPageChanged: (index) => pageIndex.value = index,
          itemBuilder: (context, index) {
            final fact = facts[index];

            return Center(
              child: ValueListenableBuilder(
                valueListenable: pageIndex,
                builder: (context, pageIndex, child) => AnimatedOpacity(
                  opacity: pageIndex == index ? 1.0 : 0.0,
                  duration: widget.pageSwitchDuration,
                  curve: widget.pageSwitchCurve,
                  child: child!,
                ),
                child: BlocProvider.value(
                  value: cubits[index],
                  child: BlocBuilder<BackgroundEditCubit, BackgroundEditState>(
                    builder: (_, state) {
                      return StoriesFactPage(
                        fact: fact,
                        ignorePointer: true,
                        cubit: cubits[index],
                        pageHeight: pageHeight,
                        scrollViewTopPadding: topPadding,
                        initialScrollOffset: 0.0,
                        onVerticalScrollChanged: (_) {},
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        defaultContentPadding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                        ),
                        detailedContentPadding: EdgeInsets.zero,
                        backgroundStyle: state.backgroundStyle,
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
