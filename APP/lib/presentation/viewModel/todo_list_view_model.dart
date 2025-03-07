import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/providers/app_state_provider.dart';
import 'package:study_management_app/data/models/dto_todo.dart';

import '../../core/constatnts/todo_filter.dart';


class ToDoListViewModel extends StateNotifier<List<ToDo>> {
  ToDoListViewModel() : super([]) {
    _fetchToDoList();
  }

  ToDoFilter _toDoFilter = ToDoFilter.today;

  ToDoFilter get toDoFilter => _toDoFilter;

  final List<ToDo> _allToDoList = [
    ToDo(id: 1, title: '물마시기', startTime: DateTime.now(), category: '일상'),
    ToDo(id: 2, title: '걷기', startTime: DateTime.now().add(Duration(hours: 1)), category: '일상'),
    ToDo(id: 3, title: '공부관리앱 개발', startTime: DateTime.now().add(Duration(hours: 2)), category: '프로젝트'),
    ToDo(id: 4, title: 'Flutter 공부', startTime: DateTime.now().add(Duration(days: 3)), category: '공부'),
    ToDo(id: 5, title: '애들 약속', startTime: DateTime.now().add(Duration(days: 4)), category: '일상'),
  ];

  void _fetchToDoList() {
    print('todolist fetch');
    _applyFilter();
  }

  void _applyFilter() {
    List<ToDo> filteredList;

    switch (_toDoFilter) {
      case ToDoFilter.today:
        filteredList = _allToDoList.where((todo) => _isToday(todo.startTime)).toList();
        break;
      case ToDoFilter.upcoming:
        filteredList = _allToDoList.where((todo) => todo.startTime.isAfter(DateTime.now())).toList();
        break;
      case ToDoFilter.hold:
        filteredList = _allToDoList.where((todo) => todo.isOnHold).toList();
        break;
      default:
        filteredList = _allToDoList;
        break;
    }

    state = filteredList;
  }

  bool _isToday(DateTime dateTime) {
    final today = DateTime.now();
    return dateTime.year == today.year && dateTime.month == today.month && dateTime.day == today.day;
  }

  void updateFilter(ToDoFilter filter) {
    _toDoFilter = filter;
    _applyFilter();
  }

  void toggle(int todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(isExpected: !todo.isExpected)
        else
          todo,
    ];

  }
}

final toDoListProvider = StateNotifierProvider<ToDoListViewModel, List<ToDo>>(
      (ref) => ToDoListViewModel(),
);
