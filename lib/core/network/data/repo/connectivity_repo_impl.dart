import 'package:denwee/core/network/domain/repo/connectivity_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';

@LazySingleton(as: ConnectivityRepo)
class ConnectivityRepoImpl implements ConnectivityRepo {
  final Connectivity _connectivity;

  ConnectivityRepoImpl(this._connectivity);

  @override
  Stream<ConnectivityResult> connectivityState() {
    return _connectivity.onConnectivityChanged.map(_processConnectivityResult);
  }

  @override
  Future<ConnectivityResult> checkConnectivityNow() async {
    final resultNow = await _connectivity.checkConnectivity().then(_processConnectivityResult);
    return resultNow;
  }

  ConnectivityResult _processConnectivityResult(
    List<ConnectivityResult> event,
  ) {
    return (event.firstWhereOrNull((e) => e != ConnectivityResult.none)) ??
        ConnectivityResult.none;
  }

  // @override
  // Future<bool> checkInternetAccess() async {
  //   final isConnected = await _connectionChecker.hasInternetAccess;
  //   return isConnected;
  // }

  // @override
  // Stream<bool> internetAccessChanges() {
  //   return _connectionChecker.onStatusChange.map(
  //     (state) => state == InternetStatus.connected,
  //   );
  // }
}
