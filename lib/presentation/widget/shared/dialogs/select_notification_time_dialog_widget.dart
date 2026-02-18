import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_colors.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/buttons/app_solid_button_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/solid_fading_edge_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/wheel_time_selector_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectNotificationTimeDialog extends StatefulWidget {
  const SelectNotificationTimeDialog({super.key, this.initialTime});

  final DateTime? initialTime;

  static const routeName = 'SelectNotificationTimeDialog';

  static final shape = RoundedSuperellipseBorder(
    borderRadius: BorderRadius.all(AppConstants.style.radius.dialog),
  );

  @override
  State<SelectNotificationTimeDialog> createState() =>
      _SelectNotificationTimeDialogState();
}

class _SelectNotificationTimeDialogState
    extends State<SelectNotificationTimeDialog> {
  late final FixedExtentScrollController _hoursController;
  late final FixedExtentScrollController _minutesController;

  late final List<int> _hours;
  late final List<int> _minutes;

  late DateTime _selectedTime = widget.initialTime ?? DateTime(0);

  @override
  void initState() {
    super.initState();

    _hours = List<int>.generate(24, (i) => i);
    _minutes = [0, AppConstants.config.notificationTimeSelectionStepMin];

    final initHour = widget.initialTime != null
        ? _hours.indexOf(widget.initialTime!.hour)
        : _hours.indexOf(1);

    final initMinute = widget.initialTime != null
        ? _minutes.indexOf(widget.initialTime!.minute)
        : 0;

    _hoursController = FixedExtentScrollController(initialItem: initHour);
    _minutesController = FixedExtentScrollController(initialItem: initMinute);
  }

  @override
  void dispose() {
    _hoursController.dispose();
    _minutesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryContainer = context.primaryContainer;

    return Padding(
      padding: EdgeInsets.only(top: AppSolidButton.defaultHeight / 2),
      child: FractionallySizedBox(
        widthFactor: 0.74,
        heightFactor: 0.38,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(child: _Background(primaryContainer: primaryContainer)),
        
            _Content(
              primaryContainer: primaryContainer,
              hoursController: _hoursController,
              minutesController: _minutesController,
              hours: _hours,
              minutes: _minutes,
              onChanged: (time) => _selectedTime = time,
            ),
        
            _SubmitButton(onSubmit: _submit),
          ],
        ),
      ),
    );
  }

  void _submit() {
    Navigator.of(context).pop(_selectedTime);
  }
}

class _Background extends StatelessWidget {
  const _Background({
    required this.primaryContainer,
  });

  final Color primaryContainer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSolidButton.defaultHeight / 2),
      child: PhysicalShape(
        elevation: 10.0,
        clipper: ShapeBorderClipper(shape: SelectNotificationTimeDialog.shape),
        color: context.primaryContainer,
        shadowColor: AppColors.dialogShadow,
        child: const SizedBox.shrink(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.primaryContainer,
    required this.hoursController,
    required this.minutesController,
    required this.hours,
    required this.minutes,
    required this.onChanged,
  });

  final Color primaryContainer;

  final FixedExtentScrollController hoursController;
  final FixedExtentScrollController minutesController;

  final List<int> hours;
  final List<int> minutes;

  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
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
              child: RepaintBoundary(
                child: SolidVerticalFadingEdge(
                  size: const FadingEdges.symmetric(40),
                  backgroundColor: primaryContainer,
                  child: WheelTimeSelector(
                    hoursController: hoursController,
                    minutesController: minutesController,
                    onChanged: onChanged,
                    hoursGenerator: () => hours,
                    minutesGenerator: () => minutes,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    required this.onSubmit,
  });

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: RepaintBoundary(
            child: AppSolidButton(
              onTap: onSubmit,
              text: context.tr(
                LocaleKeys.dialog_select_notification_time_button,
              ),
            ),
          ),
        ),
      ),
    );
  }
}