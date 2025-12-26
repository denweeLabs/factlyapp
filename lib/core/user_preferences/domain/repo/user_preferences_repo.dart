import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:denwee/core/user_preferences/domain/failure/preferences_failure.dart';
import 'package:dartz/dartz.dart';

abstract class UserPreferencesRepo {
  // Local
  Option<UserPreferences> getPrefrencesLocal();
  Future<Unit> storePrefrencesLocal(UserPreferences preferences);
  Future<Unit> deletePrefrencesLocal();
  

  // Remote
  Future<Either<PreferencesFailure, UserPreferences>> getPreferencesRemote();
  Future<Either<PreferencesFailure, Unit>> storePreferencesRemote(UserPreferences preferences);
}