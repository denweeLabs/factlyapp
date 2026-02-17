import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:denwee/core/auth/domain/providers/google/google_sign_in_constants.dart';
import 'package:denwee/core/misc/domain/entity/device_info.dart';
import 'package:denwee/core/misc/domain/repo/device_info_repo.dart';
import 'package:denwee/di/env.dart';
import 'package:denwee/di/server_module.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appinio_social_share/appinio_social_share.dart';

@module
abstract class PluginModule {
  @preResolve
  Future<SharedPreferences> provideSharedPreferences() =>
      SharedPreferences.getInstance();

  @preResolve
  Future<DeviceInfo> provideDeviceDetails(DeviceInfoRepo deviceRepo) {
    return deviceRepo.getDeviceInfo();
  }

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

  @LazySingleton()
  GoogleSignIn provideGoogleSignIn(@ENV String environment) {
    final isProd = environment == Env.prod;

    final (clientId, serverClientId) = isProd
        ? GoogleSignInProviderConstants.prodClientIds
        : GoogleSignInProviderConstants.devClientIds;

    return GoogleSignIn(clientId: clientId, serverClientId: serverClientId);
  }

  @LazySingleton()
  SharePlus provideSharePlus() => SharePlus.instance;

  @LazySingleton()
  AppinioSocialShare provideSocialShare() => AppinioSocialShare();

  @preResolve
  Future<PackageInfo> packageInfo() => PackageInfo.fromPlatform();
}
