import 'dart:async';
import 'dart:developer';
import 'package:denwee/core/subscriptions/domain/repo/subscriptions_repo.dart';
import 'package:denwee/core/user_preferences/domain/repo/user_preferences_repo.dart';
import 'package:denwee/localization/codegen_loader.g.dart';
import 'package:denwee/pages/app/app.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/core/misc/domain/service/debug_print_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gma_mediation_unity/gma_mediation_unity.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:timeago/timeago.dart' as timeago;

void run(String env) {
  runZonedGuarded(() async {
    // === Initialization =========================================================
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await configureDependencies(env);
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);


    // === Ads ====================================================================
    await GmaMediationUnity().setGDPRConsent(true);
    await GmaMediationUnity().setCCPAConsent(true);
    await MobileAds.instance.initialize().then((initializationStatus) {
      initializationStatus.adapterStatuses.forEach((key, value) {
        debugPrint('Ads: Adapter status for $key: ${value.description}');
      });
    });


    // === Subscriptions ==========================================================
    await getIt<SubscriptionsRepo>().init();


    // === Localization ===========================================================
    await EasyLocalization.ensureInitialized();
    final startLocale = getIt<UserPreferencesRepo>()
        .getPrefrencesLocal()
        .toNullable()
        ?.language;
    AppConstants.config.supportedLocalesLookupMessages.forEach((locale, msg) {
      timeago.setLocaleMessages(locale.languageCode, msg);
    });
    if (startLocale != null) {
      Intl.systemLocale = startLocale.languageCode;
      timeago.setDefaultLocale(startLocale.languageCode);
    }


    // === Errors =================================================================
    FlutterError.onError = _recordFlutterError;
    PlatformDispatcher.instance.onError = _recordZoneError;


    // === Utils =================================================================
    debugPrint = getIt<DebugPrintService>().debugPrint;


    // === App =================================================================
    runApp(
      RootRestorationScope(
        restorationId: 'root',
        child: EasyLocalization(
          useOnlyLangCode: true,
          saveLocale: false,
          startLocale: startLocale,
          supportedLocales: AppConstants.config.supportedLocales,
          fallbackLocale: AppConstants.config.fallbackLocale,
          path: AppConstants.config.localesPath,
          assetLoader: const CodegenLoader(),
          child: const DenweeApp(),
        ),
      ),
    );
  }, _recordZoneError);
}

void _recordFlutterError(FlutterErrorDetails details) {
  debugPrint('_recordFlutterError: ${details.toString()}');
  FirebaseCrashlytics.instance.recordFlutterError(details);
}

bool _recordZoneError(Object error, StackTrace? stack) {
  debugPrint('_recordZoneError: $error, $stack');
  log('Uncaught error', error: error, stackTrace: stack);
  FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  return true;
}
