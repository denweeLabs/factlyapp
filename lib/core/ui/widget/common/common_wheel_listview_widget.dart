import 'dart:async';

import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/widget/misc/fading_edge_widget.dart';
import 'package:flutter/material.dart';

class CommonWheelListView<T> extends StatefulWidget {
  const CommonWheelListView({
    super.key,
    required this.items,
    required this.builder,
    required this.onChanged,
    required this.controller,
    required this.itemExtent,
    this.isLooping = false,
  });

  final List<T> items;
  final Widget Function(BuildContext, T) builder;
  final void Function(T) onChanged;
  final FixedExtentScrollController controller;
  final bool isLooping;
  final double itemExtent;

  @override
  State<CommonWheelListView<T>> createState() => _CommonWheelListViewState<T>();
}

class _CommonWheelListViewState<T> extends State<CommonWheelListView<T>> {
  static const hapticsThreshold = Duration(milliseconds: 35);

  Timer? hapticThresholdTimer;

  @override
  void dispose() {
    hapticThresholdTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadingEdge(
      axis: Axis.vertical,
      stops: const [0.0, 0.4, 0.75, 1.0],
      child: ListWheelScrollView.useDelegate(
        controller: widget.controller,
        itemExtent: widget.itemExtent,
        perspective: 0.0001,
        diameterRatio: 1.2,
        squeeze: 1.2,
        overAndUnderCenterOpacity: 0.3,
        physics: const FixedExtentScrollPhysics(),
        childDelegate: widget.isLooping
            ? ListWheelChildLoopingListDelegate(
                children: widget.items
                    .map((item) => widget.builder(context, item))
                    .toList(),
              )
            : ListWheelChildBuilderDelegate(
                childCount: widget.items.length,
                builder: (context, index) {
                  final item = widget.items[index];
                  return widget.builder(context, item);
                },
              ),
        onSelectedItemChanged: (item) {
          hapticThresholdTimer?.cancel();
          hapticThresholdTimer = Timer(hapticsThreshold, HapticUtil.light);
          widget.onChanged(widget.items[item]);
        },
      ),
    );
  }
}
