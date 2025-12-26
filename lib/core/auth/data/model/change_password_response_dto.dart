import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class ChangePasswordResponseDto {
  @JsonKey(name: 'access_token')
  final String accessToken;

  const ChangePasswordResponseDto({
    required this.accessToken,
  });

  factory ChangePasswordResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseDtoFromJson(json);
}
