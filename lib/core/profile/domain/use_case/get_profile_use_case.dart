import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:denwee/core/profile/domain/entity/profile.dart';
import 'package:denwee/core/profile/domain/entity/profile_failure.dart';
import 'package:denwee/core/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@LazySingleton()
class GetProfileUseCase {
  final ProfileRepo _profileRepo;

  const GetProfileUseCase(this._profileRepo);

  Future<Either<ProfileFailure, Profile>> execute() async {
    final failureOrSuccess = await _profileRepo.getProfileRemote();
    final profile = failureOrSuccess.getEntries().$2;

    if (profile != null) {
      unawaited(_profileRepo.storeProfileLocal(profile));
    }

    return failureOrSuccess;
  }
}