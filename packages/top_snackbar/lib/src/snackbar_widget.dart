import 'dart:async';

import 'package:flutter/material.dart';

class TopSnackBar extends StatefulWidget {
  const TopSnackBar({
    super.key,
    required this.child,
    required this.onDismissed,
    required this.animationDuration,
    required this.reverseAnimationDuration,
    required this.displayDuration,
    required this.padding,
    required this.curve,
    required this.reverseCurve,
    this.onTap,
  });

  final Widget child;
  final VoidCallback onDismissed;
  final Duration animationDuration;
  final Duration reverseAnimationDuration;
  final Duration displayDuration;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final Curve curve;
  final Curve reverseCurve;

  @override
  _TopSnackBarState createState() => _TopSnackBarState();
}

class _TopSnackBarState extends State<TopSnackBar>
    with SingleTickerProviderStateMixin {
  late final Animation<Offset> _offsetAnimation;
  late final AnimationController _animationController;
  late final Tween<Offset> _offsetTween;

  Timer? _timer;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
      reverseDuration: widget.reverseAnimationDuration,
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _timer = Timer(widget.displayDuration, () {
          if (mounted) {
            _animationController.reverse();
          }
        });
      }
      if (status == AnimationStatus.dismissed) {
        _timer?.cancel();
        widget.onDismissed.call();
      }
    });

    _offsetTween = Tween<Offset>(
      begin: const Offset(0, -1.2),
      end: Offset.zero,
    );

    _offsetAnimation = _offsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: widget.curve,
        reverseCurve: widget.reverseCurve,
      ),
    );

    if (mounted) {
      _animationController.forward();
    }
    
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.padding.top,
      left: widget.padding.left,
      right: widget.padding.right,
      child: SlideTransition(
        position: _offsetAnimation,
        child: SafeArea(bottom: false, child: _buildDismissibleChild()),
      ),
    );
  }

  Widget _buildDismissibleChild() {
    return GestureDetector(
      onTap: _onTap,
      behavior: HitTestBehavior.translucent,
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.up,
        dismissThresholds: const {DismissDirection.up: 0.5},
        confirmDismiss: _confirmDismiss,
        child: widget.child,
      ),
    );
  }

  void _onTap() {
    widget.onTap?.call();
    if (mounted) {
      _animationController.reverse();
    }
  }

  Future<bool?> _confirmDismiss(DismissDirection direction) async {
    if (!mounted) return false;

    if (direction == DismissDirection.down) {
      await _animationController.reverse();
    } else {
      _animationController.reset();
    }

    return false;
  }
}
