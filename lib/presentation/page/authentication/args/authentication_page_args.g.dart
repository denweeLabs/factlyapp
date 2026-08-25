// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_page_args.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationPageArgs _$AuthenticationPageArgsFromJson(
  Map<String, dynamic> json,
) => AuthenticationPageArgs(
  initialRoute: json['initialRoute'] as String? ?? AuthenticationRoutes.login,
  hideLoginButton: json['hideLoginButton'] as bool? ?? false,
  hideRegisterButton: json['hideRegisterButton'] as bool? ?? false,
);

Map<String, dynamic> _$AuthenticationPageArgsToJson(
  AuthenticationPageArgs instance,
) => <String, dynamic>{
  'initialRoute': instance.initialRoute,
  'hideLoginButton': instance.hideLoginButton,
  'hideRegisterButton': instance.hideRegisterButton,
};
