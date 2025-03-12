// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// ignore_for_file: type=lint
class $ToDoItemTable extends ToDoItem
    with TableInfo<$ToDoItemTable, ToDoItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ToDoItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCheckedMeta =
      const VerificationMeta('isChecked');
  @override
  late final GeneratedColumn<bool> isChecked = GeneratedColumn<bool>(
      'is_checked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_checked" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isHoldMeta = const VerificationMeta('isHold');
  @override
  late final GeneratedColumn<bool> isHold = GeneratedColumn<bool>(
      'is_hold', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_hold" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, startTime, category, isChecked, isHold];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'to_do_item';
  @override
  VerificationContext validateIntegrity(Insertable<ToDoItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('is_checked')) {
      context.handle(_isCheckedMeta,
          isChecked.isAcceptableOrUnknown(data['is_checked']!, _isCheckedMeta));
    }
    if (data.containsKey('is_hold')) {
      context.handle(_isHoldMeta,
          isHold.isAcceptableOrUnknown(data['is_hold']!, _isHoldMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ToDoItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ToDoItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      isChecked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_checked'])!,
      isHold: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_hold'])!,
    );
  }

  @override
  $ToDoItemTable createAlias(String alias) {
    return $ToDoItemTable(attachedDatabase, alias);
  }
}

class ToDoItemData extends DataClass implements Insertable<ToDoItemData> {
  final int id;
  final String title;
  final DateTime startTime;
  final String category;
  final bool isChecked;
  final bool isHold;
  const ToDoItemData(
      {required this.id,
      required this.title,
      required this.startTime,
      required this.category,
      required this.isChecked,
      required this.isHold});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['start_time'] = Variable<DateTime>(startTime);
    map['category'] = Variable<String>(category);
    map['is_checked'] = Variable<bool>(isChecked);
    map['is_hold'] = Variable<bool>(isHold);
    return map;
  }

  ToDoItemCompanion toCompanion(bool nullToAbsent) {
    return ToDoItemCompanion(
      id: Value(id),
      title: Value(title),
      startTime: Value(startTime),
      category: Value(category),
      isChecked: Value(isChecked),
      isHold: Value(isHold),
    );
  }

  factory ToDoItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ToDoItemData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      category: serializer.fromJson<String>(json['category']),
      isChecked: serializer.fromJson<bool>(json['isChecked']),
      isHold: serializer.fromJson<bool>(json['isHold']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'startTime': serializer.toJson<DateTime>(startTime),
      'category': serializer.toJson<String>(category),
      'isChecked': serializer.toJson<bool>(isChecked),
      'isHold': serializer.toJson<bool>(isHold),
    };
  }

  ToDoItemData copyWith(
          {int? id,
          String? title,
          DateTime? startTime,
          String? category,
          bool? isChecked,
          bool? isHold}) =>
      ToDoItemData(
        id: id ?? this.id,
        title: title ?? this.title,
        startTime: startTime ?? this.startTime,
        category: category ?? this.category,
        isChecked: isChecked ?? this.isChecked,
        isHold: isHold ?? this.isHold,
      );
  ToDoItemData copyWithCompanion(ToDoItemCompanion data) {
    return ToDoItemData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      category: data.category.present ? data.category.value : this.category,
      isChecked: data.isChecked.present ? data.isChecked.value : this.isChecked,
      isHold: data.isHold.present ? data.isHold.value : this.isHold,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ToDoItemData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('startTime: $startTime, ')
          ..write('category: $category, ')
          ..write('isChecked: $isChecked, ')
          ..write('isHold: $isHold')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, startTime, category, isChecked, isHold);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ToDoItemData &&
          other.id == this.id &&
          other.title == this.title &&
          other.startTime == this.startTime &&
          other.category == this.category &&
          other.isChecked == this.isChecked &&
          other.isHold == this.isHold);
}

class ToDoItemCompanion extends UpdateCompanion<ToDoItemData> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime> startTime;
  final Value<String> category;
  final Value<bool> isChecked;
  final Value<bool> isHold;
  const ToDoItemCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.startTime = const Value.absent(),
    this.category = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.isHold = const Value.absent(),
  });
  ToDoItemCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required DateTime startTime,
    required String category,
    this.isChecked = const Value.absent(),
    this.isHold = const Value.absent(),
  })  : title = Value(title),
        startTime = Value(startTime),
        category = Value(category);
  static Insertable<ToDoItemData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<DateTime>? startTime,
    Expression<String>? category,
    Expression<bool>? isChecked,
    Expression<bool>? isHold,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (startTime != null) 'start_time': startTime,
      if (category != null) 'category': category,
      if (isChecked != null) 'is_checked': isChecked,
      if (isHold != null) 'is_hold': isHold,
    });
  }

  ToDoItemCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<DateTime>? startTime,
      Value<String>? category,
      Value<bool>? isChecked,
      Value<bool>? isHold}) {
    return ToDoItemCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      startTime: startTime ?? this.startTime,
      category: category ?? this.category,
      isChecked: isChecked ?? this.isChecked,
      isHold: isHold ?? this.isHold,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (isChecked.present) {
      map['is_checked'] = Variable<bool>(isChecked.value);
    }
    if (isHold.present) {
      map['is_hold'] = Variable<bool>(isHold.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToDoItemCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('startTime: $startTime, ')
          ..write('category: $category, ')
          ..write('isChecked: $isChecked, ')
          ..write('isHold: $isHold')
          ..write(')'))
        .toString();
  }
}

