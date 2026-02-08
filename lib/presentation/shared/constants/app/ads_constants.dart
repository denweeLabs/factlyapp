import 'dart:io';

import 'package:flutter/foundation.dart';

class AdsConstants {
  /// Note: 
  /// Test ads can not be verified with SSV
  /// SSV works only in release prod builds
  static const useTestIds = kDebugMode;
  
  static const _androidFactExplanationId = useTestIds
      ? 'ca-app-pub-3940256099942544/5224354917'
      : 'ca-app-pub-5902968046736585/5686082386';
  static const _iosFactExplanationId = useTestIds
      ? 'ca-app-pub-3940256099942544/1712485313'
      : 'ca-app-pub-5902968046736585/9416625597';

  static const _androidAddToArchiveId = useTestIds
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-5902968046736585/5508389926';
  static const _iosAddToArchiveId = useTestIds
      ? 'ca-app-pub-3940256099942544/4411468910'
      : 'ca-app-pub-5902968046736585/5947373626';

  /// Constants for ad error handling
  static const networkErrorCode = 2;
  static const noFillErrorCode = 3;
  static const timeoutErrorCode = 5;
  static const noAdErrorMessage1 = 'No ad to show';
  static const noAdErrorMessage2 = 'No fill';

  static String get factExplanationAdUnitId {
    if (Platform.isAndroid) return _androidFactExplanationId;
    if (Platform.isIOS) return _iosFactExplanationId;
    throw 'Platform is not supported for fact explanation ad';
  }

  static String get addToArchiveAdUnitId {
    if (Platform.isAndroid) return _androidAddToArchiveId;
    if (Platform.isIOS) return _iosAddToArchiveId;
    throw 'Platform is not supported for add to archive ad';
  }
}
