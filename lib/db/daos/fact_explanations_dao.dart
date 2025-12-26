import 'package:denwee/db/database.dart';
import 'package:denwee/db/tables/fact_explanations_table.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

part 'fact_explanations_dao.g.dart';

@LazySingleton()
@DriftAccessor(tables: [FactExplanations])
class FactExplanationsDao extends DatabaseAccessor<AppLocalDatabase>
    with _$FactExplanationsDaoMixin {
  FactExplanationsDao(super.attachedDatabase);

  Future<FactExplanation?> getFactDetails(int id) async {
    final query = select(factExplanations)..where((tbl) => tbl.id.equals(id));
    return query.getSingleOrNull();
  }

  Future<void> upsertFactDetails(FactExplanationsCompanion data) async {
    await into(factExplanations).insertOnConflictUpdate(data);
  }

  Future<void> deleteAll() {
    return (delete(factExplanations)).go();
  }
}
