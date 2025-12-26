import 'package:denwee/core/facts/domain/entity/fact_explanation.dart';
import 'package:denwee/core/facts/domain/repo/fact_explanations_repo.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@LazySingleton()
class CheckFactExplanationUseCase {
  final FactExplanationsRepo _factExplanationsRepo;

  const CheckFactExplanationUseCase(this._factExplanationsRepo);

  Future<Option<FactExplanation>> execute(UniqueId id) async {
    // check local fact
    final localExplanation = (await _factExplanationsRepo.getFactExplanationLocal(id)).getEntries();
    if (localExplanation.$2?.isSome() == true) return localExplanation.$2!;

    // check remote fact
    final remoteExplanation = (await _factExplanationsRepo.getFactExplanationRemote(id)).getEntries();
    if (remoteExplanation.$2 != null) {
      _factExplanationsRepo.storeFactExplanationLocal(remoteExplanation.$2!);
    }
    return optionOf(remoteExplanation.$2);
  }
}
