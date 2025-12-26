// ignore_for_file: constant_identifier_names

import 'package:denwee/core/auth/domain/repo/access_token_repo.dart';
import 'package:denwee/core/network/data/request_executor/request_executor_impl.dart';
import 'package:denwee/core/network/domain/request_executor/request_executor.dart';
import 'package:denwee/di/env.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

const API = Named('API');
const ENV = Named('ENV');
const ENV_PREFIX = Named('ENV_PREFIX');

@module
abstract class ServerModule {
  //-------------------------------- Env --------------------------------
  @LazySingleton()
  @ENV
  @Environment(Env.dev)
  String provideEnvDev() {
    return Env.dev;
  }

  @LazySingleton()
  @ENV
  @Environment(Env.prod)
  String provideEnvProd() {
    return Env.prod;
  }

  @LazySingleton()
  @ENV_PREFIX
  @Environment(Env.dev)
  String devEnvPrefix() {
    return 'dev_';
  }

  @LazySingleton()
  @ENV_PREFIX
  @Environment(Env.prod)
  String prodEnvPrefix() {
    return '';
  }


  //-------------------------------- Base API urls --------------------------------
  @LazySingleton()
  @API
  @Environment(Env.dev)
  String devBaseApiUrl() {
    return 'https://bbsnkvanmxorhjvngffl.supabase.co/functions/v1/';
  }

  @LazySingleton()
  @API
  @Environment(Env.prod)
  String prodBaseApiUrl() {
    return 'https://yabrzbazsxyubeqjnctk.supabase.co/functions/v1/';
  }


  //-------------------------------- Dio --------------------------------
  @LazySingleton()
  @API
  Dio apiDio(@API String baseUrl) {
    return Dio(BaseOptions(
        baseUrl: baseUrl,
        sendTimeout: const Duration(seconds: 45),
        connectTimeout: const Duration(seconds: 45),
        receiveTimeout: const Duration(seconds: 45),
      ));
  }


  //-------------------------------- Request executor --------------------------------
  @LazySingleton()
  @API
  RequestExecutor requestExecutor(
    @API Dio dio,
    AccessTokenRepo accessTokenRepo,
  ) {
    return RequestExecutorImpl(
        dio: dio,
        accessTokenRepo: accessTokenRepo,
      );
  }
}
