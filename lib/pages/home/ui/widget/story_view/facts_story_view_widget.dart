/// =====================================================
/// 📘 Story View
///
/// The code 99% took from "story_view" package
/// and slightly adjusted to personal needs
///
/// Check official library at [https://pub.dev/packages/story_view]
/// =====================================================
library;

import 'dart:async';

import 'package:denwee/pages/home/ui/widget/story_view/story_controller.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';

enum IndicatorHeight {
  small,
  medium,
  large,
}

enum LoadState {
  loading,
  success,
  failure,
}

enum Direction {
  up,
  down,
  left,
  right,
}

class VerticalDragInfo {
  bool cancel = false;
  Direction? direction;

  void update(double primaryDelta) {
    Direction tmpDirection;

    if (primaryDelta > 0) {
      tmpDirection = Direction.down;
    } else {
      tmpDirection = Direction.up;
    }

    if (direction != null && tmpDirection != direction) {
      cancel = true;
    }

    direction = tmpDirection;
  }
}

class StoryItem {
  final Duration duration;
  final Widget view;
  bool shown;

  StoryItem(
    this.view, {
    required this.duration,
    this.shown = false,
  });
}

class FactsStoryView extends StatefulWidget {
  final List<StoryItem?> storyItems;
  final VoidCallback? onComplete;
  final void Function(StoryItem storyItem, int index)? onStoryShow;
  final bool repeat;
  final StoryController controller;
  final Color? indicatorColor;
  final Color? indicatorForegroundColor;
  final IndicatorHeight indicatorHeight;
  final EdgeInsetsGeometry indicatorOuterPadding;

  const FactsStoryView({
    super.key,
    required this.storyItems,
    required this.controller,
    required this.indicatorOuterPadding,
    this.onComplete,
    this.onStoryShow,
    this.repeat = false,
    this.indicatorColor,
    this.indicatorForegroundColor,
    this.indicatorHeight = IndicatorHeight.large,
  });

  @override
  State<StatefulWidget> createState() => FactsStoryViewState();
}

class FactsStoryViewState extends State<FactsStoryView> with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _currentAnimation;
  StreamSubscription<PlaybackState>? _playbackSubscription;
  Timer? _nextDebouncer;

  StoryItem? get _currentStory {
    return widget.storyItems.firstWhereOrNull((it) => !it!.shown);
  }

  @override
  void initState() {
    super.initState();

    final firstPage = widget.storyItems.firstWhereOrNull((it) => !it!.shown);
    if (firstPage == null) {
      for (var it2 in widget.storyItems) {
        it2!.shown = false;
      }
    } else {
      final lastShownPos = widget.storyItems.indexOf(firstPage);
      widget.storyItems.sublist(lastShownPos).forEach((it) {
        it!.shown = false;
      });
    }

    this._playbackSubscription =
        widget.controller.playbackNotifier.listen((playbackStatus) {
      switch (playbackStatus) {
        case PlaybackState.play:
          _removeNextHold();
          this._animationController?.forward();
          break;

        case PlaybackState.pause:
          _holdNext();
          this._animationController?.stop(canceled: false);
          break;

        case PlaybackState.next:
          _removeNextHold();
          _goForward();
          break;

        case PlaybackState.jumpNext:
          _removeNextHold();
          _goForward(isJump: true);
          break;

        case PlaybackState.previous:
          _removeNextHold();
          _goBack();
          break;

        case PlaybackState.jumpPrevious:
          _removeNextHold();
          _goBack(isJump: true);
          break;
      }
    });

    _play();
  }

  @override
  void dispose() {
    _clearDebouncer();
    _animationController?.dispose();
    _playbackSubscription?.cancel();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void _play({bool isJump = false}) {
    _animationController?.dispose();

    final storyItem = widget.storyItems.firstWhere((it) {
      return !it!.shown;
    })!;

    final storyItemIndex = widget.storyItems.indexOf(storyItem);

    if (widget.onStoryShow != null && !isJump) {
      widget.onStoryShow!(storyItem, storyItemIndex);
    }

    _animationController =
        AnimationController(duration: storyItem.duration, vsync: this);

    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {

        storyItem.shown = true;

        if (widget.storyItems.last != storyItem) {
          _beginPlay();
        } else {
          _onComplete();
        }
      }
    });

    _currentAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_animationController!);

    widget.controller.play();
  }

  void _beginPlay({bool isJump = false}) {
    setState(() {});
    _play(isJump: isJump);
  }

  void _onComplete() {
    if (widget.onComplete != null) {
      widget.controller.pause();
      widget.onComplete!();
    }

    if (widget.repeat) {
      for (var it in widget.storyItems) {
        it!.shown = false;
      }

      _beginPlay();
    }
  }

  void _goBack({bool isJump = false}) {
    _animationController!.stop();

    if (this._currentStory == null) {
      widget.storyItems.last!.shown = false;
    }

    if (this._currentStory == widget.storyItems.first) {
      _beginPlay(isJump: isJump);
    } else {
      this._currentStory!.shown = false;
      int lastPos = widget.storyItems.indexOf(this._currentStory);
      final previous = widget.storyItems[lastPos - 1]!;

      previous.shown = false;

      _beginPlay(isJump: isJump);
    }
  }

  void _goForward({bool isJump = false}) {
    if (this._currentStory != widget.storyItems.last) {
      _animationController!.stop();

      final _last = this._currentStory;

      if (_last != null) {
        _last.shown = true;
        if (_last != widget.storyItems.last) {
          _beginPlay(isJump: isJump);
        }
      }
    } else {
      _animationController!
          .animateTo(1.0, duration: Duration(milliseconds: 10));
    }
  }

  void _clearDebouncer() {
    _nextDebouncer?.cancel();
    _nextDebouncer = null;
  }

  void _removeNextHold() {
    _nextDebouncer?.cancel();
    _nextDebouncer = null;
  }

  void _holdNext() {
    _nextDebouncer?.cancel();
    _nextDebouncer = Timer(Duration(milliseconds: 500), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: widget.indicatorOuterPadding,
        child: RepaintBoundary(
          child: PageBar(
            key: UniqueKey(),
            widget.storyItems
                .map((it) => PageData(it!.duration, it.shown))
                .toList(),
            this._currentAnimation,
            indicatorHeight: widget.indicatorHeight,
            indicatorColor: widget.indicatorColor,
            indicatorForegroundColor: widget.indicatorForegroundColor,
          ),
        ),
      ),
    );
  }
}

