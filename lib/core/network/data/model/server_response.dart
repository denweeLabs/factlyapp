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
