import 'package:denwee/core/backgrounds/data/model/apply_background_body_dto.dart';
import 'package:denwee/core/backgrounds/data/model/apply_background_response_dto.dart';
import 'package:denwee/core/backgrounds/data/model/available_backgrounds_response_dto.dart';
import 'package:denwee/core/backgrounds/data/source/remote/backgrounds_api.dart';
import 'package:denwee/core/backgrounds/domain/source/backgrounds_remote_source.dart';
import 'package:denwee/core/network/data/model/connection_exception.dart';
import 'package:denwee/core/network/data/model/server_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BackgroundsRemoteSource)
class BackgroundsRemoteSourceImpl implements BackgroundsRemoteSource {
  final BackgroundsApi _api;

  const BackgroundsRemoteSourceImpl(this._api);

  @override
  Future<AvailableBackgroundsResponseDto> getBackgrounds({String? languageCode}) async {
    final response = await _api.getBackgrounds(languageCode: languageCode);
    return response.parseOrThrow(AvailableBackgroundsResponseDto.fromJson);
  }

  @override
  Future<ApplyBackgroundResponseDto> apply(ApplyBackgroundBodyDto dto) async {
    final response = await _api.applyBackground(dto.toJson());
    return response.parseOrThrow(ApplyBackgroundResponseDto.fromJson);
  }

  @override
  Future<void> reset() async {
    final response = await _api.resetBackground();
    return response.successOrThrow();
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
