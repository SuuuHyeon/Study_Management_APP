import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'todo.g.dart';

/// 투두 테이블
class ToDoItem extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  DateTimeColumn get startTime => dateTime().nullable()();

  TextColumn get category => text()();

  BoolColumn get isChecked => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [ToDoItem])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // 투두리스트 조회
  Future<List<ToDoItemData>> getToDoList() => select(toDoItem).get();
  // 투두 생성
  Future<void> createToDoItem(ToDoItemCompanion data) =>
      into(toDoItem).insert(data);

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;

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
