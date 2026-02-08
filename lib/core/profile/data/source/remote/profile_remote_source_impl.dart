import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:denwee/core/profile/data/model/member_data_response_dto.dart';
import 'package:denwee/core/profile/data/model/profile_dto.dart';
import 'package:denwee/core/profile/data/model/update_profile_body_dto.dart';
import 'package:denwee/core/profile/data/source/remote/profile_api.dart';
import 'package:denwee/core/profile/domain/source/profile_remote_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRemoteSource)
class ProfileRemoteSourceImpl implements ProfileRemoteSource {
  final ProfileApi _api;

  const ProfileRemoteSourceImpl(this._api);

  @override
  Future<ProfileDto> getProfile() async {
    final response = await _api.getProfile();
    return response.parseOrThrow(ProfileDto.fromJson);
  }

  @override
  Future<ProfileDto> update(UpdateProfileBodyDto bodyDto) async {
    final response = await _api.updateProfile(bodyDto.toJson());
    return response.parseOrThrow(ProfileDto.fromJson);
  }

  @override
  Future<MemberDataResponseDto> getMemberData() async {
    final response = await _api.getMemberData();
    return response.parseOrThrow(MemberDataResponseDto.fromJson);
  }
}
