import 'package:denwee/core/auth/domain/entity/change_password_body.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_body_dto.g.dart';

@JsonSerializable(createFactory: false)
class ChangePasswordBodyDto {
  @JsonKey(name: 'old_password') final String oldPassword;
  @JsonKey(name: 'new_password') final String newPassword;

  const ChangePasswordBodyDto({
    required this.oldPassword,
    required this.newPassword,
  });

  factory ChangePasswordBodyDto.fromDomain(ChangePasswordBody domain) {
    return ChangePasswordBodyDto(
      oldPassword: domain.oldPassword.value,
      newPassword: domain.newPassword.value,
    );
  }

  Map<String, dynamic> toJson() => _$ChangePasswordBodyDtoToJson(this);
}
