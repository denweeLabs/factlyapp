import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HsvColorPickerDialog extends StatelessWidget {
  const HsvColorPickerDialog({
    super.key,
    required this.selectedColor,
    required this.onChanged,
  });

  final Color selectedColor;
  final ValueChanged<Color> onChanged;

  static const routeName = 'HsvColorPickerDialog';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.6.sw,
      child: SingleChildScrollView(
        child: HueRingPicker(
          pickerColor: selectedColor,
          onColorChanged: onChanged,
          enableAlpha: false,
          displayThumbColor: true,
          colorPickerHeight: 200,
          hueRingStrokeWidth: 18,
        ),
      ),
    );
  }
}
