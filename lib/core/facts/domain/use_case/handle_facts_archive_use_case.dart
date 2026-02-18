import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:denwee/core/facts/domain/entity/facts_failure.dart';
import 'package:denwee/core/facts/domain/repo/facts_archive_repo.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@LazySingleton()
class HandleFactsArchiveUseCase {
  final FactsArchiveRepo _archiveRepo;

  const HandleFactsArchiveUseCase(this._archiveRepo);

  Future<Either<FactsFailure, List<UniqueId>>> getIds() async {
    final failureOrSuccess = await _archiveRepo.getArchiveRemote();
    final (_, ids) = failureOrSuccess.getEntries();
    
    if (ids != null && ids.isNotEmpty) {
      unawaited(_archiveRepo.storeArchiveIdsLocal(ids));
    }

    return failureOrSuccess;
  }

  Future<Either<FactsFailure, Unit>> storeId(UniqueId id) async {
    final failureOrSuccess = await _archiveRepo.storeFactRemote(id);
    final (failure, _) = failureOrSuccess.getEntries();
    
    if (failure == null) {
      unawaited(_archiveRepo.storeFactLocal(id));
    }

    return failureOrSuccess;
  }

  Future<Either<FactsFailure, Unit>> removeId(UniqueId id) async {
    final failureOrSuccess = await _archiveRepo.deleteFactRemote(id);
    final (failure, _) = failureOrSuccess.getEntries();
    
    if (failure == null) {
      unawaited(_archiveRepo.deleteFactLocal(id));
    }

    return failureOrSuccess;
  }
}