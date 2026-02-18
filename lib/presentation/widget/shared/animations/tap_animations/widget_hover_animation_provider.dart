import 'package:denwee/presentation/shared/utils/haptic_util.dart';
import 'package:flutter/material.dart';

class WidgetHoverAnimationProvider extends StatefulWidget {
  const WidgetHoverAnimationProvider({
    super.key,
    this.onTap,
    this.onLongTap,
    required this.builder,
    this.enableHapticFeedback = true,
    this.enforceBounceOnQuickTap = true,
  });

  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final Widget Function(BuildContext, Animation<double>) builder;
  final bool enableHapticFeedback;
  final bool enforceBounceOnQuickTap;

  bool get isTappable => onTap != null;

  static const duration = Duration(milliseconds: 200);

  @override
  State<WidgetHoverAnimationProvider> createState() =>
      _WidgetHoverAnimationProviderState();
}

class _WidgetHoverAnimationProviderState
    extends State<WidgetHoverAnimationProvider>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    if (widget.isTappable) {
      initController();
    }
  }

  @override
  void didUpdateWidget(covariant WidgetHoverAnimationProvider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isTappable && widget.isTappable) {
      initController();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void initController() {
    controller = AnimationController(
      vsync: this,
      duration: WidgetHoverAnimationProvider.duration,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isTappable) {
      final animation = const AlwaysStoppedAnimation(0.0);
      return widget.builder(context, animation);
    }

    return GestureDetector(
      onTap: () {
        widget.onTap!();
        if (widget.enforceBounceOnQuickTap) {
          controller!.animateTo(0.5).then((_) => controller!.animateBack(0.0));
        }
      },
      onTapDown: (_) {
        controller!.forward();
        if (widget.enableHapticFeedback) HapticUtil.click();
      },
      onTapUp: (_) {
        controller!.reverse();
      },
      onTapCancel: () {
        controller!.reverse();
      },
      onLongPress: widget.onLongTap,
      behavior: HitTestBehavior.translucent,
      child: widget.builder(context, controller!),
    );
  }
}
