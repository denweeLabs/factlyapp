// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FactExplanationsTable extends FactExplanations
    with TableInfo<$FactExplanationsTable, FactExplanation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FactExplanationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, content];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fact_explanations';
  @override
  VerificationContext validateIntegrity(
    Insertable<FactExplanation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FactExplanation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FactExplanation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
    );
  }

  @override
  $FactExplanationsTable createAlias(String alias) {
    return $FactExplanationsTable(attachedDatabase, alias);
  }
}

class FactExplanation extends DataClass implements Insertable<FactExplanation> {
  final int id;
  final String content;
  const FactExplanation({required this.id, required this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content'] = Variable<String>(content);
    return map;
  }

  FactExplanationsCompanion toCompanion(bool nullToAbsent) {
    return FactExplanationsCompanion(id: Value(id), content: Value(content));
  }

  factory FactExplanation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FactExplanation(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
    };
  }

  FactExplanation copyWith({int? id, String? content}) =>
      FactExplanation(id: id ?? this.id, content: content ?? this.content);
  FactExplanation copyWithCompanion(FactExplanationsCompanion data) {
    return FactExplanation(
      id: data.id.present ? data.id.value : this.id,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FactExplanation(')
          ..write('id: $id, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FactExplanation &&
          other.id == this.id &&
          other.content == this.content);
}

class FactExplanationsCompanion extends UpdateCompanion<FactExplanation> {
  final Value<int> id;
  final Value<String> content;
  const FactExplanationsCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
  });
  FactExplanationsCompanion.insert({
    this.id = const Value.absent(),
    required String content,
  }) : content = Value(content);
  static Insertable<FactExplanation> custom({
    Expression<int>? id,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
    });
  }

  FactExplanationsCompanion copyWith({Value<int>? id, Value<String>? content}) {
    return FactExplanationsCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FactExplanationsCompanion(')
          ..write('id: $id, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $AdViewsTable extends AdViews with TableInfo<$AdViewsTable, AdView> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdViewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _viewedAtMeta = const VerificationMeta(
    'viewedAt',
  );
  @override
  late final GeneratedColumn<DateTime> viewedAt = GeneratedColumn<DateTime>(
    'viewed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, profileId, viewedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ad_views';
  @override
  VerificationContext validateIntegrity(
    Insertable<AdView> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('viewed_at')) {
      context.handle(
        _viewedAtMeta,
        viewedAt.isAcceptableOrUnknown(data['viewed_at']!, _viewedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_viewedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AdView map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdView(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      viewedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}viewed_at'],
      )!,
    );
  }

  @override
  $AdViewsTable createAlias(String alias) {
    return $AdViewsTable(attachedDatabase, alias);
  }
}

class AdView extends DataClass implements Insertable<AdView> {
  final int id;
  final int profileId;
  final DateTime viewedAt;
  const AdView({
    required this.id,
    required this.profileId,
    required this.viewedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['viewed_at'] = Variable<DateTime>(viewedAt);
    return map;
  }

  AdViewsCompanion toCompanion(bool nullToAbsent) {
    return AdViewsCompanion(
      id: Value(id),
      profileId: Value(profileId),
      viewedAt: Value(viewedAt),
    );
  }

  factory AdView.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdView(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      viewedAt: serializer.fromJson<DateTime>(json['viewedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'viewedAt': serializer.toJson<DateTime>(viewedAt),
    };
  }

  AdView copyWith({int? id, int? profileId, DateTime? viewedAt}) => AdView(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    viewedAt: viewedAt ?? this.viewedAt,
  );
  AdView copyWithCompanion(AdViewsCompanion data) {
    return AdView(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      viewedAt: data.viewedAt.present ? data.viewedAt.value : this.viewedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AdView(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('viewedAt: $viewedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, profileId, viewedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdView &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.viewedAt == this.viewedAt);
}

class AdViewsCompanion extends UpdateCompanion<AdView> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<DateTime> viewedAt;
  const AdViewsCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.viewedAt = const Value.absent(),
  });
  AdViewsCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required DateTime viewedAt,
  }) : profileId = Value(profileId),
       viewedAt = Value(viewedAt);
  static Insertable<AdView> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<DateTime>? viewedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (viewedAt != null) 'viewed_at': viewedAt,
    });
  }

  AdViewsCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<DateTime>? viewedAt,
  }) {
    return AdViewsCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      viewedAt: viewedAt ?? this.viewedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (viewedAt.present) {
      map['viewed_at'] = Variable<DateTime>(viewedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdViewsCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('viewedAt: $viewedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppLocalDatabase extends GeneratedDatabase {
  _$AppLocalDatabase(QueryExecutor e) : super(e);
  $AppLocalDatabaseManager get managers => $AppLocalDatabaseManager(this);
  late final $FactExplanationsTable factExplanations = $FactExplanationsTable(
    this,
  );
  late final $AdViewsTable adViews = $AdViewsTable(this);
  late final Index idxAdviewsProfileViewedAt = Index(
    'idx_adviews_profile_viewedAt',
    'CREATE INDEX idx_adviews_profile_viewedAt ON ad_views (profile_id, viewed_at)',
  );
  late final FactExplanationsDao factExplanationsDao = FactExplanationsDao(
    this as AppLocalDatabase,
  );
  late final AdViewsDao adViewsDao = AdViewsDao(this as AppLocalDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    factExplanations,
    adViews,
    idxAdviewsProfileViewedAt,
  ];
}

typedef $$FactExplanationsTableCreateCompanionBuilder =
    FactExplanationsCompanion Function({
      Value<int> id,
      required String content,
    });
typedef $$FactExplanationsTableUpdateCompanionBuilder =
    FactExplanationsCompanion Function({Value<int> id, Value<String> content});

class $$FactExplanationsTableFilterComposer
    extends Composer<_$AppLocalDatabase, $FactExplanationsTable> {
  $$FactExplanationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FactExplanationsTableOrderingComposer
    extends Composer<_$AppLocalDatabase, $FactExplanationsTable> {
  $$FactExplanationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FactExplanationsTableAnnotationComposer
    extends Composer<_$AppLocalDatabase, $FactExplanationsTable> {
  $$FactExplanationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);
}

class $$FactExplanationsTableTableManager
    extends
        RootTableManager<
          _$AppLocalDatabase,
          $FactExplanationsTable,
          FactExplanation,
          $$FactExplanationsTableFilterComposer,
          $$FactExplanationsTableOrderingComposer,
          $$FactExplanationsTableAnnotationComposer,
          $$FactExplanationsTableCreateCompanionBuilder,
          $$FactExplanationsTableUpdateCompanionBuilder,
          (
            FactExplanation,
            BaseReferences<
              _$AppLocalDatabase,
              $FactExplanationsTable,
              FactExplanation
            >,
          ),
          FactExplanation,
          PrefetchHooks Function()
        > {
  $$FactExplanationsTableTableManager(
    _$AppLocalDatabase db,
    $FactExplanationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FactExplanationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FactExplanationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FactExplanationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> content = const Value.absent(),
              }) => FactExplanationsCompanion(id: id, content: content),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String content,
              }) => FactExplanationsCompanion.insert(id: id, content: content),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FactExplanationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppLocalDatabase,
      $FactExplanationsTable,
      FactExplanation,
      $$FactExplanationsTableFilterComposer,
      $$FactExplanationsTableOrderingComposer,
      $$FactExplanationsTableAnnotationComposer,
      $$FactExplanationsTableCreateCompanionBuilder,
      $$FactExplanationsTableUpdateCompanionBuilder,
      (
        FactExplanation,
        BaseReferences<
          _$AppLocalDatabase,
          $FactExplanationsTable,
          FactExplanation
        >,
      ),
      FactExplanation,
      PrefetchHooks Function()
    >;
typedef $$AdViewsTableCreateCompanionBuilder =
    AdViewsCompanion Function({
      Value<int> id,
      required int profileId,
      required DateTime viewedAt,
    });
typedef $$AdViewsTableUpdateCompanionBuilder =
    AdViewsCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<DateTime> viewedAt,
    });

