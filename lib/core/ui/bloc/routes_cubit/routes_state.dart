part of 'routes_cubit.dart';

@freezed
abstract class RoutesState with _$RoutesState {
  const factory RoutesState({
    required String rootRoute,
  }) = _RoutesState;

  factory RoutesState.initial() => RoutesState(
        rootRoute: getIt<InitialRouteUseCase>().retrieve(),
      );
}
