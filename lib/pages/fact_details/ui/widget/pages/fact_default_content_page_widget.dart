import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/ui/widget/misc/app_markdown_text_widget.dart';
import 'package:denwee/pages/home/ui/widget/page_view/page_components/fact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FactDefaultContentPage extends StatelessWidget {
  const FactDefaultContentPage({
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
          buildFactHeader(context, fact),
          24.verticalSpace,
          AppMarkdownText(data: fact.content),
        ],
      ),
    );
  }
}
