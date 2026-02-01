import 'package:dartz/dartz.dart';
import 'package:denwee/core/backgrounds/data/model/apply_background_body_dto.dart';
import 'package:denwee/core/backgrounds/data/model/available_background_dto.dart';
import 'package:denwee/core/backgrounds/data/model/available_backgrounds_response_dto.dart';
import 'package:denwee/core/backgrounds/data/model/background_category_dto.dart';
import 'package:denwee/core/backgrounds/data/model/resolved_background_asset_dto.dart';
import 'package:denwee/core/backgrounds/data/source/local/backgrounds_local_source.dart';
import 'package:denwee/core/backgrounds/data/source/remote/backgrounds_remote_source.dart';
import 'package:denwee/core/backgrounds/domain/entity/apply_background_body.dart';
import 'package:denwee/core/backgrounds/domain/entity/apply_background_result.dart';
import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/resolved_background_asset.dart';
import 'package:denwee/core/backgrounds/domain/failure/background_failure.dart';
import 'package:denwee/core/backgrounds/domain/repo/backgrounds_repo.dart';
import 'package:denwee/core/backgrounds/domain/utils/background_asset_cache_util.dart';
import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BackgroundsRepo)
class BackgroundsRepoImpl implements BackgroundsRepo {
  final BackgroundsLocalSource _localSource;
  final BackgroundsRemoteSource _remoteSource;
  final BackgroundAssetCacheUtil _assetCacheUtil;

  const BackgroundsRepoImpl(
    this._localSource,
    this._remoteSource,
    this._assetCacheUtil,
  );

  @override
  List<AvailableBackground> getBackgroundsLocal() {
    final categoriesDtos = _localSource.getBackgroundCategories();
    final backgroundDtos = _localSource.getBackgrounds();
    return backgroundDtos.mapWithCategories(categoriesDtos);
  }
  
  @override
  Future<Unit> storeBackgroundsLocal(List<AvailableBackground> backgrounds) async {
    final categoryDtos = <BackgroundCategoryDto>[];
    final backgroundDtos = <AvailableBackgroundDto>[];

    for (final background in backgrounds) {
      categoryDtos.add(BackgroundCategoryDto.fromDomain(background.category));
      backgroundDtos.add(AvailableBackgroundDto.fromDomain(background));
    }
    
    await _localSource.storeBackgroundCategories(categoryDtos);
    await _localSource.storeBackgrounds(backgroundDtos);

    return unit;
  }

  @override
  Future<Unit> deleteBackgroundsLocal() async {
    await _localSource.deleteCategories();
    await _localSource.deleteBackgrounds();
    return unit;
  }

  @override
  Option<ResolvedBackgroundAsset> getBackgroundAssetLocal() {
    final assetDto = _localSource.getBackgroundAsset();
    return optionOf(assetDto?.toDomain());
  }

  @override
  Future<Unit> storeBackgroundAssetLocal(ResolvedBackgroundAsset asset) async {
    final dto = ResolvedBackgroundAssetDto.fromDomain(asset);
    await _localSource.storeBackgroundAsset(dto);
    return unit;
  }

  @override
  Future<Unit> deleteBackgroundAssetLocal() async {
    await _localSource.deleteBackgroundAsset();
    return unit;
  }

  @override
  Future<Either<BackgroundFailure, (Option<ResolvedBackgroundAsset>, List<AvailableBackground>)>> getBackgroundsRemote({String? languageCode}) async {
    try {
      final responseDto = await _remoteSource.getBackgrounds(languageCode: languageCode);
      final backgroundsList = responseDto.backgroundsToDomain();
      final activeBackground = responseDto.activeBackgroundToDomain();
      final resolvedBackground = await activeBackground.fold(() => null, (background) async {
        return _assetCacheUtil.downloadBackgroundIfNeeded(background);
      });
      return right((optionOf(resolvedBackground), backgroundsList));
    } on AppException catch (error) {
      final failure = BackgroundFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(BackgroundFailure.unexpected);
    }
  }

  @override
  Future<Either<BackgroundFailure, (ResolvedBackgroundAsset, ApplyBackgroundResult)>> applyBackgroundRemote(ApplyBackgroundBody body) async {
    try {
      final bodyDto = ApplyBackgroundBodyDto.fromDomain(body);
      final result = (await _remoteSource.apply(bodyDto)).toDomain();
      final resolvedBackground = await _assetCacheUtil.downloadBackgroundIfNeeded(result.activeBackground);
      return right((resolvedBackground, result));
    } on AppException catch (error) {
      final failure = BackgroundFailure.fromAppException(error);
      return left(failure);
    } catch (error) {
      return left(BackgroundFailure.unexpected);
    }
  }

  @override
  Future<Either<BackgroundFailure, Unit>> resetBackgroundRemote() async {
    try {
      await _remoteSource.reset();
      return right(unit);
    } on AppException catch (error) {
      final failure = BackgroundFailure.fromAppException(error);
      return left(failure);
    } catch (error) {
      return left(BackgroundFailure.unexpected);
    }
  }
}