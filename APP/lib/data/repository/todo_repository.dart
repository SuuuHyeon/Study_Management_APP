import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/providers/app_state_provider.dart';
import 'package:study_management_app/data/sources/local/todo.dart';

final toDoRepositoryProvider = Provider((ref) {
  final db = ref.watch(dbProvider);
  return ToDoRepository(db);
});

class ToDoRepository {
  final AppDatabase _db;

  ToDoRepository(this._db);

  /// 모든 투두 리스트를 실시간으로 가져오는 스트림
  Stream<List<ToDoItemData>> watchToDoList() {
    return _db.select(_db.toDoItem).watch();
  }

  /// 투두 생성
  Future<void> createToDoItem(ToDoItemCompanion toDo) async {
    _db.createToDoItem(toDo);
  }

  /// 체크 상태 변경
  Future<void> toggleCheck(int id, bool isChecked) async {
    await (_db.update(_db.toDoItem)..where((t) => t.id.equals(id)))
        .write(ToDoItemCompanion(isChecked: Value(isChecked)));
  }
}
