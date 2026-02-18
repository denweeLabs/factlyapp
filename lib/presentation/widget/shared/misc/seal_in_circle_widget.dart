import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/animated_icons/seal_animated_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SealInCircle extends StatelessWidget {
  const SealInCircle({super.key});

  static const _clipper = ShapeBorderClipper(shape: OvalBorder());

  @override
  Widget build(BuildContext context) {
    return PhysicalShape(
      clipper: _clipper,
      color: context.primaryContainer,
      child: Padding(
        padding: EdgeInsets.fromLTRB(18.w, 16.w, 16.w, 16.w),
        child: const SealAnimatedIcon(animate: true, isLoop: true, size: 30),
      ),
    );
  }
}
