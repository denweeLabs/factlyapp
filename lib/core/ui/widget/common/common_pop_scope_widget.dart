import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class CommonPopScope extends StatefulWidget {
  const CommonPopScope({
    super.key,
    required this.child,
    required this.onWillPop,
    this.isAbleToPop = true,
  });

  final Widget child;
  final VoidCallback onWillPop;
  final bool isAbleToPop;

  static const popOnHeightPercent = 0.55;
  static const popOnWidthPercent = 0.21;

  @override
  State<CommonPopScope> createState() => _CommonPopScopeState();
}

class _CommonPopScopeState extends State<CommonPopScope> {
  var _isPop = false;
  var _isAbleToPop = false;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return _buildCupertinoPopScope(context);
    }

    if (Platform.isAndroid) {
      return _buildAndroidPopScope();
    }

    return _buildAndroidPopScope();
  }

  Widget _buildAndroidPopScope() {
    return WillPopScope(
      onWillPop: () {
        if (widget.isAbleToPop) {
          widget.onWillPop();
        }
        return Future.value(false);
      },
      child: widget.child,
    );
  }

  Widget _buildCupertinoPopScope(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (!widget.isAbleToPop) return;

        if (details.localPosition.dy > height * CommonPopScope.popOnHeightPercent &&
            details.localPosition.dx < width * CommonPopScope.popOnWidthPercent) {
          if (!_isAbleToPop) _isAbleToPop = true;
        }

        if (_isAbleToPop) {
          final maxWidth = width * 0.7;
          final fraction = details.localPosition.dx / maxWidth;
          final constrainedFraction = min(1.0, fraction);

          if ((constrainedFraction * 10).floor() >= 2 && !_isPop) {
            _isPop = true;
            if (mounted) widget.onWillPop();
          }
        }
      },
      onPanEnd: (_) => _resetPop(),
      onPanCancel: () => _resetPop(),
      onTapUp: (_) => _resetPop(),
      onTapCancel: () => _resetPop(),
      behavior: HitTestBehavior.translucent,
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: widget.child,
      ),
    );
  }

  void _resetPop() {
    _isAbleToPop = false;
    _isPop = false;
  }
}
