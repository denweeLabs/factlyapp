import 'dart:async';
import 'dart:io';

import 'package:denwee/core/auth/domain/repo/access_token_repo.dart';
import 'package:denwee/core/network/data/exceptions/authorization_exception.dart';
import 'package:denwee/core/network/data/exceptions/connection_exception.dart';
import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:denwee/core/network/domain/request_executor/request_executor.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/di/api/endpoints/endpoints.dart';
import 'package:denwee/di/di.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

/// Handles authenticated HTTP requests (GET/POST/PUT/DELETE)
/// Centralized wrapper around `Dio` for:
/// - Authorization header injection
/// - Automatic token refresh
/// - Error unification
/// - Cookie extraction
///
class RequestExecutorImpl implements RequestExecutor {
  final Dio dio;
  final AccessTokenRepo accessTokenRepo;

  RequestExecutorImpl({
    required this.dio,
    required this.accessTokenRepo,
  });

  /// Prevents parallel `_addAuthHeaders()` calls
  Future<void>? _addAuthHeadersFuture;


  // ---------------------------------------------------------------------------
  // POST
  // ---------------------------------------------------------------------------

  @override
  Future<ServerResponse> post(
    String url, {
    required dynamic body,
    Map<String, dynamic>? headers,
  }) =>
      _processPost(url, body: body, headers: headers);

  Future<ServerResponse> _processPost(
    String url, {
    required dynamic body,
    Map<String, dynamic>? headers,
  }) async {
    await _addAuthHeaders();

    debugPrint('*** POST: ${dio.options.baseUrl}$url');

    try {
      final allHeaders = Map<String, dynamic>.of(dio.options.headers)
        ..addAll(headers ?? {});

      final response = await dio.post<Object>(
        url,
        data: body,
        options: Options(headers: allHeaders),
      );

      final cookies = response.headers['set-cookie']?.first.split(';');

      return ServerResponse(
        statusCode: response.statusCode,
        data: response.data,
        cookies: cookies,
      );
    } on DioException catch (error) {
      debugPrint(
        'POST error ${error.response?.statusCode}, ${error.response?.data}',
      );
      return _parseDioException(error);
    }
  }


  // ---------------------------------------------------------------------------
  // GET
  // ---------------------------------------------------------------------------

