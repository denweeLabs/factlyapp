import 'package:denwee/core/facts/data/source/remote/facts_remote_source_impl.dart';
import 'package:denwee/core/facts/domain/entity/archive_list_result.dart';
import 'package:denwee/core/facts/domain/failure/facts_failure.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:dartz/dartz.dart';

abstract class FactsArchiveRepo {
  // Local
  List<UniqueId> getArchiveIdsLocal();
  Future<Unit> storeArchiveIdsLocal(List<UniqueId> ids);
  Future<Unit> storeFactLocal(UniqueId id);
  Future<Unit> deleteFactLocal(UniqueId id);
  Future<Unit> deleteArchiveLocal();

  // Remote
  Future<Either<FactsFailure, List<UniqueId>>> getArchiveRemote();
  Future<Either<FactsFailure, ArchiveListResult>> getArchiveListRemote({
    required SortOrder sortOrder,
    required int count,
    required int page,
  });
  Future<Either<FactsFailure, Unit>> storeFactRemote(UniqueId id);
  Future<Either<FactsFailure, Unit>> deleteFactRemote(UniqueId id);
}
