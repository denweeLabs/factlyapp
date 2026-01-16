import 'dart:math';

import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/fade_loop_animation.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/common/common_wheel_listview_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationTimeSelector extends StatefulWidget {
  const NotificationTimeSelector({
    super.key,
    this.initialTime,
    required this.onChanged,
  });

  final DateTime? initialTime;
  final void Function(DateTime) onChanged;

  @override
  State<NotificationTimeSelector> createState() =>
      _NotificationTimeSelectorState();
}

class _NotificationTimeSelectorState extends State<NotificationTimeSelector> {
  static final itemExtent = 54.h;

  late final FixedExtentScrollController hoursController;
  late final FixedExtentScrollController minutesController;

  late final List<int> hours;
  late final List<int> minutes;

  late DateTime selectedTime = widget.initialTime ?? DateTime(0);

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
    hours = _generateHours();
    minutes = _generateMinutes();

    final initHour = widget.initialTime != null
        ? hours.indexOf(widget.initialTime!.hour)
        : hours.indexOf(1);

    final initMinute = widget.initialTime != null
        ? minutes.indexOf(widget.initialTime!.minute)
        : 0;

    hoursController = FixedExtentScrollController(
      initialItem: max(0, initHour - 4),
    );
    minutesController = FixedExtentScrollController(initialItem: initMinute);

    currentHour = ValueNotifier(hours[hoursController.initialItem]);
    currentMinute = ValueNotifier(minutes[minutesController.initialItem]);

    Future.delayed(CustomAnimationDurations.mediumHigh, () {
      hoursController.animateToItem(
        hours.indexOf(initHour),
        duration: CustomAnimationDurations.mediumHigh,
        curve: Curves.linearToEaseOut,
      );
    });
  }

  @override
  void dispose() {
    hoursController.dispose();
    minutesController.dispose();
    currentHour.dispose();
    currentMinute.dispose();
    super.dispose();
  }

  List<int> _generateHours() {
    final items = <int>[];
    final totalHours = 24;
    for (var i = 0; i < totalHours; i++) {
      items.add(i);
    }
    return items;
  }

  List<int> _generateMinutes() {
    return [0, AppConstants.config.notificationTimeSelectionStepMin];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: double.infinity,
            height: itemExtent,
            decoration: BoxDecoration(
              color: context.primaryContainer,
              border: Border.all(
                color: context.isLightTheme ? Colors.black12 : Colors.white10,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(32)),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            12.horizontalSpace,
            BackdropSurfaceContainer.circle(
              color: context.theme.colorScheme.primary,
              size: const Size.square(38),
              child: CommonAppIcon(
                path: AppConstants.assets.icons.clockLinear,
                color: context.lightIconColor,
                size: 18,
              ),
            ),
            8.horizontalSpace,
            Expanded(
              child: Text(
                context.tr(
                  LocaleKeys
                      .onboarding_select_notification_time_time_selection_title,
                ),
                style: bodyL.copyWith(color: context.textColor),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            SizedBox(width: 64.w, child: _buildHoursWheel()),
            FadeLoopAnimation(
              delay: Duration.zero,
              child: Text(':', style: h2.copyWith(color: context.textColor)),
            ),
            SizedBox(width: 64.w, child: _buildMinutesWheel()),
          ],
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
        controller: hoursController,
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
        controller: minutesController,
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
    hoursController.animateToItem(
      hours.indexOf(item),
      duration: CustomAnimationDurations.low,
      curve: Curves.linearToEaseOut,
    );
  }

  void _animateMinute(int item) {
    minutesController.animateToItem(
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
        style: h2.copyWith(
          color: context.textColor,
          letterSpacing: -1.0,
          fontFamily: AppConstants.style.textStyle.secondaryFontFamiliy,
        ),
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
        style: h2.copyWith(
          color: context.textColor,
          letterSpacing: -1.0,
          fontFamily: AppConstants.style.textStyle.secondaryFontFamiliy,
        ),
      ),
    );
  }
}
