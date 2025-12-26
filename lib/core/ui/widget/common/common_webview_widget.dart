import 'dart:collection';

import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/common/common_loading_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CommonWebview extends StatefulWidget {
  const CommonWebview({super.key, required this.url});

  final String url;

  @override
  State<CommonWebview> createState() => CommonWebviewState();
}

class CommonWebviewState extends State<CommonWebview> {
  InAppWebViewController? controller;
  PullToRefreshController? pullToRefreshController;

  var isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    pullToRefreshController = PullToRefreshController(
      settings: PullToRefreshSettings(color: context.iconColor),
      onRefresh: () async {
        if (defaultTargetPlatform == TargetPlatform.android) {
          controller?.reload();
        } else if (defaultTargetPlatform == TargetPlatform.iOS) {
          final currentUrl = await controller?.getUrl();
          if (currentUrl == null) return;
          controller?.loadUrl(urlRequest: URLRequest(url: currentUrl));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          curve: Curves.easeOutQuad,
          duration: CustomAnimationDurations.lowMedium,
          opacity: isLoading ? 0.0 : 1.0,
          child: InAppWebView(
            initialUserScripts: UnmodifiableListView<UserScript>([]),
            initialUrlRequest: URLRequest(url: WebUri(widget.url)),
            initialSettings: InAppWebViewSettings(
              isInspectable: false,
              mediaPlaybackRequiresUserGesture: false,
              allowsInlineMediaPlayback: true,
              javaScriptCanOpenWindowsAutomatically: true,
              javaScriptEnabled: true,
              transparentBackground: true,
              useHybridComposition: true,
              disableHorizontalScroll: false,
              disableVerticalScroll: false,
              supportZoom: true,
            ),
            pullToRefreshController: pullToRefreshController,
            gestureRecognizers: {
              Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer(),
              ),
            },
            onWebViewCreated: (controller) async {
              this.controller = controller;
            },
            onLoadStart: (_, _) {
              setState(() => isLoading = true);
            },
            onLoadStop: (_, _) {
              pullToRefreshController?.endRefreshing();
              setState(() => isLoading = false);
            },
            onReceivedError: (_, _, _) {
              pullToRefreshController?.endRefreshing();
              setState(() => isLoading = false);
            },
            onProgressChanged: (_, progress) {
              if (progress == 100) {
                pullToRefreshController?.endRefreshing();
              }
            },
          ),
        ),
        Visibility(
          visible: isLoading,
          child: const Center(child: CommonLoading()),
        ),
      ],
    );
  }
}
