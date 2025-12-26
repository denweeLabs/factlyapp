import 'package:denwee/core/facts/data/source/local/facts_local_source.dart';
import 'package:denwee/core/facts/data/source/remote/facts_remote_source.dart';
import 'package:denwee/core/facts/data/source/remote/facts_remote_source_impl.dart';
import 'package:denwee/core/facts/domain/entity/archive_list_result.dart';
import 'package:denwee/core/facts/domain/failure/facts_failure.dart';
import 'package:denwee/core/facts/domain/repo/facts_archive_repo.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/network/data/exceptions/app_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FactsArchiveRepo)
class FactsArchiveRepoImpl implements FactsArchiveRepo {
  final FactsLocalSource _localSource;
  final FactsRemoteSource _remoteSource;

  const FactsArchiveRepoImpl(
    this._localSource,
    this._remoteSource,
  );

  // Local
  @override
  Future<Unit> deleteArchiveLocal() async {
    await _localSource.deleteArchivedFacts();
    return unit;
  }
  
  @override
  Future<Unit> deleteFactLocal(UniqueId id) async {
    await _localSource.deleteFactFromArchive(id.value);
    return unit;
  }
  
  @override
  List<UniqueId> getArchiveIdsLocal() {
    final ids = _localSource.getArchivedFactsIds();
    return ids.map(UniqueId.fromValue).toList();
  }
  
  @override
  Future<Unit> storeArchiveIdsLocal(List<UniqueId> ids) async {
    final mapped = ids.map((e) => e.value).toList();
    await _localSource.storeFactsIdsToArchive(mapped);
    return unit;
  }
  
  @override
  Future<Unit> storeFactLocal(UniqueId id) async {
    await _localSource.storeFactToArchive(id.value);
    return unit;
  }

  // Remote
  @override
  Future<Either<FactsFailure, List<UniqueId>>> getArchiveRemote() async {
    try {
      final dtos = await _remoteSource.getArchivedFactsIds();
      final listOfFacts = dtos.map(UniqueId.fromValue).toList();
      return right(listOfFacts);
    } on AppException catch (error) {
      final failure = FactsFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(FactsFailure.unexpected);
    }
  }

  @override
  Future<Either<FactsFailure, ArchiveListResult>> getArchiveListRemote({
    required SortOrder sortOrder,
    required int count,
    required int page,
  }) async {
    try {
      final data = await _remoteSource.getArchivedFactsList(
        sortOrder: sortOrder,
        count: count,
        page: page,
      );
      return right(data.toDomain());
    } on AppException catch (error) {
      final failure = FactsFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(FactsFailure.unexpected);
    }
  }
  
  @override
  Future<Either<FactsFailure, Unit>> deleteFactRemote(UniqueId id) async {
    try {
      await _remoteSource.deleteArchivedFact(id.value);
      return right(unit);
    } on AppException catch (error) {
      final failure = FactsFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(FactsFailure.unexpected);
    }
  }
  
  @override
  Future<Either<FactsFailure, Unit>> storeFactRemote(UniqueId id) async {
    try {
      await _remoteSource.storeFactToArchive(id.value);
      return right(unit);
    } on AppException catch (error) {
      final failure = FactsFailure.fromAppException(error);
      return left(failure);
    } catch (_) {
      return left(FactsFailure.unexpected);
    }
  }
}
