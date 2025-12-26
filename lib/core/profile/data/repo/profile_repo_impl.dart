import 'package:denwee/core/profile/data/model/profile_dto.dart';
import 'package:denwee/core/profile/data/model/update_profile_body_dto.dart';
import 'package:denwee/core/profile/data/source/profile_local_source.dart';
import 'package:denwee/core/profile/data/source/profile_remote_source.dart';
import 'package:denwee/core/profile/domain/entity/profile.dart';
import 'package:denwee/core/profile/domain/entity/update_profile_body.dart';
import 'package:denwee/core/profile/domain/failure/profile_failure.dart';
import 'package:denwee/core/profile/domain/repo/profile_repo.dart';
import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileLocalSource _localSource;
  final ProfileRemoteSource _remoteSource;

  const ProfileRepoImpl(
    this._localSource,
    this._remoteSource,
  );

  @override
  Option<Profile> getProfileLocal() {
    final profileDto = _localSource.get();
    return optionOf(profileDto?.toDomain());
  }

  @override
  Future<Unit> storeProfileLocal(Profile profile) async {
    final profileDto = ProfileDto.fromDomain(profile);
    await _localSource.store(profileDto);
    return unit;
  }

  @override
  Future<Unit> deleteProfileLocal() async {
    await _localSource.delete();
    return unit;
  }

  @override
  Future<Either<ProfileFailure, Profile>> getProfileRemote() async {
    try {
      final profileDto = await _remoteSource.get();
      return right(profileDto.toDomain());
    } on AppException catch (error) {
      final failure = ProfileFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(ProfileFailure.unexpected);
    }
  }

  @override
  Future<Either<ProfileFailure, Profile>> updateProfileRemote(UpdateProfileBody body) async {
    try {
      final bodyDto = UpdateProfileBodyDto.fromDomain(body);
      final profileDto = await _remoteSource.update(bodyDto);
      return right(profileDto.toDomain());
    } on AppException catch (error) {
      final failure = ProfileFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(ProfileFailure.unexpected);
    }
  }
}
