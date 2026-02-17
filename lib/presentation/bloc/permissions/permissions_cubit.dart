import 'dart:async';

import 'package:denwee/core/permissions/domain/repo/app_permission.dart';
import 'package:denwee/core/permissions/domain/entity/app_permission_status.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'permissions_state.dart';
part 'permissions_cubit.freezed.dart';

@LazySingleton()
class PermissionsCubit extends Cubit<PermissionsState> {
  PermissionsCubit() : super(PermissionsState.initial());

  // Notifications
  FutureOr<AppPermissionStatus> retrieveOrCheckNotifications() async =>
      state.notificationsPermission.toNullable() ??
      await forceCheckNotifications();

  Future<AppPermissionStatus> forceCheckNotifications({bool request = false}) async {
    emit(state.copyWith(checkingNotificationsPermission: true));
    final status = request
        ? await AppPermission.notifications.request()
        : await AppPermission.notifications.status();
    emit(state.copyWith(
      notificationsPermission: some(status),
      checkingNotificationsPermission: false,
    ));
    debugPrint('Permission: notifications $status');
    return status;
  }

  // Photos add
  FutureOr<AppPermissionStatus> retrieveOrCheckPhotosAdd() async =>
      state.photosAddPermission.toNullable() ??
      await forceCheckPhotosAdd();

  Future<AppPermissionStatus> forceCheckPhotosAdd({bool request = false}) async {
    emit(state.copyWith(checkingPhotosAddPermission: true));
    final status = request
        ? await AppPermission.photosAdd.request()
        : await AppPermission.photosAdd.status();
    emit(state.copyWith(
      photosAddPermission: some(status),
      checkingPhotosAddPermission: false,
    ));
    debugPrint('Permission: photos add $status');
    return status;
  }

  // Photos full
  FutureOr<AppPermissionStatus> retrieveOrCheckPhotosFull() async =>
      state.photosFullPermission.toNullable() ??
      await forceCheckPhotosFull();

  Future<AppPermissionStatus> forceCheckPhotosFull({bool request = false}) async {
    emit(state.copyWith(checkingPhotosFullPermission: true));
    final status = request
        ? await AppPermission.photosFull.request()
        : await AppPermission.photosFull.status();
    emit(state.copyWith(
      photosFullPermission: some(status),
      checkingPhotosFullPermission: false,
    ));
    debugPrint('Permission: photos full $status');
    return status;
  }
}