class PageData {
  Duration duration;
  bool shown;

  PageData(this.duration, this.shown);
}

class PageBar extends StatefulWidget {
  final List<PageData> pages;
  final Animation<double>? animation;
  final IndicatorHeight indicatorHeight;
  final Color? indicatorColor;
  final Color? indicatorForegroundColor;

  const PageBar(
    this.pages,
    this.animation, {
    this.indicatorHeight = IndicatorHeight.large,
    this.indicatorColor,
    this.indicatorForegroundColor,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return PageBarState();
  }
}

class PageBarState extends State<PageBar> {
  double spacing = 4;

  @override
  void initState() {
    super.initState();

    int count = widget.pages.length;
    spacing = (count > 15) ? 2 : ((count > 10) ? 3 : 4);

    widget.animation!.addListener(() {
      setState(() {});
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  bool isPlaying(PageData page) {
    return widget.pages.firstWhereOrNull((it) => !it.shown) == page;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.pages.map((it) {
        return Expanded(
          child: Container(
            padding: EdgeInsets.only(
                right: widget.pages.last == it ? 0 : this.spacing),
            child: StoryProgressIndicator(
              isPlaying(it) ? widget.animation!.value : (it.shown ? 1 : 0),
              indicatorHeight: widget.indicatorHeight == IndicatorHeight.large
                  ? 5
                  : widget.indicatorHeight == IndicatorHeight.medium
                      ? 3
                      : 2,
              indicatorColor: widget.indicatorColor,
              indicatorForegroundColor: widget.indicatorForegroundColor,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class StoryProgressIndicator extends StatelessWidget {
  final double value;
  final double indicatorHeight;
  final Color? indicatorColor;
  final Color? indicatorForegroundColor;

  const StoryProgressIndicator(
    this.value, {
    super.key,
    this.indicatorHeight = 5,
    this.indicatorColor,
    this.indicatorForegroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromHeight(
        this.indicatorHeight,
      ),
      foregroundPainter: IndicatorOval(
        this.indicatorForegroundColor ?? Colors.white.withValues(alpha: 0.8),
        this.value,
      ),
      painter: IndicatorOval(
        this.indicatorColor ?? Colors.white.withValues(alpha: 0.4),
        1.0,
      ),
    );
  }
}

class IndicatorOval extends CustomPainter {
  final Color color;
  final double widthFactor;

  IndicatorOval(this.color, this.widthFactor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(0, 0, size.width * widthFactor, size.height),
            Radius.circular(3)),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}