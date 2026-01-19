import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in_down.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in_up.dart';
import 'package:denwee/core/ui/widget/misc/bubbles_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ValuePrimerHeader extends StatelessWidget {
  const ValuePrimerHeader({super.key});

  static final height = 0.4.sh;
  static final mockupSize = Size(0.4.sw, height);

  @override
  Widget build(BuildContext context) {
    final mockupYOffset = mockupSize.height / 2.8;

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppConstants.style.colors.commonColoredGradient(context),
      ),
      child: ClipRRect(
        child: Stack(
          children: [
            const Positioned.fill(child: BubblesAnimation(bubblesCount: 30)),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.translate(
                    offset: Offset(0.0, -mockupYOffset),
                    child: _Mockup(
                      size: mockupSize,
                      isTopShadow: true,
                      path: AppConstants.assets.images.interestShortFact,
                    ).autoFadeInDown(sequencePos: 2),
                  ),
                  24.horizontalSpace,
                  Transform.translate(
                    offset: Offset(0.0, mockupYOffset),
                    child: _Mockup(
                      size: mockupSize,
                      isTopShadow: false,
                      path: AppConstants.assets.images.interestDetailedFact,
                    ).autoFadeInUp(sequencePos: 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Mockup extends StatelessWidget {
  const _Mockup({
    required this.size,
    required this.path,
    required this.isTopShadow,
  });

  final Size size;
  final String path;
  final bool isTopShadow;

  static const topShadow = BoxShadow(
    color: Colors.black54,
    offset: Offset(0.0, 8.0),
    spreadRadius: -10.0,
    blurRadius: 20,
  );
  static const bottomShadow = BoxShadow(
    color: Colors.black54,
    offset: Offset(0.0, -8.0),
    spreadRadius: -10.0,
    blurRadius: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.contain),
        boxShadow: [isTopShadow ? topShadow : bottomShadow],
      ),
    );
  }
}
