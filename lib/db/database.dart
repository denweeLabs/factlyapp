import 'dart:io';

import 'package:denwee/db/daos/ad_views_dao.dart';
import 'package:denwee/db/daos/fact_explanations_dao.dart';
import 'package:denwee/db/tables/ad_views_table.dart';
import 'package:denwee/db/tables/fact_explanations_table.dart';
import 'package:denwee/di/di.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'database.g.dart';

@LazySingleton()
@DriftDatabase(
  tables: [
    FactExplanations,
    AdViews,
  ],
  daos: [
    FactExplanationsDao,
    AdViewsDao,
  ],
)
class AppLocalDatabase extends _$AppLocalDatabase {
  AppLocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        // Version 1 -> 2
        if (from <= 1 && to >= 2) {
          await m.createTable(adViews);
        }

        // other migrations here...
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final envPrefix = getIt<String>(instanceName: 'ENV_PREFIX');
    final file = File(path.join(dbFolder.path, '$envPrefix}db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