class $CategoryTable extends Category
    with TableInfo<$CategoryTable, CategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $CategoryTable createAlias(String alias) {
    return $CategoryTable(attachedDatabase, alias);
  }
}

class CategoryData extends DataClass implements Insertable<CategoryData> {
  final int id;
  final String name;
  const CategoryData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory CategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  CategoryData copyWith({int? id, String? name}) => CategoryData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  CategoryData copyWithCompanion(CategoryCompanion data) {
    return CategoryData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryData && other.id == this.id && other.name == this.name);
}

class CategoryCompanion extends UpdateCompanion<CategoryData> {
  final Value<int> id;
  final Value<String> name;
  const CategoryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CategoryCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<CategoryData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  CategoryCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return CategoryCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ToDoItemTable toDoItem = $ToDoItemTable(this);
  late final $CategoryTable category = $CategoryTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [toDoItem, category];
}

typedef $$ToDoItemTableCreateCompanionBuilder = ToDoItemCompanion Function({
  Value<int> id,
  required String title,
  required DateTime startTime,
  required String category,
  Value<bool> isChecked,
  Value<bool> isHold,
});
typedef $$ToDoItemTableUpdateCompanionBuilder = ToDoItemCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<DateTime> startTime,
  Value<String> category,
  Value<bool> isChecked,
  Value<bool> isHold,
});

class $$ToDoItemTableFilterComposer
    extends Composer<_$AppDatabase, $ToDoItemTable> {
  $$ToDoItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isHold => $composableBuilder(
      column: $table.isHold, builder: (column) => ColumnFilters(column));
}

class $$ToDoItemTableOrderingComposer
    extends Composer<_$AppDatabase, $ToDoItemTable> {
  $$ToDoItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isHold => $composableBuilder(
      column: $table.isHold, builder: (column) => ColumnOrderings(column));
}

class $$ToDoItemTableAnnotationComposer
    extends Composer<_$AppDatabase, $ToDoItemTable> {
  $$ToDoItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get isChecked =>
      $composableBuilder(column: $table.isChecked, builder: (column) => column);

  GeneratedColumn<bool> get isHold =>
      $composableBuilder(column: $table.isHold, builder: (column) => column);
}

class $$ToDoItemTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ToDoItemTable,
    ToDoItemData,
    $$ToDoItemTableFilterComposer,
    $$ToDoItemTableOrderingComposer,
    $$ToDoItemTableAnnotationComposer,
    $$ToDoItemTableCreateCompanionBuilder,
    $$ToDoItemTableUpdateCompanionBuilder,
    (ToDoItemData, BaseReferences<_$AppDatabase, $ToDoItemTable, ToDoItemData>),
    ToDoItemData,
    PrefetchHooks Function()> {
  $$ToDoItemTableTableManager(_$AppDatabase db, $ToDoItemTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ToDoItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ToDoItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ToDoItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<DateTime> startTime = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<bool> isHold = const Value.absent(),
          }) =>
              ToDoItemCompanion(
            id: id,
            title: title,
            startTime: startTime,
            category: category,
            isChecked: isChecked,
            isHold: isHold,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required DateTime startTime,
            required String category,
            Value<bool> isChecked = const Value.absent(),
            Value<bool> isHold = const Value.absent(),
          }) =>
              ToDoItemCompanion.insert(
            id: id,
            title: title,
            startTime: startTime,
            category: category,
            isChecked: isChecked,
            isHold: isHold,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ToDoItemTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ToDoItemTable,
    ToDoItemData,
    $$ToDoItemTableFilterComposer,
    $$ToDoItemTableOrderingComposer,
    $$ToDoItemTableAnnotationComposer,
    $$ToDoItemTableCreateCompanionBuilder,
    $$ToDoItemTableUpdateCompanionBuilder,
    (ToDoItemData, BaseReferences<_$AppDatabase, $ToDoItemTable, ToDoItemData>),
    ToDoItemData,
    PrefetchHooks Function()>;
typedef $$CategoryTableCreateCompanionBuilder = CategoryCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$CategoryTableUpdateCompanionBuilder = CategoryCompanion Function({
  Value<int> id,
  Value<String> name,
});

class $$CategoryTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryTable> {
  $$CategoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));
}

class $$CategoryTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryTable> {
  $$CategoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$CategoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryTable> {
  $$CategoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$CategoryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoryTable,
    CategoryData,
    $$CategoryTableFilterComposer,
    $$CategoryTableOrderingComposer,
    $$CategoryTableAnnotationComposer,
    $$CategoryTableCreateCompanionBuilder,
    $$CategoryTableUpdateCompanionBuilder,
    (CategoryData, BaseReferences<_$AppDatabase, $CategoryTable, CategoryData>),
    CategoryData,
    PrefetchHooks Function()> {
  $$CategoryTableTableManager(_$AppDatabase db, $CategoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              CategoryCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              CategoryCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoryTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoryTable,
    CategoryData,
    $$CategoryTableFilterComposer,
    $$CategoryTableOrderingComposer,
    $$CategoryTableAnnotationComposer,
    $$CategoryTableCreateCompanionBuilder,
    $$CategoryTableUpdateCompanionBuilder,
    (CategoryData, BaseReferences<_$AppDatabase, $CategoryTable, CategoryData>),
    CategoryData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ToDoItemTableTableManager get toDoItem =>
      $$ToDoItemTableTableManager(_db, _db.toDoItem);
  $$CategoryTableTableManager get category =>
      $$CategoryTableTableManager(_db, _db.category);
}
