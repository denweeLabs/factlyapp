import 'package:denwee/core/profile/data/model/member_data_response_dto.dart';
import 'package:denwee/core/profile/data/model/profile_dto.dart';
import 'package:denwee/core/profile/data/model/update_profile_body_dto.dart';

abstract class ProfileRemoteSource {
  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<ProfileDto> getProfile();

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<ProfileDto> update(UpdateProfileBodyDto bodyDto);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<MemberDataResponseDto> getMemberData();
}