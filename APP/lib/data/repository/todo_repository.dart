import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/providers/app_state_provider.dart';
import 'package:study_management_app/core/util/date_util.dart';
import 'package:study_management_app/data/sources/local/todo.dart';

final toDoRepositoryProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  return ToDoRepository(db);
});

class ToDoRepository {
  final AppDatabase _db;

  ToDoRepository(this._db);

  bool isToday(DateTime dateTime) {
    // 현재 날짜 가져오기
    final today = DateTime.now();

    // 오늘 날짜와 비교 (시간은 무시하고 날짜만 비교)
    return dateTime.year == today.year &&
        dateTime.month == today.month &&
        dateTime.day == today.day;
  }

  /// 🟢 오늘의 투두 리스트 스트림
  Stream<List<ToDoItemData>> watchTodayToDos() {
    final now = DateTime.now();
    return (_db.select(_db.toDoItem)
          ..where((tbl) =>
              tbl.startTime.day.equals(now.day) &
              tbl.startTime.month.equals(now.month) &
              tbl.startTime.year.equals(now.year) &
              tbl.isHold.equals(false)))
        .watch();
  }

  /// 🟢 예정된 투두 리스트 스트림
  Stream<List<ToDoItemData>> watchUpcomingToDos() {
    final now = DateTime.now();
    return (_db.select(_db.toDoItem)
          ..where((tbl) =>
              tbl.startTime.isBiggerThanValue(now) & tbl.isHold.equals(false)))
        .watch();
  }

  /// 🟢 보류된 투두 리스트 스트림
  Stream<List<ToDoItemData>> watchHoldToDos() {
    return (_db.select(_db.toDoItem)..where((tbl) => tbl.isHold.equals(true)))
        .watch();
  }

  /// 🟢 모든 투두 리스트를 실시간으로 가져오는 스트림 (기존 코드 유지)
  Stream<List<ToDoItemData>> watchToDoList() {
    return _db.select(_db.toDoItem).watch();
  }

  /// 🟢 투두 생성
  Future<void> createToDoItem(ToDoItemCompanion toDo) async {
    await _db.createToDoItem(toDo);
  }

  /// 🟢 체크 상태 변경
  Future<void> toggleCheck(int id, bool isChecked) async {
    await (_db.update(_db.toDoItem)..where((t) => t.id.equals(id)))
        .write(ToDoItemCompanion(isChecked: Value(isChecked)));
  }
}
