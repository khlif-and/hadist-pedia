// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $JsonCacheTable extends JsonCache
    with TableInfo<$JsonCacheTable, JsonCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JsonCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<int> cachedAt = GeneratedColumn<int>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [filePath, data, cachedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'json_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<JsonCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {filePath};
  @override
  JsonCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JsonCacheData(
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $JsonCacheTable createAlias(String alias) {
    return $JsonCacheTable(attachedDatabase, alias);
  }
}

class JsonCacheData extends DataClass implements Insertable<JsonCacheData> {
  final String filePath;
  final String data;
  final int cachedAt;
  const JsonCacheData({
    required this.filePath,
    required this.data,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['file_path'] = Variable<String>(filePath);
    map['data'] = Variable<String>(data);
    map['cached_at'] = Variable<int>(cachedAt);
    return map;
  }

  JsonCacheCompanion toCompanion(bool nullToAbsent) {
    return JsonCacheCompanion(
      filePath: Value(filePath),
      data: Value(data),
      cachedAt: Value(cachedAt),
    );
  }

  factory JsonCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JsonCacheData(
      filePath: serializer.fromJson<String>(json['filePath']),
      data: serializer.fromJson<String>(json['data']),
      cachedAt: serializer.fromJson<int>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'filePath': serializer.toJson<String>(filePath),
      'data': serializer.toJson<String>(data),
      'cachedAt': serializer.toJson<int>(cachedAt),
    };
  }

  JsonCacheData copyWith({String? filePath, String? data, int? cachedAt}) =>
      JsonCacheData(
        filePath: filePath ?? this.filePath,
        data: data ?? this.data,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  JsonCacheData copyWithCompanion(JsonCacheCompanion data) {
    return JsonCacheData(
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      data: data.data.present ? data.data.value : this.data,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JsonCacheData(')
          ..write('filePath: $filePath, ')
          ..write('data: $data, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(filePath, data, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JsonCacheData &&
          other.filePath == this.filePath &&
          other.data == this.data &&
          other.cachedAt == this.cachedAt);
}

class JsonCacheCompanion extends UpdateCompanion<JsonCacheData> {
  final Value<String> filePath;
  final Value<String> data;
  final Value<int> cachedAt;
  final Value<int> rowid;
  const JsonCacheCompanion({
    this.filePath = const Value.absent(),
    this.data = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JsonCacheCompanion.insert({
    required String filePath,
    required String data,
    required int cachedAt,
    this.rowid = const Value.absent(),
  }) : filePath = Value(filePath),
       data = Value(data),
       cachedAt = Value(cachedAt);
  static Insertable<JsonCacheData> custom({
    Expression<String>? filePath,
    Expression<String>? data,
    Expression<int>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (filePath != null) 'file_path': filePath,
      if (data != null) 'data': data,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JsonCacheCompanion copyWith({
    Value<String>? filePath,
    Value<String>? data,
    Value<int>? cachedAt,
    Value<int>? rowid,
  }) {
    return JsonCacheCompanion(
      filePath: filePath ?? this.filePath,
      data: data ?? this.data,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<int>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JsonCacheCompanion(')
          ..write('filePath: $filePath, ')
          ..write('data: $data, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LikedItemsTable extends LikedItems
    with TableInfo<$LikedItemsTable, LikedItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LikedItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _targetTypeMeta = const VerificationMeta(
    'targetType',
  );
  @override
  late final GeneratedColumn<String> targetType = GeneratedColumn<String>(
    'target_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetFileMeta = const VerificationMeta(
    'targetFile',
  );
  @override
  late final GeneratedColumn<String> targetFile = GeneratedColumn<String>(
    'target_file',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetIndexMeta = const VerificationMeta(
    'targetIndex',
  );
  @override
  late final GeneratedColumn<int> targetIndex = GeneratedColumn<int>(
    'target_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _likedAtMeta = const VerificationMeta(
    'likedAt',
  );
  @override
  late final GeneratedColumn<int> likedAt = GeneratedColumn<int>(
    'liked_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    targetType,
    targetFile,
    targetIndex,
    likedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'liked_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<LikedItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('target_type')) {
      context.handle(
        _targetTypeMeta,
        targetType.isAcceptableOrUnknown(data['target_type']!, _targetTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_targetTypeMeta);
    }
    if (data.containsKey('target_file')) {
      context.handle(
        _targetFileMeta,
        targetFile.isAcceptableOrUnknown(data['target_file']!, _targetFileMeta),
      );
    } else if (isInserting) {
      context.missing(_targetFileMeta);
    }
    if (data.containsKey('target_index')) {
      context.handle(
        _targetIndexMeta,
        targetIndex.isAcceptableOrUnknown(
          data['target_index']!,
          _targetIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetIndexMeta);
    }
    if (data.containsKey('liked_at')) {
      context.handle(
        _likedAtMeta,
        likedAt.isAcceptableOrUnknown(data['liked_at']!, _likedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_likedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LikedItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LikedItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      targetType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_type'],
      )!,
      targetFile: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_file'],
      )!,
      targetIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_index'],
      )!,
      likedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}liked_at'],
      )!,
    );
  }

  @override
  $LikedItemsTable createAlias(String alias) {
    return $LikedItemsTable(attachedDatabase, alias);
  }
}

class LikedItem extends DataClass implements Insertable<LikedItem> {
  final int id;
  final String targetType;
  final String targetFile;
  final int targetIndex;
  final int likedAt;
  const LikedItem({
    required this.id,
    required this.targetType,
    required this.targetFile,
    required this.targetIndex,
    required this.likedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['target_type'] = Variable<String>(targetType);
    map['target_file'] = Variable<String>(targetFile);
    map['target_index'] = Variable<int>(targetIndex);
    map['liked_at'] = Variable<int>(likedAt);
    return map;
  }

  LikedItemsCompanion toCompanion(bool nullToAbsent) {
    return LikedItemsCompanion(
      id: Value(id),
      targetType: Value(targetType),
      targetFile: Value(targetFile),
      targetIndex: Value(targetIndex),
      likedAt: Value(likedAt),
    );
  }

  factory LikedItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LikedItem(
      id: serializer.fromJson<int>(json['id']),
      targetType: serializer.fromJson<String>(json['targetType']),
      targetFile: serializer.fromJson<String>(json['targetFile']),
      targetIndex: serializer.fromJson<int>(json['targetIndex']),
      likedAt: serializer.fromJson<int>(json['likedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'targetType': serializer.toJson<String>(targetType),
      'targetFile': serializer.toJson<String>(targetFile),
      'targetIndex': serializer.toJson<int>(targetIndex),
      'likedAt': serializer.toJson<int>(likedAt),
    };
  }

  LikedItem copyWith({
    int? id,
    String? targetType,
    String? targetFile,
    int? targetIndex,
    int? likedAt,
  }) => LikedItem(
    id: id ?? this.id,
    targetType: targetType ?? this.targetType,
    targetFile: targetFile ?? this.targetFile,
    targetIndex: targetIndex ?? this.targetIndex,
    likedAt: likedAt ?? this.likedAt,
  );
  LikedItem copyWithCompanion(LikedItemsCompanion data) {
    return LikedItem(
      id: data.id.present ? data.id.value : this.id,
      targetType: data.targetType.present
          ? data.targetType.value
          : this.targetType,
      targetFile: data.targetFile.present
          ? data.targetFile.value
          : this.targetFile,
      targetIndex: data.targetIndex.present
          ? data.targetIndex.value
          : this.targetIndex,
      likedAt: data.likedAt.present ? data.likedAt.value : this.likedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LikedItem(')
          ..write('id: $id, ')
          ..write('targetType: $targetType, ')
          ..write('targetFile: $targetFile, ')
          ..write('targetIndex: $targetIndex, ')
          ..write('likedAt: $likedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, targetType, targetFile, targetIndex, likedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LikedItem &&
          other.id == this.id &&
          other.targetType == this.targetType &&
          other.targetFile == this.targetFile &&
          other.targetIndex == this.targetIndex &&
          other.likedAt == this.likedAt);
}

class LikedItemsCompanion extends UpdateCompanion<LikedItem> {
  final Value<int> id;
  final Value<String> targetType;
  final Value<String> targetFile;
  final Value<int> targetIndex;
  final Value<int> likedAt;
  const LikedItemsCompanion({
    this.id = const Value.absent(),
    this.targetType = const Value.absent(),
    this.targetFile = const Value.absent(),
    this.targetIndex = const Value.absent(),
    this.likedAt = const Value.absent(),
  });
  LikedItemsCompanion.insert({
    this.id = const Value.absent(),
    required String targetType,
    required String targetFile,
    required int targetIndex,
    required int likedAt,
  }) : targetType = Value(targetType),
       targetFile = Value(targetFile),
       targetIndex = Value(targetIndex),
       likedAt = Value(likedAt);
  static Insertable<LikedItem> custom({
    Expression<int>? id,
    Expression<String>? targetType,
    Expression<String>? targetFile,
    Expression<int>? targetIndex,
    Expression<int>? likedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (targetType != null) 'target_type': targetType,
      if (targetFile != null) 'target_file': targetFile,
      if (targetIndex != null) 'target_index': targetIndex,
      if (likedAt != null) 'liked_at': likedAt,
    });
  }

  LikedItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? targetType,
    Value<String>? targetFile,
    Value<int>? targetIndex,
    Value<int>? likedAt,
  }) {
    return LikedItemsCompanion(
      id: id ?? this.id,
      targetType: targetType ?? this.targetType,
      targetFile: targetFile ?? this.targetFile,
      targetIndex: targetIndex ?? this.targetIndex,
      likedAt: likedAt ?? this.likedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (targetType.present) {
      map['target_type'] = Variable<String>(targetType.value);
    }
    if (targetFile.present) {
      map['target_file'] = Variable<String>(targetFile.value);
    }
    if (targetIndex.present) {
      map['target_index'] = Variable<int>(targetIndex.value);
    }
    if (likedAt.present) {
      map['liked_at'] = Variable<int>(likedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LikedItemsCompanion(')
          ..write('id: $id, ')
          ..write('targetType: $targetType, ')
          ..write('targetFile: $targetFile, ')
          ..write('targetIndex: $targetIndex, ')
          ..write('likedAt: $likedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $JsonCacheTable jsonCache = $JsonCacheTable(this);
  late final $LikedItemsTable likedItems = $LikedItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [jsonCache, likedItems];
}

typedef $$JsonCacheTableCreateCompanionBuilder =
    JsonCacheCompanion Function({
      required String filePath,
      required String data,
      required int cachedAt,
      Value<int> rowid,
    });
typedef $$JsonCacheTableUpdateCompanionBuilder =
    JsonCacheCompanion Function({
      Value<String> filePath,
      Value<String> data,
      Value<int> cachedAt,
      Value<int> rowid,
    });

class $$JsonCacheTableFilterComposer
    extends Composer<_$AppDatabase, $JsonCacheTable> {
  $$JsonCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JsonCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $JsonCacheTable> {
  $$JsonCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JsonCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $JsonCacheTable> {
  $$JsonCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<int> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$JsonCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JsonCacheTable,
          JsonCacheData,
          $$JsonCacheTableFilterComposer,
          $$JsonCacheTableOrderingComposer,
          $$JsonCacheTableAnnotationComposer,
          $$JsonCacheTableCreateCompanionBuilder,
          $$JsonCacheTableUpdateCompanionBuilder,
          (
            JsonCacheData,
            BaseReferences<_$AppDatabase, $JsonCacheTable, JsonCacheData>,
          ),
          JsonCacheData,
          PrefetchHooks Function()
        > {
  $$JsonCacheTableTableManager(_$AppDatabase db, $JsonCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JsonCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JsonCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JsonCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> filePath = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<int> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JsonCacheCompanion(
                filePath: filePath,
                data: data,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String filePath,
                required String data,
                required int cachedAt,
                Value<int> rowid = const Value.absent(),
              }) => JsonCacheCompanion.insert(
                filePath: filePath,
                data: data,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JsonCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JsonCacheTable,
      JsonCacheData,
      $$JsonCacheTableFilterComposer,
      $$JsonCacheTableOrderingComposer,
      $$JsonCacheTableAnnotationComposer,
      $$JsonCacheTableCreateCompanionBuilder,
      $$JsonCacheTableUpdateCompanionBuilder,
      (
        JsonCacheData,
        BaseReferences<_$AppDatabase, $JsonCacheTable, JsonCacheData>,
      ),
      JsonCacheData,
      PrefetchHooks Function()
    >;
typedef $$LikedItemsTableCreateCompanionBuilder =
    LikedItemsCompanion Function({
      Value<int> id,
      required String targetType,
      required String targetFile,
      required int targetIndex,
      required int likedAt,
    });
typedef $$LikedItemsTableUpdateCompanionBuilder =
    LikedItemsCompanion Function({
      Value<int> id,
      Value<String> targetType,
      Value<String> targetFile,
      Value<int> targetIndex,
      Value<int> likedAt,
    });

class $$LikedItemsTableFilterComposer
    extends Composer<_$AppDatabase, $LikedItemsTable> {
  $$LikedItemsTableFilterComposer({
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

  ColumnFilters<String> get targetType => $composableBuilder(
    column: $table.targetType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetFile => $composableBuilder(
    column: $table.targetFile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetIndex => $composableBuilder(
    column: $table.targetIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get likedAt => $composableBuilder(
    column: $table.likedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LikedItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $LikedItemsTable> {
  $$LikedItemsTableOrderingComposer({
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

  ColumnOrderings<String> get targetType => $composableBuilder(
    column: $table.targetType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetFile => $composableBuilder(
    column: $table.targetFile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetIndex => $composableBuilder(
    column: $table.targetIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get likedAt => $composableBuilder(
    column: $table.likedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LikedItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LikedItemsTable> {
  $$LikedItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get targetType => $composableBuilder(
    column: $table.targetType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get targetFile => $composableBuilder(
    column: $table.targetFile,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetIndex => $composableBuilder(
    column: $table.targetIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get likedAt =>
      $composableBuilder(column: $table.likedAt, builder: (column) => column);
}

class $$LikedItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LikedItemsTable,
          LikedItem,
          $$LikedItemsTableFilterComposer,
          $$LikedItemsTableOrderingComposer,
          $$LikedItemsTableAnnotationComposer,
          $$LikedItemsTableCreateCompanionBuilder,
          $$LikedItemsTableUpdateCompanionBuilder,
          (
            LikedItem,
            BaseReferences<_$AppDatabase, $LikedItemsTable, LikedItem>,
          ),
          LikedItem,
          PrefetchHooks Function()
        > {
  $$LikedItemsTableTableManager(_$AppDatabase db, $LikedItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LikedItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LikedItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LikedItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> targetType = const Value.absent(),
                Value<String> targetFile = const Value.absent(),
                Value<int> targetIndex = const Value.absent(),
                Value<int> likedAt = const Value.absent(),
              }) => LikedItemsCompanion(
                id: id,
                targetType: targetType,
                targetFile: targetFile,
                targetIndex: targetIndex,
                likedAt: likedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String targetType,
                required String targetFile,
                required int targetIndex,
                required int likedAt,
              }) => LikedItemsCompanion.insert(
                id: id,
                targetType: targetType,
                targetFile: targetFile,
                targetIndex: targetIndex,
                likedAt: likedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LikedItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LikedItemsTable,
      LikedItem,
      $$LikedItemsTableFilterComposer,
      $$LikedItemsTableOrderingComposer,
      $$LikedItemsTableAnnotationComposer,
      $$LikedItemsTableCreateCompanionBuilder,
      $$LikedItemsTableUpdateCompanionBuilder,
      (LikedItem, BaseReferences<_$AppDatabase, $LikedItemsTable, LikedItem>),
      LikedItem,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$JsonCacheTableTableManager get jsonCache =>
      $$JsonCacheTableTableManager(_db, _db.jsonCache);
  $$LikedItemsTableTableManager get likedItems =>
      $$LikedItemsTableTableManager(_db, _db.likedItems);
}
