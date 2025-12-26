import 'package:flutter/widgets.dart';

class SubpagesNavigator extends StatelessWidget {
  const SubpagesNavigator({
    super.key,
    required this.routes,
    required this.initialRoute,
    required this.navigatorKey,
    this.restorationId,
    this.onGenerateInitialRoutes,
    this.observers = const <NavigatorObserver>[],
  });

  final Map<String, PageRoute Function(RouteSettings)> routes;
  final String initialRoute;
  final GlobalKey<NavigatorState>? navigatorKey;
  final List<NavigatorObserver> observers;
  final String? restorationId;
  final List<Route<dynamic>> Function(NavigatorState, String)?
      onGenerateInitialRoutes;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: initialRoute,
      onGenerateInitialRoutes:
          onGenerateInitialRoutes ?? Navigator.defaultGenerateInitialRoutes,
      observers: observers,
      onGenerateRoute: _routeGenerator,
      restorationScopeId: restorationId,
    );
  }

  Route _routeGenerator(RouteSettings settings) {
    final route = routes[settings.name];
    if (route != null) {
      return route(settings);
    }
    throw 'Subpages navigator unknow route';
  }
}
