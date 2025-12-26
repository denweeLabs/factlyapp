import 'package:denwee/core/auth/domain/entity/reset_password_body.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_body_dto.g.dart';

@JsonSerializable(createFactory: false)
class ResetPasswordBodyDto {
  @JsonKey(name: 'access_token') final String accessToken;
  @JsonKey(name: 'new_password') final String newPassword;

  const ResetPasswordBodyDto({
    required this.accessToken,
    required this.newPassword,
  });

  factory ResetPasswordBodyDto.fromDomain(ResetPasswordBody domain) {
    return ResetPasswordBodyDto(
      accessToken: domain.accessToken,
      newPassword: domain.newPassword.value,
    );
  }

  Map<String, dynamic> toJson() => _$ResetPasswordBodyDtoToJson(this);
}
