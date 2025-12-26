import 'package:denwee/core/misc/domain/use_case/initial_route_use_case.dart';
import 'package:denwee/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'routes_state.dart';
part 'routes_cubit.freezed.dart';

@LazySingleton()
class RoutesCubit extends Cubit<RoutesState> {
  RoutesCubit() : super(RoutesState.initial());

  // final rootNavigatorKey = GlobalKey<NavigatorState>();
  // BuildContext get rootContext => rootNavigatorKey.currentState!.context;

  void setRootRoute(String route) {
    debugPrint('RootRoute: $route');
    emit(state.copyWith(rootRoute: route));
  }
}
