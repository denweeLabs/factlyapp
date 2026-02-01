import 'package:denwee/core/backgrounds/data/model/available_background_dto.dart';
import 'package:denwee/core/backgrounds/data/model/background_category_dto.dart';
import 'package:denwee/core/backgrounds/data/model/resolved_background_asset_dto.dart';

abstract class BackgroundsLocalSource {
  ///
  /// Get backgrounds
  List<AvailableBackgroundDto> getBackgrounds();

  ///
  /// Get background categories
  List<BackgroundCategoryDto> getBackgroundCategories();

  ///
  /// Get background asset
  ResolvedBackgroundAssetDto? getBackgroundAsset();

  ///
  /// Store backgrounds
  Future<void> storeBackgrounds(List<AvailableBackgroundDto> data);

  ///
  /// Store background categories
  Future<void> storeBackgroundCategories(List<BackgroundCategoryDto> data);

  ///
  /// Store background asset
  Future<void> storeBackgroundAsset(ResolvedBackgroundAssetDto data);

  ///
  /// Delete backgrounds
  Future<void> deleteBackgrounds();

  ///
  /// Delete background categories
  Future<void> deleteCategories();

  ///
  /// Delete background asset
  Future<void> deleteBackgroundAsset();
}