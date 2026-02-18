import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class FactCaptureUtil {
  const FactCaptureUtil();

  Future<Uint8List> render({
    required GlobalKey key,
    required double pixelRatio,
  }) async {
    final data = await _capture(key, pixelRatio);
    if (data == null) {
      throw 'RepaintBoundary not ready';
    }
    return data;
  }

  Future<Uint8List?> _capture(
    GlobalKey key,
    double pixelRatio,
  ) async {
    final boundary = _getBoundary(key);
    if (boundary == null) {
      return null;
    }

    final image = await boundary.toImage(pixelRatio: pixelRatio);
    final data = await image.toByteData(format: ImageByteFormat.png);

    return data?.buffer.asUint8List();
  }

  RenderRepaintBoundary? _getBoundary(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) {
      return null;
    }

    final renderObject = context.findRenderObject();
    if (renderObject is! RenderRepaintBoundary) {
      return null;
    }

    return renderObject;
  }
}