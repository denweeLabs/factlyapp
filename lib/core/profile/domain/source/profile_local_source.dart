import 'package:denwee/core/profile/data/model/profile_dto.dart';

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
