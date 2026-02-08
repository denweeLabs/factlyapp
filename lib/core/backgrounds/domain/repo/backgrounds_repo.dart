import 'package:dartz/dartz.dart';
import 'package:denwee/core/backgrounds/domain/entity/apply_background_body.dart';
import 'package:denwee/core/backgrounds/domain/entity/apply_background_result.dart';
import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/resolved_background_asset.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_failure.dart';

abstract class BackgroundsRepo {
  List<AvailableBackground> getBackgroundsLocal();
  Future<Unit> storeBackgroundsLocal(List<AvailableBackground> backgrounds);
  Future<Unit> deleteBackgroundsLocal();

  Option<ResolvedBackgroundAsset> getBackgroundAssetLocal();
  Future<Unit> storeBackgroundAssetLocal(ResolvedBackgroundAsset asset);
  Future<Unit> deleteBackgroundAssetLocal();
  
  Future<Either<BackgroundFailure, (Option<ResolvedBackgroundAsset>, List<AvailableBackground>)>> getBackgroundsRemote({String? languageCode});
  Future<Either<BackgroundFailure, (ResolvedBackgroundAsset, ApplyBackgroundResult)>> applyBackgroundRemote(ApplyBackgroundBody body);
  Future<Either<BackgroundFailure, Unit>> resetBackgroundRemote();
}