  @override
  Future<ServerResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    ResponseType? responseType,
  }) =>
      _processGet(
        url,
        queryParameters: queryParameters,
        responseType: responseType,
      );

  Future<ServerResponse> _processGet(
    String url, {
    Map<String, dynamic>? queryParameters,
    ResponseType? responseType,
  }) async {
    await _addAuthHeaders();

    try {
      var params = '';
      if (queryParameters != null) {
        params = Uri(queryParameters: queryParameters).toString();
      }

      debugPrint('*** GET: ${dio.options.baseUrl}$url$params');

      final response = await dio.get<Object>(
        url + params,
        options: Options(responseType: responseType),
      );

      return ServerResponse(
        statusCode: response.statusCode,
        data: response.data,
      );
    } on DioException catch (error) {
      debugPrint(
        'GET error ${error.response?.statusCode}, ${error.response?.data}',
      );
      return _parseDioException(error);
    }
  }


  // ---------------------------------------------------------------------------
  // PUT
  // ---------------------------------------------------------------------------

  @override
  Future<ServerResponse> put(
    String url, {
    required dynamic body,
  }) =>
      _processPut(url, body: body);

  Future<ServerResponse> _processPut(
    String url, {
    required dynamic body,
  }) async {
    await _addAuthHeaders();

    debugPrint('*** PUT: ${dio.options.baseUrl}$url');

    try {
      final response = await dio.put<Object>(
        url,
        data: body,
      );

      return ServerResponse(
        statusCode: response.statusCode,
        data: response.data,
      );
    } on DioException catch (error) {
      debugPrint(
        'PUT error ${error.response?.statusCode}, ${error.response?.data}',
      );
      return _parseDioException(error);
    }
  }


  // ---------------------------------------------------------------------------
  // DELETE
  // ---------------------------------------------------------------------------

  @override
  Future<ServerResponse> delete(
    String url, {
    dynamic body,
    Map<String, dynamic>? headers,
  }) =>
      _processDelete(url, body: body, headers: headers);

  Future<ServerResponse> _processDelete(
    String url, {
    dynamic body,
    Map<String, dynamic>? headers,
  }) async {
    await _addAuthHeaders();

    debugPrint('*** DELETE: ${dio.options.baseUrl}$url');

    try {
      final allHeaders = Map<String, dynamic>.of(dio.options.headers)
        ..addAll(headers ?? {});

      final response = await dio.delete<Object>(
        url,
        data: body,
        options: Options(headers: allHeaders),
      );

      final cookies = response.headers['set-cookie']?.first.split(';');

      return ServerResponse(
        statusCode: response.statusCode,
        data: response.data,
        cookies: cookies,
      );
    } on DioException catch (error) {
      debugPrint(
        'DELETE error ${error.response?.statusCode}, ${error.response?.data}',
      );
      return _parseDioException(error);
    }
  }


  // ---------------------------------------------------------------------------
  // AUTH HEADERS
  // ---------------------------------------------------------------------------

  /// Ensures:
  /// - Current access token is loaded
  /// - If expiring soon, refresh is triggered
  /// - Authorization header is applied or removed
  Future<void> _addAuthHeaders() async {
    if (_addAuthHeadersFuture != null) return _addAuthHeadersFuture;

    final completer = Completer<void>();
    _addAuthHeadersFuture = completer.future;

    const headerName = 'Authorization';
    var token = await accessTokenRepo.getAccessToken();

    if (token == null) {
      dio.options.headers.remove(headerName);
    } else {
      final expiry = JwtUtil.getExpiryDate(token);
      final now = DateTime.now();

      final willExpireSoon = expiry != null &&
          now
              .add(AppConstants.config.tokenRefreshPriorDuration)
              .isAfter(expiry);

      if (willExpireSoon) {
        try {
          token = await _performTokenRefresh();
        } on AuthorizationException {
          await accessTokenRepo.setAccessToken(null);
          dio.options.headers.remove(headerName);
        }
      }

      dio.options.headers[headerName] = 'Bearer $token';
    }

    completer.complete();
    _addAuthHeadersFuture = null;
  }


  // ---------------------------------------------------------------------------
  // TOKEN REFRESH
  // ---------------------------------------------------------------------------

  /// Calls `/member/tokenUpdate`
  /// Uses stored refresh token to obtain new access/refresh tokens
  Future<String> _performTokenRefresh() async {
    try {
      final dioApi = getIt<Dio>(instanceName: 'API');
      final url = Endpoints.member.tokenUpdate;

      final refreshToken = await accessTokenRepo.getRefreshToken();
      if (refreshToken == null) throw AuthorizationException();

      final body = {'refresh_token': refreshToken};

      final response = await dioApi.post<Map<String, dynamic>>(url, data: body);
      final data = response.data!;
      final headers = response.headers.map;

      final newAccessToken = data['access_token'] as String;
      final newRefreshToken = _parseRefreshToken(headers);

      await accessTokenRepo.setAccessToken(newAccessToken);
      await accessTokenRepo.setRefreshToken(newRefreshToken);

      return newAccessToken;
    } on DioException catch (error) {
      debugPrint('_performTokenRefresh Dio error: ${error.toString()}');
      _parseDioException(error);
    } catch (e) {
      debugPrint('_performTokenRefresh Exception: ${e.toString()}');
      throw ConnectionException();
    }

    throw 'Unexpected token refresh failure';
  }


  // ---------------------------------------------------------------------------
  // REFRESH TOKEN PARSER
  // ---------------------------------------------------------------------------

  /// Extracts the refresh token from `set-cookie` header
  String _parseRefreshToken(Map<String, dynamic> headers) {
    final cookiesRaw = headers['set-cookie'] as List<String>;
    final cookies = cookiesRaw.first.split(';');

    final tokenCookie =
        cookies.firstWhere((cookie) => cookie.contains('refreshToken'));

    return tokenCookie.substring(tokenCookie.indexOf('=') + 1);
  }


  // ---------------------------------------------------------------------------
  // ERROR PARSER
  // ---------------------------------------------------------------------------

  /// Converts Dio exceptions into domain-specific exceptions
  /// or normalized `ServerResponse`
  ServerResponse _parseDioException(DioException error) {
    if (error.error is SocketException) {
      throw ConnectionException();
    }

    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      throw ConnectionException();
    }

    if (error.response?.statusCode == 401) {
      throw AuthorizationException();
    }
    
    return ServerResponse(
      statusCode: error.response?.statusCode,
      data: error.response?.data,
    );
  }
}
