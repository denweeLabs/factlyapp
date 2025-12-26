part of 'package:denwee/pages/home/ui/widget/page_view/daily_facts_story_view_widget.dart';

class _BackAndTitle extends StatelessWidget {
  const _BackAndTitle({
    required this.title,
    required this.opacity,
    required this.onBack,
  });

  final String title;
  final double opacity;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Row(
        children: [
          Offstage(
            offstage: opacity <= 0.0,
            child: AppBackButton(
              color: context.lightIconColor,
              onTap: onBack,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
            ),
          ),
          const Spacer(),
          AnimatedSwitcher(
            duration: CustomAnimationDurations.lowMedium,
            transitionBuilder: AnimatedSwitchers.fadeBlurXTransition,
            switchInCurve: const Interval(0.2, 1.0, curve: Curves.fastEaseInToSlowEaseOut),
            switchOutCurve: const Interval(0.5, 1.0, curve: Curves.ease),
            child: ConstrainedBox(
              key: ValueKey(title),
              constraints: BoxConstraints(maxWidth: 0.65.sw),
              child: BackdropSurfaceContainer.ellipse(
                borderColor: Colors.white12,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 10.h,
                  ),
                  child: Text(
                    title,
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
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
