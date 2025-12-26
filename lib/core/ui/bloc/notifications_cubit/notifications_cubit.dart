import 'dart:async';

import 'package:denwee/core/network/domain/failure/common_api_failure.dart';
import 'package:denwee/core/notifications/domain/entity/push_notification.dart';
import 'package:denwee/core/notifications/domain/repo/push_notifications_repo.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

part 'notifications_state.dart';
part 'notifications_cubit.freezed.dart';

@LazySingleton()
class NotificationsCubit extends Cubit<NotificationsState> {
  final AuthCubit _authCubit;
  final PushNotificationsRepo _pushNotificationsRepo;
  final FirebaseMessaging _messaging;

  StreamSubscription<RemoteMessage>? _foregroundNotificationsSub;
  StreamSubscription<RemoteMessage>? _backgroundNotificationsSub;

  static const getTokenRetryDuration = Duration(milliseconds: 3000);

  NotificationsCubit(
    this._authCubit,
    this._pushNotificationsRepo,
    this._messaging,
  )
    : super(NotificationsState.initial()) {
    setup();
    // getInitialMessage();
    // listenForegroundNotifications();
    // listenBackgroundNotifications();
  }

  Future<void> setup() async {
    // listen for token updates
    _messaging.onTokenRefresh.listen(_updateToken);

    // token failure or success var
    late Either<CommonApiFailure, String?> tokenFailureOrSuccess;
    
    // try get token
    tokenFailureOrSuccess = await _pushNotificationsRepo.retrieveToken();

    // if failed, retry after some delay
    if (tokenFailureOrSuccess.isLeft()) {
      await Future<void>.delayed(getTokenRetryDuration);
      tokenFailureOrSuccess = await _pushNotificationsRepo.retrieveToken();
    }

    // subscribe with the token
    tokenFailureOrSuccess.fold((_) {}, _updateToken);
  }

  /*
  void getInitialMessage() {
    _messaging.getInitialMessage().then((remoteMessage) {
      if (remoteMessage != null) {
        final notification = PushNotification.fromRemoteMessage(remoteMessage);
        emit(state.copyWith(notification: Some(notification)));
      }
    });
  }

  void listenForegroundNotifications() {
    _foregroundNotificationsSub = FirebaseMessaging.onMessage.listen((
      remoteMessage,
    ) {
      final notification = PushNotification.fromRemoteMessage(remoteMessage);
      emit(state.copyWith(notification: Some(notification)));
    });
  }

  void listenBackgroundNotifications() {
    _backgroundNotificationsSub = FirebaseMessaging.onMessageOpenedApp.listen((
      remoteMessage,
    ) {
      final notification = PushNotification.fromRemoteMessage(remoteMessage);
      emit(state.copyWith(notification: Some(notification)));
    });
  }
  */

  Future<void> forceUpdateToken() async {
    final token = (await _pushNotificationsRepo.retrieveToken()).getEntries();
    if (token.$2 != null) {
      await _pushNotificationsRepo.subscribe(token.$2!);
    }
  }

  Future<void> _updateToken(String? token) async {
    if (token == null || _authCubit.state.isUnauthenticated) return;
    await _pushNotificationsRepo.subscribe(token);
  }

  @override
  Future<void> close() {
    _backgroundNotificationsSub?.cancel();
    _foregroundNotificationsSub?.cancel();
    return super.close();
  }
}
