import 'package:denwee/core/user_preferences/data/model/user_preferences_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_body_dto.g.dart';

@JsonSerializable(createFactory: false)
class RegisterBodyDto {
  final String email;
  final String password;
  final UserPreferencesDto preferences;

  const RegisterBodyDto({
    required this.email,
    required this.password,
    required this.preferences,
  });

  Map<String, dynamic> toJson() => _$RegisterBodyDtoToJson(this);
}
