import 'dart:async';

import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:flutter/material.dart';

class CommonRawWheelListview<T> extends StatefulWidget {
  const CommonRawWheelListview({
    super.key,
    required this.items,
    required this.builder,
    required this.onChanged,
    required this.controller,
    required this.itemExtent,
  });

  final List<T> items;
  final Widget Function(BuildContext, T) builder;
  final void Function(T) onChanged;
  final FixedExtentScrollController controller;
  final double itemExtent;

  @override
  State<CommonRawWheelListview<T>> createState() => _CommonRawWheelListviewState<T>();
}

class _CommonRawWheelListviewState<T> extends State<CommonRawWheelListview<T>> {
  Timer? hapticThresholdTimer;

  @override
  void dispose() {
    hapticThresholdTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      controller: widget.controller,
      itemExtent: widget.itemExtent,
      perspective: 0.0001,
      diameterRatio: 1.25,
      squeeze: 1.15,
      overAndUnderCenterOpacity: 0.5,
      physics: const FixedExtentScrollPhysics(),
      childDelegate: ListWheelChildBuilderDelegate(
        childCount: widget.items.length,
        builder: (context, index) {
          final item = widget.items[index];
          return widget.builder(context, item);
        },
      ),
      onSelectedItemChanged: (i) {
        hapticThresholdTimer?.cancel();
        hapticThresholdTimer = Timer(
          const Duration(milliseconds: 65),
          HapticUtil.light,
        );
        widget.onChanged(widget.items[i]);
      },
    );
  }
}
