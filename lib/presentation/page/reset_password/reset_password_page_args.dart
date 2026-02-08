import 'package:json_annotation/json_annotation.dart';

part 'reset_password_page_args.g.dart';

@JsonSerializable()
class ResetPasswordPageArgs {
  final String accessToken;

  const ResetPasswordPageArgs({
    required this.accessToken,
  });

  factory ResetPasswordPageArgs.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordPageArgsFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordPageArgsToJson(this);
}