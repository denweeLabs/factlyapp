import 'package:denwee/core/network/data/exceptions/generic_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_error_response.g.dart';

@JsonSerializable()
class ServerErrorResponse {
  final String code;
  final String message;

  const ServerErrorResponse({
    required this.code,
    required this.message,
  });

  factory ServerErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ServerErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServerErrorResponseToJson(this);

  GenericException get asGenericException {
    return GenericException(code: code, message: message);
  }
}
