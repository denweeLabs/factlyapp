import 'package:denwee/core/auth/domain/entity/third_party_login_body.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'third_party_login_body_dto.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class ThirdPartyLoginBodyDto {
  final String provider;
  @JsonKey(name: 'id_token') final String idToken;
  @JsonKey(name: 'access_token') final String? accessToken;

  const ThirdPartyLoginBodyDto({
    required this.provider,
    required this.idToken,
    required this.accessToken,
  });

  factory ThirdPartyLoginBodyDto.fromDomain(ThirdPartyLoginBody body) {
    return ThirdPartyLoginBodyDto(
      provider: body.provider.apiType,
      idToken: body.idToken,
      accessToken: body.accessToken.toNullable(),
    );
  }

  Map<String, dynamic> toJson() => _$ThirdPartyLoginBodyDtoToJson(this);
}
