import 'package:denwee/pages/authentication/ui/authentication_routes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_page_args.g.dart';

@JsonSerializable()
class AuthenticationPageArgs {
  final String initialRoute;
  final bool hideLoginButton;
  final bool hideRegisterButton;

  const AuthenticationPageArgs({
    this.initialRoute = AuthenticationRoutes.login,
    this.hideLoginButton = false,
    this.hideRegisterButton = false,
  });

  factory AuthenticationPageArgs.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationPageArgsFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationPageArgsToJson(this);
}
