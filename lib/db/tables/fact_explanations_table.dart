import 'package:drift/drift.dart';

class FactExplanations extends Table {
  IntColumn get id => integer()();
  TextColumn get content => text()();

  @override
  Set<Column> get primaryKey => {id};
}
