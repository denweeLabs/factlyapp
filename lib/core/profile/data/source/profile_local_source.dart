import 'dart:convert';

import 'package:denwee/core/profile/data/model/profile_dto.dart';
import 'package:denwee/core/misc/data/storage/local_storage.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileLocalSource {
  ///
  /// Get profile
  ProfileDto? get();

  ///
  /// Store profile
  Future<void> store(ProfileDto data);

  ///
  /// Delete profile
  Future<void> delete();
}

@LazySingleton(as: ProfileLocalSource)
class ProfileLocalSourceImpl implements ProfileLocalSource {
  final LocalStorage _localStorage;
  final String _envPrefix;

  const ProfileLocalSourceImpl(
    this._localStorage,
    @ENV_PREFIX this._envPrefix,
  );

  String get _key => '${_envPrefix}PROFILE';

  @override
  ProfileDto? get() {
    final jsonString = _localStorage.getString(key: _key);
    if (jsonString != null && jsonString.isNotEmpty) {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return ProfileDto.fromJson(json);
    }
    return null;
  }

  @override
  Future<void> store(ProfileDto data) async {
    final json = data.toJson();
    final value = jsonEncode(json);
    await _localStorage.putString(key: _key, value: value);
  }
  
  @override
  Future<void> delete() async {
    await _localStorage.remove(key: _key);
  }
}
