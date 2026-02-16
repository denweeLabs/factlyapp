import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/animated_icons/seal_animated_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SealInSquare extends StatelessWidget {
  const SealInSquare({super.key});

  static const _clipper = ShapeBorderClipper(
    shape: RoundedSuperellipseBorder(
      borderRadius: BorderRadius.all(Radius.circular(44.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return PhysicalShape(
      elevation: 8,
      color: context.primaryContainer,
      shadowColor: Colors.black12,
      clipBehavior: Clip.hardEdge,
      clipper: _clipper,
      child: Stack(
        children: [
          Positioned(
            right: -50,
            bottom: -50,
            child: SizedBox(
              width: 90,
              height: 90,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(42.w, 34.w, 34.w, 34.w),
            child: const SealAnimatedIcon(
              animate: true,
              isLoop: true,
              size: 68,
            ),
          ),
        ],
      ),
    );
  }
}
