import 'package:drift/drift.dart';

@TableIndex(
  name: 'idx_adviews_profile_viewedAt',
  columns: {#profileId, #viewedAt},
)
class AdViews extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer()();
  DateTimeColumn get viewedAt => dateTime()();
}
