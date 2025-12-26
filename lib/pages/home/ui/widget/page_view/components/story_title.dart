part of 'package:denwee/pages/home/ui/widget/page_view/daily_facts_story_view_widget.dart';

class _StoryTitle extends StatelessWidget {
  const _StoryTitle({required this.fact});

  final DailyFact fact;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: CustomAnimationDurations.lowMedium,
      switchInCurve: Curves.linearToEaseOut,
      switchOutCurve: Curves.easeInToLinear,
      transitionBuilder: AnimatedSwitchers.fadeBlurXTransition,
      child: Row(
        key: ValueKey(fact.id.value),
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  fact.interest.tryTranslate(context) ?? '',
                  style: h5.copyWith(
                    color: context.lightTextColor,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                if (fact.region.isSome()) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Text(
                      '•',
                      style: h6.copyWith(
                        color: context.lightTextColor,
                        height: 0.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      fact.region.toNullable()!,
                      style: h6.copyWith(
                        color: context.lightTextColorSecondary,
                        height: 0.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
