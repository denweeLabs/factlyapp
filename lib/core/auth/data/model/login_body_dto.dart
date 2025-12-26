import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_body_dto.g.dart';

@JsonSerializable(createFactory: false)
class LoginBodyDto {
  final String email;
  final String password;

  const LoginBodyDto({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$LoginBodyDtoToJson(this);
}
