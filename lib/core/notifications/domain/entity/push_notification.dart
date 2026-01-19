import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:denwee/core/ui/utils/launcher_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_notification.freezed.dart';

@freezed
abstract class PushNotification with _$PushNotification {
  const PushNotification._();
  const factory PushNotification({
    required Option<String> title,
    required Option<String> body,
    required Option<String> link,
    required Option<DateTime> sentAt,
  }) = _PushNotification;

  factory PushNotification.fromRemoteMessage(RemoteMessage message) {
    return PushNotification(
      title: Option.when(
        (message.notification?.title ?? '').isNotEmpty,
        message.notification?.title ?? '',
      ),
      body: Option.when(
        (message.notification?.body ?? '').isNotEmpty,
        message.notification?.body ?? '',
      ),
      link: _parseLink(message),
      sentAt: optionOf(message.sentTime),
    );
  }

  static Option<String> _parseLink(RemoteMessage message) {
    final deeplink = message.data['deeplink'] as String?;

    if (deeplink != null && deeplink.trim().isNotEmpty) {
      return Some(deeplink);
    }
    if (Platform.isAndroid) {
      return optionOf(message.notification?.android?.link);
    }
    return const None();
  }

  void tryLaunchLink() {
    return link.fold(() {}, LauncherUtil.processGenericLink);
  }
}
