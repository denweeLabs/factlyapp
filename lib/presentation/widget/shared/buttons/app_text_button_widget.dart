import 'dart:ui';

import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/tap_animations/bounce_tap_with_builder_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.text,
    this.textColor,
    this.onTap,
    this.textStyle,
    this.padding,
  });

  final String text;
  final Color? textColor;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  static const animationDuration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final thisColor = textColor ?? context.textColor;
    final thisPadding = padding ?? EdgeInsets.symmetric(vertical: 16.h);
    final thisTextStyle = textStyle ?? textButton;

    return Material(
      type: MaterialType.transparency,
      child: BounceTapWithBuilderAnimation(
        onTap: onTap,
        builder: (context, animation) {
          return Padding(
            padding: thisPadding,
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
                final opacity = lerpDouble(thisColor.a, 0.4, animation.value)!;

                return Text(
                  text,
                  style: thisTextStyle.copyWith(
                    color: thisColor.withValues(alpha: opacity),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
