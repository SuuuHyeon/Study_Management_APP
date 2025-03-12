import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'category.dart';

part 'todo.g.dart';

/// 투두 테이블
class ToDoItem extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  DateTimeColumn get startTime => dateTime()();

  TextColumn get category => text()();

  BoolColumn get isChecked => boolean().withDefault(const Constant(false))();

  BoolColumn get isHold => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [ToDoItem, Category])
class AppDatabase extends _$AppDatabase {
  // Singleton instance
  static final AppDatabase _instance = AppDatabase._internal();

  AppDatabase._internal() : super(_openConnection());

  factory AppDatabase() => _instance;


  // 🟢 필터별 투두리스트 Stream
  Stream<List<ToDoItemData>> watchTodayToDos() {
    final now = DateTime.now();
    return (select(toDoItem)
      ..where((tbl) =>
      tbl.startTime.isSmallerOrEqualValue(now) & tbl.isHold.equals(false)))
        .watch();
  }

  Stream<List<ToDoItemData>> watchUpcomingToDos() {
    final now = DateTime.now();
    return (select(toDoItem)
      ..where((tbl) =>
      tbl.startTime.isBiggerThanValue(now) & tbl.isHold.equals(false)))
        .watch();
  }

  Stream<List<ToDoItemData>> watchHoldToDos() {
    return (select(toDoItem)..where((tbl) => tbl.isHold.equals(true))).watch();
  }

  // 🟢 투두 생성
  Future<void> createToDoItem(ToDoItemCompanion data) =>
      into(toDoItem).insert(data);

  // 🟢 체크 상태 토글
  Future<void> toggleCheck(int id, bool isChecked) async {
    await (update(toDoItem)..where((tbl) => tbl.id.equals(id))).write(
      ToDoItemCompanion(isChecked: Value(isChecked)),
    );
  }

  // 카테고리 조회
  Future<List<CategoryData>> getCategoryList() async {
    final categories = await select(category).get();
    print('(database) categories: $categories');
    return categories;
  }

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.addColumn(toDoItem, toDoItem.isHold);
        await customStatement('UPDATE to_do_item SET isHold = 0'); // ✅ 기존 데이터에 기본값 설정
      }
      if (from < 3) {
        await m.createTable(category);
      }
    },
  );


  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'todo_db',
      native: const DriftNativeOptions(
// By default, `driftDatabase` from `package:drift_flutter` stores the
// database files in `getApplicationDocumentsDirectory()`.
//         databaseDirectory: getApplicationSupportDirectory,
          ),
// If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
