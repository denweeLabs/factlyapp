import 'package:flutter/material.dart';

class RouteObserverScope extends StatelessWidget {
  final TrackingRouteObserver<ModalRoute<void>> observer;
  final Widget Function(BuildContext context, RouteObserver<ModalRoute<void>> observer) builder;

  const RouteObserverScope({
    super.key,
    required this.observer,
    required this.builder,
  });

  static TrackingRouteObserver<ModalRoute<void>> of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<_RouteObserverInherited>();
    assert(scope != null, 'No RouteObserverScope found in context');
    return scope!.observer;
  }

  @override
  Widget build(BuildContext context) {
    return _RouteObserverInherited(
      observer: observer,
      child: Builder(
        builder: (context) => builder(context, observer),
      ),
    );
  }
}

class _RouteObserverInherited extends InheritedWidget {
  final TrackingRouteObserver<ModalRoute<void>> observer;

  const _RouteObserverInherited({
    required this.observer,
    required super.child,
  });

  @override
  bool updateShouldNotify(_) => false;
}

/// The observer mostly used to debug RouteAware animations. You can safely use default RouteObserver
class TrackingRouteObserver<R extends Route<dynamic>> extends RouteObserver<R> {
  final List<RouteAware> _subscribers = [];

  @override
  void subscribe(RouteAware routeAware, R route) {
    super.subscribe(routeAware, route);
    _subscribers.add(routeAware);
    debugPrint('[RouteObserver] Subscribed: $routeAware for route: ${route.settings.name}');
  }

  @override
  void unsubscribe(RouteAware routeAware) {
    super.unsubscribe(routeAware);
    _subscribers.remove(routeAware);
    debugPrint('[RouteObserver] Unsubscribed: $routeAware');
  }

  void printSubscribers() {
    debugPrint('[RouteObserver] Currently subscribed:');
    for (final sub in _subscribers) {
      debugPrint('  → $sub');
    }
  }
}