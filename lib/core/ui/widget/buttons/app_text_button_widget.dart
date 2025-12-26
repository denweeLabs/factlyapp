import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/core_tap_bounce_animation.dart';
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

    return CoreTapBounceAnimation(
      onTap: onTap,
      builder: (context, isHovered) => Padding(
        padding: thisPadding,
        child: AnimatedDefaultTextStyle(
          duration: animationDuration,
          style: thisTextStyle.copyWith(
            color: isHovered ? thisColor.withValues(alpha: 0.4) : thisColor,
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
