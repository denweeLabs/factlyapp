import 'dart:async';

import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markdown_widget/markdown_widget.dart';

class StreamedMarkdownText extends StatefulWidget {
  const StreamedMarkdownText({
    super.key,
    required this.stream,
    required this.pTextStyle,
    required this.hTextStyle,
    required this.bqTextStyle,
  });

  final Stream<String>? stream;
  final TextStyle pTextStyle;
  final TextStyle hTextStyle;
  final TextStyle bqTextStyle;

  @override
  State<StreamedMarkdownText> createState() => _StreamedMarkdownTextState();
}

class _StreamedMarkdownTextState extends State<StreamedMarkdownText> {
  static const _wordsPerUpdate = 4;
  static final _wordRegex = RegExp(r'\S+');
  static const _fadeInDuration = Duration(milliseconds: 650);

  final _current = StringBuffer();
  final _previous = StringBuffer();
  final _pending = StringBuffer();

  StreamSubscription<String>? _subscription;

  var key = ValueKey<int>(0);

  @override
  void initState() {
    super.initState();
    if (widget.stream != null) {
      _listenForChunks();
    }
  }

  @override
  void didUpdateWidget(covariant StreamedMarkdownText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.stream == null && widget.stream != null) {
      _listenForChunks();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  void _listenForChunks() {
    assert(widget.stream != null);
    _subscription ??= widget.stream!.listen(
      _onChunkReceived,
      onDone: () => _flushIfReady(force: true),
    );
  }

  void _onChunkReceived(String chunk) {
    _pending.write(chunk);
    _flushIfReady();
  }

  void _flushIfReady({bool force = false}) {
    final pendingStr = _pending.toString();

    if (pendingStr.isEmpty) return;

    int cutIndex = 0;

    if (force) {
      cutIndex = pendingStr.length;
    } else {
      final matches = _wordRegex.allMatches(pendingStr).toList();
      final groupsOfN = matches.length ~/ _wordsPerUpdate;

      if (groupsOfN == 0) return;
      cutIndex = matches[groupsOfN * _wordsPerUpdate - 1].end;
    }

    if (cutIndex > 0) {
      final toAppend = pendingStr.substring(0, cutIndex);
      final remainder = pendingStr.substring(cutIndex);

      _previous
        ..clear()
        ..write(_current);

      _current.write(toAppend);

      _pending
        ..clear()
        ..write(remainder);

      key = ValueKey(_current.length);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadingMarkdownBody(
      key: key,
      duration: _fadeInDuration,
      previousText: _previous.toString(),
      currentText: _current.toString(),
      pTextStyle: widget.pTextStyle,
      hTextStyle: widget.hTextStyle,
      bqTextStyle: widget.bqTextStyle,
    );
  }
}

class FadingMarkdownBody extends StatelessWidget {
  final String previousText;
  final String currentText;
  final Duration duration;
  final TextStyle pTextStyle;
  final TextStyle hTextStyle;
  final TextStyle bqTextStyle;

  const FadingMarkdownBody({
    super.key,
    required this.previousText,
    required this.currentText,
    required this.duration,
    required this.pTextStyle,
    required this.hTextStyle,
    required this.bqTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      key: key,
      duration: duration,
      tween: Tween<double>(begin: 0.0, end: 1.0),
      curve: Curves.easeOutSine,
      builder: (context, opacity, child) => Stack(
        children: [
          AnimatedOpacity(
            duration: duration,
            opacity: 1.0 - opacity,
            child: AppMarkdownText(
              data: previousText,
              pTextStyle: pTextStyle,
              hTextStyle: hTextStyle,
              bqTextStyle: bqTextStyle,
            ),
          ),
          AnimatedOpacity(
            duration: Duration.zero,
            opacity: opacity,
            child: AppMarkdownText(
              data: currentText,
              pTextStyle: pTextStyle,
              hTextStyle: hTextStyle,
              bqTextStyle: bqTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class AppMarkdownText extends StatelessWidget {
  const AppMarkdownText({
    super.key,
    required this.data,
    required this.pTextStyle,
    required this.hTextStyle,
    required this.bqTextStyle,
  });

  final String data;
  final TextStyle pTextStyle;
  final TextStyle hTextStyle;
  final TextStyle bqTextStyle;

  @override
  Widget build(BuildContext context) {
    return MarkdownWidget(
      data: data,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      config: MarkdownConfig(
        configs: [
          _H2(textStyle: hTextStyle),
          _H3(textStyle: hTextStyle),
          PConfig(textStyle: pTextStyle),
          BlockquoteConfig(
            sideWith: 5.0,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            sideColor: context.theme.colorScheme.primary,
            textColor: bqTextStyle.color ?? Colors.white,
          ),
        ],
      ),
    );
  }
}

final DummyDivider = HeadingDivider(
  color: Colors.transparent,
  height: 0.0,
  space: 0.0,
);

class _H2 implements HeadingConfig {
  final TextStyle textStyle;

  const _H2({required this.textStyle});
  
  @override
  TextStyle get style => textStyle;

  @override
  String get tag => MarkdownTag.h2.name;

  @override
  HeadingDivider? get divider => DummyDivider;

  @override
  EdgeInsets get padding => EdgeInsets.only(top: 32.h, bottom: 6.h);
}

class _H3 implements HeadingConfig {
  final TextStyle textStyle;

  const _H3({required this.textStyle});
  
  @override
  TextStyle get style => textStyle;

  @override
  String get tag => MarkdownTag.h3.name;

  @override
  HeadingDivider? get divider => DummyDivider;

  @override
  EdgeInsets get padding => EdgeInsets.only(top: 28.h);
}
