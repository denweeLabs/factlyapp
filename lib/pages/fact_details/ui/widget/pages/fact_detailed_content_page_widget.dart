import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/widget/misc/app_markdown_text_widget.dart';
import 'package:flutter/material.dart';

class FactDetailedContentPage extends StatelessWidget {
  const FactDetailedContentPage({
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
