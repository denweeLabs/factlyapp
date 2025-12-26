import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:denwee/core/user_preferences/data/model/user_preferences_dto.dart';
import 'package:denwee/core/user_preferences/data/source/user_preferences_local_source.dart';
import 'package:denwee/core/user_preferences/data/source/user_preferences_remote_source.dart';
import 'package:denwee/core/user_preferences/domain/entity/user_preferences.dart';
import 'package:denwee/core/user_preferences/domain/failure/preferences_failure.dart';
import 'package:denwee/core/user_preferences/domain/repo/user_preferences_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserPreferencesRepo)
class UserPreferencesRepoImpl implements UserPreferencesRepo {
  final UserPreferencesLocalSource _localSource;
  final UserPreferencesRemoteSource _remoteSource;

  const UserPreferencesRepoImpl(
    this._localSource,
    this._remoteSource,
  );

  @override
  Option<UserPreferences> getPrefrencesLocal() {
    final data = _localSource.get();
    return optionOf(data?.toDomain());
  }

  @override
  Future<Unit> storePrefrencesLocal(UserPreferences preferences) async {
    final dto = UserPreferencesDto.fromDomain(preferences);
    await _localSource.store(dto);
    return unit;
  }

  @override
  Future<Unit> deletePrefrencesLocal() async {
    await _localSource.delete();
    return unit;
  }

  @override
  Future<Either<PreferencesFailure, UserPreferences>> getPreferencesRemote() async {
    try {
      final preferencesDto = await _remoteSource.get();
      return right(preferencesDto.toDomain());
    } on AppException catch (error) {
      final failure = PreferencesFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(PreferencesFailure.unexpected);
    }
  }

  @override
  Future<Either<PreferencesFailure, Unit>> storePreferencesRemote(UserPreferences preferences) async {
    try {
      final preferencesDto = UserPreferencesDto.fromDomain(preferences);
      await _remoteSource.store(preferencesDto);
      return right(unit);
    } on AppException catch (error) {
      final failure = PreferencesFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(PreferencesFailure.unexpected);
    }
  }
}
