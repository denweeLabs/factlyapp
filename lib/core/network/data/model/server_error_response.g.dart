// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerErrorResponse _$ServerErrorResponseFromJson(Map<String, dynamic> json) =>
    ServerErrorResponse(
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ServerErrorResponseToJson(
  ServerErrorResponse instance,
) => <String, dynamic>{'code': instance.code, 'message': instance.message};
