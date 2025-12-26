import 'dart:async';

import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:denwee/core/user_preferences/domain/failure/preferences_failure.dart';
import 'package:denwee/core/user_preferences/domain/repo/user_preferences_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

part 'user_preferences_state.dart';
part 'user_preferences_cubit.freezed.dart';

@LazySingleton()
class UserPreferencesCubit extends Cubit<UserPreferencesState> {
  final UserPreferencesRepo _preferencesRepo;
  final AuthCubit _authCubit;

  UserPreferencesCubit(this._preferencesRepo, this._authCubit)
      : super(_initialState(_preferencesRepo.getPrefrencesLocal()));

  static const uploadThresholdDuration = Duration(milliseconds: 1000);

  Timer? _uploadTimer;

  @override
  Future<void> close() async {
    _uploadTimer?.cancel();
    super.close();
  }

  static UserPreferencesState _initialState(Option<UserPreferences> localData) {
    return UserPreferencesState(
      preferences: localData.fold(UserPreferences.initial, (data) => data),
    );
  }

  Future<void> checkPreferences() async {
    final failureOrSuccess = await _preferencesRepo.getPreferencesRemote();
    failureOrSuccess.fold(
      (failure) => emit(state.copyWith(failure: Some(failure))),
      (preferences) => emitPreservePreferences(preferences, remotePreserve: false),
    );
  }

  void changeInterests(List<UserInterest> interests) {
    final orderedInterests = [...interests]..sort((a, b) => a.id.value.compareTo(b.id.value));
    final newPreferences = state.preferences.copyWith(interests: orderedInterests);
    emitPreservePreferences(newPreferences);
  }

  void toggleIsNotificationsEnabled() {
    final newValue = !state.preferences.notifications.isEnabled;
    final newPreferences = state.preferences.copyWith(
      notifications:
          state.preferences.notifications.copyWith(isEnabled: newValue),
    );
    emitPreservePreferences(newPreferences);
  }

  void changeNotificationTime(DateTime time) {
    final newPreferences = state.preferences.copyWith(
      notifications: state.preferences.notifications.copyWith(time: time),
    );
    emitPreservePreferences(newPreferences);
  }

  void toggleIsHapticsEnabled() {
    final isEnabled = state.preferences.misc.isHapticsEnabled;
    final newPreferences = state.preferences.copyWith(
      misc: state.preferences.misc.copyWith(isHapticsEnabled: !isEnabled),
    );
    emitPreservePreferences(newPreferences);
  }

  void changeThemeMode(ThemeMode mode) {
    final newPreferences = state.preferences.copyWith(
      theme: state.preferences.theme.copyWith(mode: mode),
    );
    emitPreservePreferences(newPreferences);
  }

  void changeThemeColoration(UniqueId id) {
    final newPreferences = state.preferences.copyWith(
      theme: state.preferences.theme.copyWith(colorationId: id),
    );
    emitPreservePreferences(newPreferences);
  }

  void changeLanguage(Locale locale) {
    final isChanged = locale.languageCode != state.preferences.language.languageCode;
    if (isChanged) {
      final newPreferences = state.preferences.copyWith(
        language: locale,
      );
      emitPreservePreferences(newPreferences);
    }
  }

  Future<void> clearState({
    bool preserveTheme = false,
    bool preserveLanguage = false,
  }) async {
    if (preserveTheme || preserveLanguage) {
      var outPreferences = UserPreferences.initial();
      if (preserveTheme) {
        outPreferences = outPreferences.copyWith(
          theme: state.preferences.theme,
        );
      }
      if (preserveLanguage) {
        outPreferences = outPreferences.copyWith(
          language: state.preferences.language,
        );
      }
      emitPreservePreferences(outPreferences, remotePreserve: false);
    } else {
      emit(UserPreferencesState.initial());
    }
  }

  Future<void> emitPreservePreferences(
    UserPreferences data, {
    bool localPreserve = true,
    bool remotePreserve = true,
  }) async {
    emit(state.copyWith(
      preferences: data,
      failure: const None(),
    ));

    if (localPreserve) {
      _preferencesRepo.storePrefrencesLocal(data);
    }

    if (remotePreserve) {
      if (_authCubit.state.isUnauthenticated) return;

      _uploadTimer?.cancel();
      _uploadTimer = Timer(uploadThresholdDuration, () {
        _preferencesRepo.storePreferencesRemote(data).then((failureOrSuccess) {
          final result = failureOrSuccess.getEntries();
          if (result.$1 != null) {
            emit(state.copyWith(failure: Some(result.$1!)));
          }
        });
      });
    }
  }
}
