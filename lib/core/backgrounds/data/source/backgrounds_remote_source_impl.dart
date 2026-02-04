import 'package:denwee/core/backgrounds/data/model/apply_background_body_dto.dart';
import 'package:denwee/core/backgrounds/data/model/apply_background_response_dto.dart';
import 'package:denwee/core/backgrounds/data/model/available_backgrounds_response_dto.dart';
import 'package:denwee/core/backgrounds/domain/source/backgrounds_remote_source.dart';
import 'package:denwee/core/network/data/exceptions/connection_exception.dart';
import 'package:denwee/core/network/data/model/server_error_response.dart';
import 'package:denwee/core/network/domain/request_executor/request_executor.dart';
import 'package:denwee/di/api/endpoints/endpoints.dart';
import 'package:denwee/di/modules/server_module.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BackgroundsRemoteSource)
class BackgroundsRemoteSourceImpl implements BackgroundsRemoteSource {
  final RequestExecutor _requestExecutor;

  const BackgroundsRemoteSourceImpl(
    @API this._requestExecutor,
  );

  @override
  Future<AvailableBackgroundsResponseDto> getBackgrounds({String? languageCode}) async {
    final response = await _requestExecutor.get(
      Endpoints.member.backgrounds(languageCode: languageCode),
    );
    final data = response.data as Map<String, dynamic>;
    if (response.isSuccessful) {
      return AvailableBackgroundsResponseDto.fromJson(data);
    } else {
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<ApplyBackgroundResponseDto> apply(ApplyBackgroundBodyDto dto) async {
    final response = await _requestExecutor.post(
      Endpoints.member.applyBackground,
      body: dto.toJson(),
    );
    final data = response.data as Map<String, dynamic>;
    if (response.isSuccessful) {
      return ApplyBackgroundResponseDto.fromJson(data);
    } else {
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<void> reset() async {
    final response = await _requestExecutor.post(
      Endpoints.member.resetBackground,
      body: null,
    );
    if (!response.isSuccessful) {
      final data = response.data as Map<String, dynamic>;
      final errorResponse = ServerErrorResponse.fromJson(data);
      throw errorResponse.asGenericException;
    }
  }

  @override
  Future<void> downloadAssetFile(String url, String savePath) async {
    final dio = Dio();
    final options = Options(responseType: ResponseType.bytes);
    final response = await dio.download(url, savePath, options: options);
    if (response.statusCode != 200) {
      throw ConnectionException();
    }
  }
}
