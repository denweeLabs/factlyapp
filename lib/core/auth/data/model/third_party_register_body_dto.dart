import 'package:denwee/core/auth/domain/entity/third_party_register_body.dart';
import 'package:denwee/core/user_preferences/data/model/user_preferences_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'third_party_register_body_dto.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class ThirdPartyRegisterBodyDto {
  final String provider;
  @JsonKey(name: 'id_token') final String idToken;
  @JsonKey(name: 'access_token') final String? accessToken;
  final UserPreferencesDto preferences;

  const ThirdPartyRegisterBodyDto({
    required this.provider,
    required this.idToken,
    required this.accessToken,
    required this.preferences,
  });

  factory ThirdPartyRegisterBodyDto.fromDomain(ThirdPartyRegisterBody body) {
    return ThirdPartyRegisterBodyDto(
      provider: body.provider.apiType,
      idToken: body.idToken,
      accessToken: body.accessToken.toNullable(),
      preferences: UserPreferencesDto.fromDomain(body.preferences),
    );
  }

  Map<String, dynamic> toJson() => _$ThirdPartyRegisterBodyDtoToJson(this);
}
