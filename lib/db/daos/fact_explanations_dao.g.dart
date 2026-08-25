// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_explanations_dao.dart';

// ignore_for_file: type=lint
mixin _$FactExplanationsDaoMixin on DatabaseAccessor<AppLocalDatabase> {
  $FactExplanationsTable get factExplanations =>
      attachedDatabase.factExplanations;
  FactExplanationsDaoManager get managers => FactExplanationsDaoManager(this);
}

class FactExplanationsDaoManager {
  final _$FactExplanationsDaoMixin _db;
  FactExplanationsDaoManager(this._db);
  $$FactExplanationsTableTableManager get factExplanations =>
      $$FactExplanationsTableTableManager(
        _db.attachedDatabase,
        _db.factExplanations,
      );
}
