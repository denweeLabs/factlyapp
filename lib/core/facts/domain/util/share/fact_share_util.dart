import 'dart:io';

import 'package:denwee/core/misc/domain/service/share_service.dart';
import 'package:denwee/core/permissions/domain/repo/app_permission.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/shared/utils/dialogs_util.dart';
import 'package:denwee/presentation/widget/shared/sheets/fact_share/fact_share_bottom_sheet_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class FactShareUtil {
  final ShareService _shareService;

  const FactShareUtil(this._shareService);

  Future<void> share({
    required BuildContext context,
    required FactShareSupportedTarget target,
    required File file,
  }) async {
    switch (target) {
      case FactShareSupportedTarget.whatsapp:
        return _shareService.shareToWhatsapp(file.path);

      case FactShareSupportedTarget.facebook:
        return _shareService.systemShare(file.path);

      case FactShareSupportedTarget.viber:
        return _shareService.systemShare(file.path);

      case FactShareSupportedTarget.telegram:
        return _shareService.shareToTelegram(file.path);

      case FactShareSupportedTarget.instagramStories:
      case FactShareSupportedTarget.instagramDirect:
      case FactShareSupportedTarget.instagram:
        return _processInstagramShare(context, file);

      case FactShareSupportedTarget.more:
        return _shareService.systemShare(file.path);

      case FactShareSupportedTarget.download:
        return _processDownload(context, file);
    }
  }

  Future<void> _processInstagramShare(BuildContext context, File file) async {
    if (Platform.isIOS) {
      final permissionStatus = await AppDialogs.checkPermissionDialog(context, AppPermissionType.photosFull);
      if (permissionStatus.isAnyDenied) return;
    }
    
    return _shareService.shareToInstagram(file.path);
  }

  Future<void> _processDownload(BuildContext context, File file) async {
    final permissionStatus = await AppDialogs.checkPermissionDialog(context, AppPermissionType.photosAdd);
    if (permissionStatus.isAnyDenied) return;

    final isSuccess = await _shareService.saveToGallery(file.path);
    if (isSuccess) {
      AppDialogs.showToastMessage(
        context.tr(LocaleKeys.fact_share_download_saved),
      );
    }
  }
}
