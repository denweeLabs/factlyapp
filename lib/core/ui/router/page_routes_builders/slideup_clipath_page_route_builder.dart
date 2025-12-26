import 'package:denwee/core/ui/widget/animations/clippers/top_rounded_clipper.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/transitions/value_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlideupClipPathPageRouteBuilder<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  SlideupClipPathPageRouteBuilder({
    super.settings,
    super.barrierDismissible,
    required this.builder,
    Duration duration = CustomAnimationDurations.lowMedium,
    Duration reverseDuration = CustomAnimationDurations.low,
    Color brarrierColor = Colors.black26,
  }) : super(
         opaque: false,
         barrierColor: brarrierColor,
         transitionDuration: duration,
         reverseTransitionDuration: reverseDuration,
         pageBuilder: (context, _, _) => builder(context),
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           final slide = Tween<Offset>(
             begin: const Offset(0.0, 1.0),
             end: Offset.zero,
           ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.fastEaseInToSlowEaseOut,
            ));

           final clip = Tween<double>(begin: 26.h, end: 0.0).animate(
             CurvedAnimation(parent: animation, curve: Curves.easeInOut),
           );

           return SlideTransition(
             position: slide,
             child: ValueTransition(
               value: clip,
               builder: (value) => ClipPath(
                 clipper: TopRoundedClipper(heightFactor: value),
                 child: child,
               ),
             ),
           );
         },
       );
}
