import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoreTapBounceAnimation extends StatefulWidget {
  const CoreTapBounceAnimation({
    super.key,
    this.onTap,
    this.onLongTap,
    this.ignoreScale = false,
    required this.builder,
    this.minScale = CoreTapBounceAnimation.defaultMinScale,
    this.isHaptics = true,
    this.alignment = Alignment.center,
  });

  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final bool ignoreScale;
  final Widget Function(BuildContext context, bool isHovered) builder;
  final double minScale;
  final bool isHaptics;
  final Alignment alignment;

  static const duration = Duration(milliseconds: 200);
  static const curve = Curves.easeOutSine;
  static const defaultMinScale = 0.94;

  @override
  State<CoreTapBounceAnimation> createState() => _CoreTapBounceAnimationState();
}

class _CoreTapBounceAnimationState extends State<CoreTapBounceAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  late final ValueNotifier _isHovered = ValueNotifier(false);

  bool get isTappable => widget.onTap != null;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: CoreTapBounceAnimation.duration,
    );
    _scale =
        Tween<double>(begin: 1.0, end: widget.minScale).animate(CurvedAnimation(
      parent: _controller,
      curve: CoreTapBounceAnimation.curve,
      reverseCurve: CoreTapBounceAnimation.curve,
    ));
  }

  @override
  void dispose() {
    _isHovered.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isTappable) return widget.builder(context, false);
    
    final thisScale = widget.ignoreScale ? const AlwaysStoppedAnimation(1.0) : _scale;

    return GestureDetector(
      onTap: _onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onLongPress: widget.onLongTap,
      behavior: HitTestBehavior.translucent,
      child: ScaleTransition(
        scale: thisScale,
        alignment: widget.alignment,
        child: ValueListenableBuilder(
          valueListenable: _isHovered,
          builder: (context, isHovered, _) => widget.builder(
            context,
            isHovered,
          ),
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    _isHovered.value = true;
    _controller.forward();
    if (widget.isHaptics) HapticUtil.click();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    _isHovered.value = false;
  }

  void _onTapCancel() {
    _controller.reverse();
    _isHovered.value = false;
  }

  void _onTap() {
    _isHovered.value = false;
    widget.onTap!();
    if (mounted) {
      _controller.animateTo(0.5).then((_) => _controller.animateBack(0.0));
    }
  }
}
