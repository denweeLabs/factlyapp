import 'package:denwee/db/database.dart';
import 'package:denwee/db/tables/ad_views_table.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

part 'ad_views_dao.g.dart';

@LazySingleton()
@DriftAccessor(tables: [AdViews])
class AdViewsDao extends DatabaseAccessor<AppLocalDatabase>
    with _$AdViewsDaoMixin {
  AdViewsDao(super.attachedDatabase);

  Future<int> addUserView(int profileId) {
    final newInsert = AdViewsCompanion.insert(
      profileId: profileId,
      viewedAt: DateTime.now().toUtc(),
    );
    return into(adViews).insert(newInsert);
  }

  Future<int> userViewsCount(
    int profileId,
    DateTime start,
    DateTime end,
  ) async {
    start = start.toUtc();
    end = end.toUtc();
    final condition =
        adViews.profileId.equals(profileId) &
        adViews.viewedAt.isBetweenValues(start, end);
    final countExpr = adViews.id.count();
    final result = await (selectOnly(adViews)
      ..addColumns([countExpr])
      ..where(condition))
    .getSingle();
    return result.read(countExpr) ?? 0;
  }

  Future<int> totalUserViewsCount(int profileId) async {
    final condition = adViews.profileId.equals(profileId);
    final countExpr = adViews.id.count();
    final result = await (selectOnly(adViews)
      ..addColumns([countExpr])
      ..where(condition))
    .getSingle();
    return result.read(countExpr) ?? 0;
  }
}
