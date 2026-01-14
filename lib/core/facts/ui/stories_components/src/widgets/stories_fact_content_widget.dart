import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/ui/constants/app/user_interests.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/widget/misc/app_markdown_text_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoriesFactShortContent extends StatelessWidget {
  const StoriesFactShortContent({
    super.key,
    required this.fact,
    required this.padding,
  });

  final DailyFact fact;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFactHeader(
            context: context,
            emoji: fact.interest.emoji ?? '',
            title: fact.title,
            date: fact.displayDateText(),
          ),
          24.verticalSpace,
          AppMarkdownText(data: fact.content),
        ],
      ),
    );
  }

  static Widget buildFactHeader({
    required BuildContext context,
    required String emoji,
    required String title,
    required String? date,
    Color? elipseColor,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BackdropSurfaceContainer.ellipse(
          size: Size.square(46.w),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: elipseColor ?? Colors.white,
          child: Center(
            child: Text(
              emoji,
              style: TextStyle(fontSize: 20.sp, color: Colors.black),
            ),
          ),
        ),
        12.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: factHeaderTitle.copyWith(color: context.lightTextColor),
                overflow: TextOverflow.ellipsis,
                maxLines: date != null ? 1 : 2,
              ),
              if (date != null) ...[
                1.verticalSpace,
                Text(
                  date,
                  style: bodyM.copyWith(color: context.lightTextColorSecondary),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class StoriesFactLongContent extends StatelessWidget {
  const StoriesFactLongContent({
    super.key,
    required this.fullContent,
    required this.streamedContent,
    required this.padding,
  });

  final String? fullContent;
  final Stream<String>? streamedContent;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    if (fullContent == null && streamedContent == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: padding,
      child: fullContent != null
          ? AppMarkdownText(data: fullContent!, textStyle: markdownDetailed)
          : StreamedMarkdownText(stream: streamedContent, textStyle: markdownDetailed),
    );
  }
}
