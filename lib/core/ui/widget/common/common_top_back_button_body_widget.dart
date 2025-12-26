import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_out_left.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/buttons/back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class CommonTopBackButtonBody extends StatelessWidget {
  const CommonTopBackButtonBody({
    super.key,
    this.onBack,
    this.iconColor,
    required this.body,
    this.hideBackButton = false,
  });

  final VoidCallback? onBack;
  final Color? iconColor;
  final Widget body;
  final bool hideBackButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(child: body),
        Positioned(
          left: 0.0,
          top: context.topPadding,
          child: AppBackButton(
            color: iconColor ?? context.iconColor,
            onTap: onBack,
          ).autoFadeOutLeft(
            slideTo: 100,
            animate: hideBackButton,
            reverseDuration: CustomAnimationDurations.low,
          ),
        ),
      ],
    );
  }
}
