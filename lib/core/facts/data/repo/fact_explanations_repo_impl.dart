import 'package:denwee/core/facts/data/model/fact_explanation_dto.dart';
import 'package:denwee/core/facts/data/source/local/facts_local_source.dart';
import 'package:denwee/core/facts/data/source/remote/facts_remote_source.dart';
import 'package:denwee/core/facts/domain/entity/fact_explanation.dart';
import 'package:denwee/core/facts/domain/failure/facts_failure.dart';
import 'package:denwee/core/facts/domain/repo/fact_explanations_repo.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FactExplanationsRepo)
class FactExplanationsRepoImpl implements FactExplanationsRepo {
  final FactsLocalSource _localSource;
  final FactsRemoteSource _remoteSource;

  const FactExplanationsRepoImpl(
    this._localSource,
    this._remoteSource,
  );

  @override
  Future<Either<FactsFailure, Option<FactExplanation>>> getFactExplanationLocal(UniqueId id) async {
    try {
      final dto = await _localSource.getFactExplanation(id.value);
      return right(optionOf(dto?.toDomain()));
    } catch (error) {
      debugPrint('getFactExplanationLocal error: $error');
      return left(FactsFailure.unexpected);
    }
  }
  
  @override
  Future<Either<FactsFailure, Unit>> storeFactExplanationLocal(FactExplanation details) async {
    try {
      final dto = FactExplanationDto.fromDomain(details);
      await _localSource.storeFactExplanation(dto);
      return right(unit);
    } catch (error) {
      debugPrint('storeFactExplanationLocal error: $error');
      return left(FactsFailure.unexpected);
    }
  }

  @override
  Future<Either<FactsFailure, Unit>> deleteFactExplanationsLocal() async {
    try {
      await _localSource.deleteFactExplanations();
      return right(unit);
    } catch (error) {
      debugPrint('deleteFactExplanationsLocal error: $error');
      return left(FactsFailure.unexpected);
    }
  }

  @override
  Future<Either<FactsFailure, FactExplanation>> getFactExplanationRemote(UniqueId id, {bool useStars = false}) async {
    try {
      final data = await _remoteSource.getFactExplanation(id.value, useStars);
      return right(data.toDomain());
    } on AppException catch (error) {
      final failure = FactsFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(FactsFailure.unexpected);
    }
  }

  @override
  Future<Either<FactsFailure, bool>> getFactExplanationRewardStatusRemote(UniqueId id) async {
    try {
      final isObtained = await _remoteSource.getFactExplanationRewardStatus(id.value);
      return right(isObtained);
    } on AppException catch (error) {
      final failure = FactsFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(FactsFailure.unexpected);
    }
  }
}
