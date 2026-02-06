import 'package:flutter/cupertino.dart';
import 'package:in_app_review/in_app_review.dart';

class AppReviewService {
  static final _instance = InAppReview.instance;
  static const _appStoreId = '6756196669';

  static Future<void> requestReview() async {
    try {
      final canReview = await _instance.isAvailable();

      if (canReview) {
        return _instance.requestReview();
      } else {
        return _instance.openStoreListing(appStoreId: _appStoreId);
      }
    } catch (error) {
      debugPrint('AppReviewService requestReview error: $error');
    }
  }
}
