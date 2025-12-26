import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectivityRepo {
  Stream<ConnectivityResult> connectivityState();
  Future<ConnectivityResult> checkConnectivityNow();
  // Future<bool> checkInternetAccess();
  // Stream<bool> internetAccessChanges();
}
