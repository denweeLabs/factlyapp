import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class AnimatedHourMinuteTime extends StatelessWidget {
  const AnimatedHourMinuteTime({
    super.key,
    required this.time,
    this.style,
    this.addShadow = true,
    this.forceLightColor = false,
  });

  final DateTime time;
  final TextStyle? style;
  final bool addShadow;
  final bool forceLightColor;

  @override
  Widget build(BuildContext context) {
    final timeInDouble = timeToDouble(time);

    return AnimatedFlipCounter(
      value: timeInDouble,
      decimalSeparator: ':',
      fractionDigits: 2,
      curve: Curves.easeOutQuint,
      duration: const Duration(milliseconds: 1000),
      textStyle: (style ?? h0).copyWith(
        color: forceLightColor ? context.lightTextColor : null,
        shadows:
            !addShadow
                ? null
                : [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(2.0, 4.0),
                    blurRadius: 12.0,
                  ),
                ],
      ),
    );
  }
}
