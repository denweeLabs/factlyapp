import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

class DeeplinksListener extends StatefulWidget {
  const DeeplinksListener({
    super.key,
    required this.child,
    required this.onRedirect,
  });

  final Widget child;
  final void Function(Uri) onRedirect;

  @override
  State<DeeplinksListener> createState() => _DeeplinksListenerState();
}

class _DeeplinksListenerState extends State<DeeplinksListener>
    with AutomaticKeepAliveClientMixin<DeeplinksListener> {
  late final appLinks = AppLinks();

  StreamSubscription<Uri>? deeplinksSubscription;

  @override
  void initState() {
    super.initState();
    deeplinksSubscription ??= appLinks.uriLinkStream.listen(redirect);
  }

  void redirect(Uri? link) {
    if (!mounted || link == null) return;
    widget.onRedirect(link);
  }

  @override
  void dispose() {
    deeplinksSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
