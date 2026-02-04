import 'package:denwee/core/backgrounds/data/model/apply_background_body_dto.dart';
import 'package:denwee/core/backgrounds/data/model/apply_background_response_dto.dart';
import 'package:denwee/core/backgrounds/data/model/available_backgrounds_response_dto.dart';

abstract class BackgroundsRemoteSource {
  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<AvailableBackgroundsResponseDto> getBackgrounds({String? languageCode});

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<ApplyBackgroundResponseDto> apply(ApplyBackgroundBodyDto dto);

  /// Throws:
  /// [AuthorizationException]
  /// [ConnectionException]
  /// [GenericException]
  Future<void> reset();

  /// Throws:
  /// [ConnectionException]
  Future<void> downloadAssetFile(String url, String savePath);
}