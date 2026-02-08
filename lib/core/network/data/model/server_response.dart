import 'package:denwee/core/network/data/model/server_error_response.dart';

class ServerResponse {
  final int? statusCode;
  final Object? data;
  final List<String>? cookies;

  const ServerResponse({
    this.statusCode,
    this.data,
    this.cookies,
  });

  bool get isSuccessful {
    return statusCode != null && statusCode! < 300;
  }
}

extension ServerResponseX on ServerResponse {
  ///
  /// Parses successful response data or throws on error.
  /// 
  T parseOrThrow<T>(T Function(Map<String, dynamic>) mapper) {
    if (!isSuccessful) {
      final error = ServerErrorResponse.fromJson(data as Map<String, dynamic>);
      throw error.asGenericException;
    }
    return mapper(data as Map<String, dynamic>);
  }

  ///
  /// Ensures successful response without expecting any data.
  /// 
  void successOrThrow() {
    if (!isSuccessful) {
      final error = ServerErrorResponse.fromJson(data as Map<String, dynamic>);
      throw error.asGenericException;
    }
  }
}
