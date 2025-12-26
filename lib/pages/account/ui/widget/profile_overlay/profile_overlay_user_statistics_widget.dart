import 'package:denwee/core/statistics/domain/entity/user_statistics.dart';
import 'package:denwee/core/ui/router/page_routes_builders/cross_fade_page_route_builder.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/animated_icons/smiling_star_animated_icon_widget.dart';
import 'package:denwee/core/ui/widget/animations/animated_icons/fire_animatied_icon_widget.dart';
import 'package:denwee/core/ui/widget/animations/animated_icons/question_animated_icon_widget.dart';
import 'package:denwee/core/ui/widget/animations/animated_number_widget.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_fade_animation.dart';
import 'package:denwee/core/ui/widget/animations/transitions/hero_transition.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:denwee/pages/account/ui/widget/statistics/stat_hint_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

enum StatisticItem { stars, streak, facts }

extension StatisticItemX on StatisticItem {
  String title(BuildContext context) {
    switch (this) {
      case StatisticItem.stars:
        return context.tr(LocaleKeys.account_statistics_stars_title);
      case StatisticItem.streak:
        return context.tr(LocaleKeys.account_statistics_streak_title);
      case StatisticItem.facts:
        return context.tr(LocaleKeys.account_statistics_facts_title);
    }
  }

  String hint(BuildContext context) {
    switch (this) {
      case StatisticItem.stars:
        return context.tr(LocaleKeys.account_statistics_stars_hint);
      case StatisticItem.streak:
        return context.tr(LocaleKeys.account_statistics_streak_hint);
      case StatisticItem.facts:
        return context.tr(LocaleKeys.account_statistics_facts_hint);
    }
  }
}

class ProfileOverlayUserStatistics extends StatefulWidget {
  const ProfileOverlayUserStatistics({super.key, required this.statistics});

  final UserStatistics statistics;

  @override
  State<ProfileOverlayUserStatistics> createState() => _ProfileOverlayUserStatisticsState();
}

class _ProfileOverlayUserStatisticsState extends State<ProfileOverlayUserStatistics> {
  var isFramePassed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => isFramePassed = true);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildItem(
          context: context,
          item: StatisticItem.stars,
          icon: const Padding(
            padding: EdgeInsets.only(left: 2),
            child: SmilingStarAnimatedIcon(animate: false),
          ),
          value: widget.statistics.stars,
        ),
        _buildItem(
          context: context,
          item: StatisticItem.streak,
          icon: const FireAnimatedIcon(animate: true),
          value: widget.statistics.currentStreak,
        ),
        _buildItem(
          context: context,
          item: StatisticItem.facts,
          icon: QuestionAnimatedIcon(
            animate: false,
            onInit: (controller) {
              if (isFramePassed) {
                controller.value = 0.5;
                return;
              }
              controller
                ..value = 1.0
                ..animateBack(0.5);
            },
          ),
          value: widget.statistics.knownFacts,
        ),
      ].insertBetween(_buildDivider(context)),
    );
  }

  Widget _buildItem({
    required BuildContext context,
    required StatisticItem item,
    required int value,
    required Widget icon,
  }) {
    return Expanded(
      child: BounceTapFadeAnimation(
        minScale: 1.0,
        onTap: () => _showStatisticHintDialog(context, item),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                8.horizontalSpace,
                AnimatedNumber(
                  number: value,
                  style: h3.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.textColor,
                    letterSpacing: -1.6,
                  ),
                ),
                3.horizontalSpace,
                RepaintBoundary(
                  child: HeroTransition(
                    tag: item.title(context),
                    child: icon,
                  ),
                ),
              ],
            ),
            2.verticalSpace,
            Text(
              item.title(context),
              style: bodyS.copyWith(color: context.textColorSecondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      width: 2,
      height: 30.h,
      color: context.theme.dividerColor,
    );
  }

  void _showStatisticHintDialog(BuildContext context, StatisticItem item) {
    Navigator.of(context, rootNavigator: true).push(CrossFadePageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      barrierColor: context.primaryContainer.withValues(alpha: 0.97),
      builder: (_) => StatHint(item: item),
    ));
  }
}
