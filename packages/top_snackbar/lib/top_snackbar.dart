// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'src/snackbar_widget.dart';

OverlayEntry? _previousEntry;

void showTopSnackBar(
  OverlayState overlayState,
  Widget child, {
  Duration animationDuration = const Duration(milliseconds: 1200),
  Duration reverseAnimationDuration = const Duration(milliseconds: 550),
  Duration displayDuration = const Duration(milliseconds: 3000),
  EdgeInsets padding = const EdgeInsets.all(16),
  Curve curve = Curves.elasticOut,
  Curve reverseCurve = Curves.linearToEaseOut,
  VoidCallback? onDismissed,
  VoidCallback? onTap,
}) {
  late OverlayEntry _overlayEntry;

  _overlayEntry = OverlayEntry(
    builder: (_) {
      return TopSnackBar(
        onDismissed: () {
          if (overlayState.mounted) {
            _overlayEntry.remove();
          }
          _previousEntry = null;
          onDismissed?.call();
        },
        animationDuration: animationDuration,
        reverseAnimationDuration: reverseAnimationDuration,
        displayDuration: displayDuration,
        onTap: onTap,
        padding: padding,
        curve: curve,
        reverseCurve: reverseCurve,
        child: child,
      );
    },
  );

  if (_previousEntry != null && _previousEntry!.mounted) {
    _previousEntry?.remove();
  }

  overlayState.insert(_overlayEntry);

  _previousEntry = _overlayEntry;
}
