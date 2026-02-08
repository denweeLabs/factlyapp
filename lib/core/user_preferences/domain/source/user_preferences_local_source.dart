import 'package:denwee/core/user_preferences/data/model/user_preferences_dto.dart';

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