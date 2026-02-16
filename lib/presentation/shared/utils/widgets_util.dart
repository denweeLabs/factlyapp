import 'package:flutter/material.dart';

/// Util mostly focused on GPU raster optimizations by removing extra repaint layers
class WidgetsUtil {
  
  /// Cross fade with static size and repaint boundary. For dynamic size use AnimatedSwitcher
  static Widget staticRepaintAnimatedCrossFade({
    required CrossFadeState state,
    required Widget firstChild,
    required Widget secondChild,
    Duration duration = const Duration(milliseconds: 250),
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedOpacity(
          opacity: state == CrossFadeState.showFirst ? 1.0 : 0.0,
          duration: duration,
          child: firstChild,
        ),
        AnimatedOpacity(
          opacity: state == CrossFadeState.showSecond ? 1.0 : 0.0,
          duration: duration,
          child: secondChild,
        ),
      ],
    );
  }
}
