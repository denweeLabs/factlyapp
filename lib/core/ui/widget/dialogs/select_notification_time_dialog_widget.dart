import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/buttons/app_solid_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/misc/wheel_time_selector_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectNotificationTimeDialog extends StatefulWidget {
  const SelectNotificationTimeDialog({super.key, this.initialTime});

  final DateTime? initialTime;

  static const routeName = 'SelectNotificationTimeDialog';

  @override
  State<SelectNotificationTimeDialog> createState() =>
      _SelectNotificationTimeDialogState();
}

class _SelectNotificationTimeDialogState
    extends State<SelectNotificationTimeDialog> {
  late final FixedExtentScrollController hoursController;
  late final FixedExtentScrollController minutesController;

  late final List<int> hours;
  late final List<int> minutes;

  late DateTime selectedTime = widget.initialTime ?? DateTime(0);

  @override
  void initState() {
    hours = _generateHours();
    minutes = _generateMinutes();

    final initHour = widget.initialTime != null
        ? hours.indexOf(widget.initialTime!.hour)
        : hours.indexOf(1);

    final initMinute = widget.initialTime != null
        ? minutes.indexOf(widget.initialTime!.minute)
        : 0;

    hoursController = FixedExtentScrollController(initialItem: initHour);
    minutesController = FixedExtentScrollController(initialItem: initMinute);

    super.initState();
  }

  @override
  void dispose() {
    hoursController.dispose();
    minutesController.dispose();
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
    return Padding(
      padding: EdgeInsets.only(top: AppSolidButton.defaultHeight / 2),
      child: FractionallySizedBox(
        widthFactor: 0.74,
        heightFactor: 0.46,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: AppSolidButton.defaultHeight / 2),
              decoration: ShapeDecoration(
                shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.all(
                    AppConstants.style.radius.dialog,
                  ),
                ),
                color: context.primaryContainer,
                shadows: [AppConstants.style.colors.dialogShadow],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -24.w,
                    bottom: -24.h,
                    child: CommonAppIcon(
                      path: AppConstants.assets.icons.clockLinear,
                      color: context.iconColor.withValues(alpha: 0.03),
                      size: 138,
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              top: 32.h,
              bottom: AppSolidButton.defaultHeight + 18.h,
              child: Column(
                children: [
                  Text(
                    context
                        .tr(LocaleKeys.dialog_select_notification_time_title)
                        .toUpperCase(),
                    style: textButton.copyWith(
                      color: context.textColor,
                      fontSize: 16.sp,
                    ),
                  ),
                  18.verticalSpace,
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: WheelTimeSelector(
                        hoursController: hoursController,
                        minutesController: minutesController,
                        onChanged: (time) => selectedTime = time,
                        hoursGenerator: () => hours,
                        minutesGenerator: () => minutes,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Center(
                child: LayoutBuilder(
                  builder: (context, constraints) => SizedBox(
                    width: constraints.maxWidth * 0.5,
                    child: AppSolidButton(
                      onTap: _submit,
                      text: context.tr(
                        LocaleKeys.dialog_select_notification_time_button,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    Navigator.of(context).pop(selectedTime);
  }
}
