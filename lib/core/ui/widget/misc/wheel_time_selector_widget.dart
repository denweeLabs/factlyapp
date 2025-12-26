import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/fade_loop_animation.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/core/ui/widget/common/common_wheel_listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WheelTimeSelector extends StatefulWidget {
  const WheelTimeSelector({
    super.key,
    required this.onChanged,
    required this.hoursController,
    required this.minutesController,
    this.padding,
    this.hoursGenerator,
    this.minutesGenerator,
  });

  final void Function(DateTime) onChanged;
  final FixedExtentScrollController hoursController;
  final FixedExtentScrollController minutesController;
  final EdgeInsets? padding;
  final List<int> Function()? hoursGenerator;
  final List<int> Function()? minutesGenerator;

  @override
  State<WheelTimeSelector> createState() => _WheelTimeSelectorState();
}

class _WheelTimeSelectorState extends State<WheelTimeSelector> {
  static final itemExtent = 54.h;

  late final hours =
      widget.hoursGenerator?.call() ?? List<int>.generate(24, (i) => i);
  late final minutes =
      widget.minutesGenerator?.call() ?? List<int>.generate(59, (i) => i);

  late final ValueNotifier<int> currentHour;
  late final ValueNotifier<int> currentMinute;

  void _buildDateTime() {
    final dateTime = DateTime(
      1970,
      1,
      1,
      currentHour.value,
      currentMinute.value,
    );
    widget.onChanged(dateTime);
  }

  @override
  void initState() {
    super.initState();
    currentHour = ValueNotifier(hours[widget.hoursController.initialItem]);
    currentMinute = ValueNotifier(
      minutes[widget.minutesController.initialItem],
    );
  }

  @override
  void dispose() {
    currentHour.dispose();
    currentMinute.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: FadeLoopAnimation(
            delay: Duration.zero,
            child: Text(':', style: h2.copyWith(color: context.textColor)),
          ),
        ),
        Padding(
          padding: widget.padding ?? EdgeInsets.zero,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: _buildHoursWheel()),
                  Expanded(child: _buildMinutesWheel()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHoursWheel() {
    return ValueListenableBuilder(
      valueListenable: currentHour,
      builder: (context, currentHour, _) => CommonWheelListView<int>(
        items: hours,
        builder: (_, hour) => BounceTapAnimation(
          onTap: () => _animateHour(hour),
          child: _Hour(hour),
        ),
        controller: widget.hoursController,
        onChanged: (item) {
          this.currentHour.value = item;
          _buildDateTime();
        },
        isLooping: true,
        itemExtent: itemExtent,
      ),
    );
  }

  Widget _buildMinutesWheel() {
    return ValueListenableBuilder(
      valueListenable: currentMinute,
      builder: (context, currentMinute, _) => CommonWheelListView<int>(
        items: minutes,
        builder: (_, minute) => BounceTapAnimation(
          onTap: () => _animateMinute(minute),
          child: _Minute(minute),
        ),
        controller: widget.minutesController,
        onChanged: (item) {
          this.currentMinute.value = item;
          _buildDateTime();
        },
        isLooping: false,
        itemExtent: itemExtent,
      ),
    );
  }

  void _animateHour(int item) {
    widget.hoursController.animateToItem(
      hours.indexOf(item),
      duration: CustomAnimationDurations.low,
      curve: Curves.linearToEaseOut,
    );
  }

  void _animateMinute(int item) {
    widget.minutesController.animateToItem(
      minutes.indexOf(item),
      duration: CustomAnimationDurations.low,
      curve: Curves.linearToEaseOut,
    );
  }
}

class _Hour extends StatelessWidget {
  final int hour;

  const _Hour(this.hour);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$hour'.padLeft(2, '0'),
        style: h2.copyWith(color: context.textColor, letterSpacing: -1.0),
      ),
    );
  }
}

class _Minute extends StatelessWidget {
  final int mins;

  const _Minute(this.mins);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$mins'.padLeft(2, '0'),
        style: h2.copyWith(color: context.textColor, letterSpacing: -1.0),
      ),
    );
  }
}