class $$AdViewsTableFilterComposer
    extends Composer<_$AppLocalDatabase, $AdViewsTable> {
  $$AdViewsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get viewedAt => $composableBuilder(
    column: $table.viewedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AdViewsTableOrderingComposer
    extends Composer<_$AppLocalDatabase, $AdViewsTable> {
  $$AdViewsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get viewedAt => $composableBuilder(
    column: $table.viewedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AdViewsTableAnnotationComposer
    extends Composer<_$AppLocalDatabase, $AdViewsTable> {
  $$AdViewsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<DateTime> get viewedAt =>
      $composableBuilder(column: $table.viewedAt, builder: (column) => column);
}

class $$AdViewsTableTableManager
    extends
        RootTableManager<
          _$AppLocalDatabase,
          $AdViewsTable,
          AdView,
          $$AdViewsTableFilterComposer,
          $$AdViewsTableOrderingComposer,
          $$AdViewsTableAnnotationComposer,
          $$AdViewsTableCreateCompanionBuilder,
          $$AdViewsTableUpdateCompanionBuilder,
          (AdView, BaseReferences<_$AppLocalDatabase, $AdViewsTable, AdView>),
          AdView,
          PrefetchHooks Function()
        > {
  $$AdViewsTableTableManager(_$AppLocalDatabase db, $AdViewsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdViewsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AdViewsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AdViewsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<DateTime> viewedAt = const Value.absent(),
              }) => AdViewsCompanion(
                id: id,
                profileId: profileId,
                viewedAt: viewedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required DateTime viewedAt,
              }) => AdViewsCompanion.insert(
                id: id,
                profileId: profileId,
                viewedAt: viewedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AdViewsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppLocalDatabase,
      $AdViewsTable,
      AdView,
      $$AdViewsTableFilterComposer,
      $$AdViewsTableOrderingComposer,
      $$AdViewsTableAnnotationComposer,
      $$AdViewsTableCreateCompanionBuilder,
      $$AdViewsTableUpdateCompanionBuilder,
      (AdView, BaseReferences<_$AppLocalDatabase, $AdViewsTable, AdView>),
      AdView,
      PrefetchHooks Function()
    >;

class $AppLocalDatabaseManager {
  final _$AppLocalDatabase _db;
  $AppLocalDatabaseManager(this._db);
  $$FactExplanationsTableTableManager get factExplanations =>
      $$FactExplanationsTableTableManager(_db, _db.factExplanations);
  $$AdViewsTableTableManager get adViews =>
      $$AdViewsTableTableManager(_db, _db.adViews);
}
