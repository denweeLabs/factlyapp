part of 'connectivity_cubit.dart';

@freezed
abstract class ConnectivityState with _$ConnectivityState {
  const ConnectivityState._();
  const factory ConnectivityState({
    required ConnectivityResult connectivityState,
  }) = _ConnectivityState;

  factory ConnectivityState.initialState() => ConnectivityState(
    connectivityState: AppConstants.config.assumeDeviceHasNetworkOnStart
        ? ConnectivityResult.wifi
        : ConnectivityResult.none,
  );

  bool get isRadio {
    return connectivityState != ConnectivityResult.none;
  }

  bool get isNetworkAccess {
    return isRadio /*&& hasInternetAccess*/;
  }
}
