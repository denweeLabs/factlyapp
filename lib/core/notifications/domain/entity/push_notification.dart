import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_notification.freezed.dart';

@freezed
abstract class PushNotification with _$PushNotification {
  const factory PushNotification({
    required Option<String> title,
    required Option<String> body,
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
      sentAt: optionOf(message.sentTime),
    );
  }
}