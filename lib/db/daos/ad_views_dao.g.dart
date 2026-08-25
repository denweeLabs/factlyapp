// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_views_dao.dart';

// ignore_for_file: type=lint
mixin _$AdViewsDaoMixin on DatabaseAccessor<AppLocalDatabase> {
  $AdViewsTable get adViews => attachedDatabase.adViews;
  AdViewsDaoManager get managers => AdViewsDaoManager(this);
}

class AdViewsDaoManager {
  final _$AdViewsDaoMixin _db;
  AdViewsDaoManager(this._db);
  $$AdViewsTableTableManager get adViews =>
      $$AdViewsTableTableManager(_db.attachedDatabase, _db.adViews);
}
