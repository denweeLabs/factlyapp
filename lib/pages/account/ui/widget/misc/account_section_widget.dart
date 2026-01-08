import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({
    super.key,
    required this.title,
    required this.children,
    this.verticalSpacing = 18,
    this.titlePadding,
    this.childrenPadding,
  });

  final String title;
  final List<Widget> children;
  final int verticalSpacing;
  final EdgeInsets? titlePadding;
  final EdgeInsets? childrenPadding;

  static final defaultPadding = EdgeInsets.symmetric(horizontal: 24.w);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: titlePadding ?? defaultPadding,
          child: Text(
            title,
            style: h2.copyWith(
              color: context.textColor,
              fontWeight: FontWeight.w700,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        (verticalSpacing).verticalSpace,
        Padding(
          padding: childrenPadding ?? defaultPadding,
          child: Column(children: children),
        ),
      ],
    );
  }
}
