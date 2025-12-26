import 'dart:convert';

import 'package:denwee/core/misc/data/storage/local_storage.dart';
import 'package:denwee/core/user_preferences/data/model/user_preferences_dto.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

abstract class UserPreferencesLocalSource {
  ///
  /// Get user preferences
  UserPreferencesDto? get();

  ///
  /// Store user preferences
  Future<void> store(UserPreferencesDto dto);
  
  ///
  /// Delete user preferences
  Future<void> delete();
}

@LazySingleton(as: UserPreferencesLocalSource)
class UserPreferencesLocalSourceImpl implements UserPreferencesLocalSource {
  final LocalStorage _localStorage;
  final String _envPrefix;

  const UserPreferencesLocalSourceImpl(
    this._localStorage,
    @ENV_PREFIX this._envPrefix,
  );

  String get _key => '${_envPrefix}PREFERENCES';

  @override
  UserPreferencesDto? get() {
    final jsonString = _localStorage.getString(key: _key);
    if (jsonString != null && jsonString.isNotEmpty) {
      final data = jsonDecode(jsonString) as Map<String, dynamic>?;
      if (data != null) return UserPreferencesDto.fromJson(data);
    }
    return null;
  }

  @override
  Future<void> store(UserPreferencesDto dto) async {
    final jsonString = jsonEncode(dto.toJson());
    await _localStorage.putString(key: _key, value: jsonString);
  }

  @override
  Future<void> delete() async {
    await _localStorage.remove(key: _key);
  }
}
