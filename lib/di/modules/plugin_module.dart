import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class PluginModule {
  @preResolve
  Future<SharedPreferences> provideSharedPreferences() =>
      SharedPreferences.getInstance();

  @LazySingleton()
  FlutterSecureStorage provideSecureStorage() => FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  @LazySingleton()
  FirebaseMessaging provideFirebaseMessaging() => FirebaseMessaging.instance;

  @LazySingleton()
  FirebaseAnalytics provideFirebaseAnalytics() => FirebaseAnalytics.instance;

  @LazySingleton()
  Connectivity provideConnectivity() => Connectivity();

  @LazySingleton()
  DeviceInfoPlugin provideDeviceInfo() => DeviceInfoPlugin();

  // @LazySingleton()
  // InternetConnection provideInternetConnectionChecker() => InternetConnection();

  @preResolve
  Future<PackageInfo> packageInfo() => PackageInfo.fromPlatform();
}
