import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:dio/dio.dart';

abstract class RequestExecutor {
  Future<ServerResponse> post(
    String url, {
    required dynamic body,
    Map<String, dynamic>? headers,
  });

  Future<ServerResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    ResponseType? responseType,
  });

  Future<ServerResponse> put(
    String url, {
    required dynamic body,
  });

  Future<ServerResponse> delete(
    String url, {
    dynamic body,
    Map<String, dynamic>? headers,
  });
}
