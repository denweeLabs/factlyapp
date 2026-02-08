import 'package:denwee/core/profile/domain/entity/member_data.dart';
import 'package:denwee/core/profile/domain/entity/profile.dart';
import 'package:denwee/core/profile/domain/entity/update_profile_body.dart';
import 'package:denwee/core/profile/domain/entity/profile_failure.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  // Local
  Option<Profile> getProfileLocal();
  Future<Unit> storeProfileLocal(Profile profile);
  Future<Unit> deleteProfileLocal();

  // Remote
  Future<Either<ProfileFailure, Profile>> getProfileRemote();
  Future<Either<ProfileFailure, Profile>> updateProfileRemote(UpdateProfileBody body);
  Future<Either<ProfileFailure, MemberData>> getMemberDataRemote();
}