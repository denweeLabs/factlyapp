import 'dart:io';

import 'package:appinio_social_share/appinio_social_share.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';

@LazySingleton()
class ShareService {
  final AppinioSocialShare _socialShare;
  final SharePlus _sharePlus;

  const ShareService(this._socialShare, this._sharePlus);

  Future<void> shareToWhatsapp(String filePath) async {
    if (Platform.isAndroid) {
      await _socialShare.android.shareFilesToWhatsapp([filePath]);
    } else if (Platform.isIOS) {
      await systemShare(filePath);
    }
  }

  Future<void> shareToTelegram(String filePath) async {
    if (Platform.isAndroid) {
      await _socialShare.android.shareFilesToTelegram([filePath]);
    } else if (Platform.isIOS) {
      await systemShare(filePath);
    }
  }

  Future<void> shareToInstagram(String filePath) async {
    if (Platform.isAndroid) {
      await _socialShare.android.shareFilesToInstagramFeed([filePath]);
    } else if (Platform.isIOS) {
      await _socialShare.iOS.shareToInstagramFeed(filePath);
    }
  }

  Future<void> systemShare(String filePath) async {
    final file = XFile(filePath);
    final params = ShareParams(files: [file]);
    await _sharePlus.share(params);
  }

  Future<bool> saveToGallery(String filePath) async {
    final result = await ImageGallerySaverPlus.saveFile(filePath);
    return result['isSuccess'] == true;
  }
}
