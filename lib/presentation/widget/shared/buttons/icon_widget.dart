import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
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
    this.ignoreIconColor = false,
  });

  final String path;
  final double size;
  final Color? color;
  final bool useTransition;
  final bool ignoreIconColor;

  @override
  _CommonIconState createState() => _CommonIconState();
}

class _CommonIconState extends AnimatedWidgetBaseState<CommonAppIcon> {
  ColorTween? _iconColor;

  late Widget _cachedSvg;

  @override
  void initState() {
    super.initState();
    _cacheSvg();
  }

  @override
  void didUpdateWidget(CommonAppIcon oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.path != widget.path ||
        oldWidget.size != widget.size) {
      _cacheSvg();
    }
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _iconColor = visitor(
      _iconColor,
      widget.color,
      (dynamic value) => ColorTween(begin: value as Color),
    ) as ColorTween?;
  }

  void _cacheSvg() {
    final wh = widget.size.w;

    _cachedSvg = SvgPicture.asset(
      widget.path,
      height: wh, 
      width: wh,
    );
  }

  @override
  Widget build(BuildContext context) {
    final icon = _buildAnimatedIcon(context);

    if (!widget.useTransition) return icon;

    return AnimatedSwitcherPlus.flipY(
      duration: CustomAnimationDurations.ultraLow,
      switchInCurve: Curves.easeInOutSine,
      switchOutCurve: Curves.easeInOutSine,
      child: KeyedSubtree(key: ValueKey(widget.path), child: icon),
    );
  }

  Widget _buildAnimatedIcon(BuildContext context) {
    if (widget.ignoreIconColor) {
      return _cachedSvg;
    }

    final animation = this.animation;

    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        final color = _iconColor?.evaluate(animation) ?? context.iconColor;

        return ColorFiltered(
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          child: _cachedSvg,
        );
      },
    );
  }
}
