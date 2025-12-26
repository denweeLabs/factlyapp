import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class UndercoverCardTitle extends StatelessWidget {
  const UndercoverCardTitle({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.translate(
          offset: const Offset(24.0, 12.0),
          child: Text(
            title,
            style: h0.copyWith(
              height: 0.0,
              color: context.textColor.withValues(alpha: 0.1),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
