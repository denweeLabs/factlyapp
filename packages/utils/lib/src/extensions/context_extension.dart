import 'package:flutter/material.dart';
import 'package:utils/src/json_converters/custom_serializer.dart';

extension BuildContextX on BuildContext {
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
  double get topPadding => MediaQuery.of(this).padding.top;

  Future<T?> pushNamedArgs<T>(
    String routeName, {
    Object? args,
    bool rootNavigator = false,
  }) {
    return Navigator.of(
      this,
      rootNavigator: rootNavigator,
    ).pushNamed<T>(routeName, arguments: args);
  }

  Future<void> pushReplacementNamed(
    String routeName, {
    Object? args,
    bool rootNavigator = false,
  }) {
    return Navigator.of(
      this,
      rootNavigator: rootNavigator,
    ).pushReplacementNamed(routeName, arguments: args);
  }

  String restorablePushNamedArgs(
    String routeName, {
    bool rootNavigator = false,
    Map<String, dynamic> Function()? argsToJson,
  }) {
    final serializedArgs =
        argsToJson == null ? null : CustomSerializer(argsToJson()).serialize;
    return Navigator.of(
      this,
      rootNavigator: rootNavigator,
    ).restorablePushNamed(routeName, arguments: serializedArgs);
  }

  String restorablePushReplacementNamedArgs(
    String routeName, {
    bool rootNavigator = false,
    Map<String, dynamic> Function()? argsToJson,
  }) {
    final serializedArgs =
        argsToJson == null ? null : CustomSerializer(argsToJson()).serialize;
    return Navigator.of(
      this,
      rootNavigator: rootNavigator,
    ).restorablePushReplacementNamed(routeName, arguments: serializedArgs);
  }
}

extension RestorableRouteX on RestorableRouteFuture {
  void push({Map<String, dynamic> Function()? argsToJson}) {
    final serializedArgs =
        argsToJson == null ? null : CustomSerializer(argsToJson()).serialize;
    present(serializedArgs);
  }
}
