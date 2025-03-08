import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/data/repository/todo_repository.dart';
import 'package:study_management_app/data/sources/local/todo.dart';


class ToDoListViewModel extends StateNotifier<List<ToDoItemData>> {
  final ToDoRepository _toDoRepository;

  ToDoListViewModel(this._toDoRepository) : super([]) {
    _watchToDoList();
  }

  /// DB의 투두 리스트를 실시간으로 감지하고 상태를 갱신
  void _watchToDoList() {
    _toDoRepository.watchToDoList().listen((list) {
      state = list;
    });
  }

  /// 토글 체크
  Future<void> toggleCheck(int id, bool isChecked) async {
    await _toDoRepository.toggleCheck(id, isChecked);
  }
}

/// 투두 리스트 프로바이더
final toDoListProvider = StateNotifierProvider<ToDoListViewModel,
    List<ToDoItemData>>(
        (ref) => ToDoListViewModel(ref.watch(toDoRepositoryProvider))
);
