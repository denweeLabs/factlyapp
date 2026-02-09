import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:denwee/core/user_preferences/data/model/user_preferences_dto.dart';
import 'package:denwee/core/user_preferences/data/source/remote/user_preferences_api.dart';
import 'package:denwee/core/user_preferences/domain/source/user_preferences_remote_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserPreferencesRemoteSource)
class UserPreferencesRemoteSourceImpl implements UserPreferencesRemoteSource {
  final UserPreferencesApi _api;

  const UserPreferencesRemoteSourceImpl(this._api);

  @override
  Future<UserPreferencesDto> get() async {
    final response = await _api.getPreferences();
    return response.parseOrThrow(UserPreferencesDto.fromJson);
  }

  @override
  Future<void> store(UserPreferencesDto dto) async {
    final response = await _api.storePreferences(dto.toJson());
    return response.successOrThrow();
  }
}
