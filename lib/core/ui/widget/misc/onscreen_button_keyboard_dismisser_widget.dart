import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/buttons/action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnscreenButtonKeyboardDismisser extends StatelessWidget {
  const OnscreenButtonKeyboardDismisser({
    super.key,
    required this.builder,
    this.color,
    this.hoverColor,
    this.customDismissAction,
  });

  final Widget Function(BuildContext, bool, double) builder;
  final VoidCallback? customDismissAction;
  final Color? color;
  final Color? hoverColor;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        final bottomInset = MediaQuery.of(context).viewInsets.bottom;

        return Stack(
          fit: StackFit.expand,
          children: [
            builder(
              context,
              isKeyboardVisible,
              bottomInset,
            ),
            AnimatedPositioned(
              right: 24.w,
              bottom: bottomInset + 24.h,
              curve: Curves.easeOutQuint,
              duration: CustomAnimationDurations.low,
              child: AnimatedOpacity(
                opacity: isKeyboardVisible ? 1.0 : 0.0,
                duration: CustomAnimationDurations.ultraLow,
                curve: Curves.fastEaseInToSlowEaseOut,
                child: AppActionButton(
                  color: color,
                  hoverColor: hoverColor,
                  onTap: customDismissAction ?? FocusScope.of(context).unfocus,
                  iconPath: AppConstants.assets.icons.checkmarkLinear,
                  size: 54,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
