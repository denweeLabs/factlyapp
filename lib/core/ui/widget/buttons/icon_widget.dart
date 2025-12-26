import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CommonAppIcon extends ImplicitlyAnimatedWidget {
  const CommonAppIcon({
    super.key,
    required this.path,
    required this.size,
    this.color,
    super.duration = CustomAnimationDurations.ultraLow,
    this.useTransition = true,
  });

  final String path;
  final double size;
  final Color? color;
  final bool useTransition;

  @override
  _CommonIconState createState() => _CommonIconState();
}

class _CommonIconState extends AnimatedWidgetBaseState<CommonAppIcon> {
  ColorTween? _iconColor;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _iconColor = visitor(
      _iconColor,
      widget.color,
      (dynamic value) => ColorTween(begin: value as Color),
    ) as ColorTween?;
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.useTransition) {
      return _buildIcon(context);
    }

    return AnimatedSwitcherPlus.flipY(
      duration: CustomAnimationDurations.ultraLow,
      switchInCurve: Curves.easeInOutSine,
      switchOutCurve: Curves.easeInOutSine,
      child: _buildIcon(context),
    );
  }

  Widget _buildIcon(BuildContext context) {
    final wh = widget.size.w;

    final Animation<double> animation = this.animation;

    return AnimatedBuilder(
      animation: animation,
      key: ValueKey(widget.path),
      builder: (_, _) => SvgPicture.asset(
        widget.path,
        height: wh,
        width: wh,
        colorFilter: ColorFilter.mode(
          _iconColor?.evaluate(animation) ?? context.iconColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
