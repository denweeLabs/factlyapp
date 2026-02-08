import 'package:denwee/core/user_preferences/data/model/user_preferences_dto.dart';

abstract class UserPreferencesRemoteSource {
  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<UserPreferencesDto> get();

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<void> store(UserPreferencesDto dto);
}