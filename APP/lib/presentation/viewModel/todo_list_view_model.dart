import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/constatnts/todo_filter.dart';
import 'package:study_management_app/core/providers/app_state_provider.dart';
import 'package:study_management_app/data/repository/todo_repository.dart';
import 'package:study_management_app/data/sources/local/todo.dart';

class ToDoListViewModel
    extends StateNotifier<Map<ToDoFilter, List<ToDoItemData>>> {
  final ToDoRepository _repository;
  final List<StreamSubscription> _subscriptions = [];

  ToDoListViewModel(this._repository)
      : super({
          ToDoFilter.today: [],
          ToDoFilter.upcoming: [],
          ToDoFilter.hold: [],
        }) {
    _initListeners();
  }

  void _initListeners() {
    /// 오늘의 투두리스트 stream
    _subscriptions.add(_repository.watchTodayToDos().listen((list) {
      if (mounted) {
        state = {
          ...state,
          ToDoFilter.today: list,
        };
      }
    }));

    /// 예정된 투두리스트
    _subscriptions.add(_repository.watchUpcomingToDos().listen((list) {
      if (mounted) {
        state = {
          ...state,
          ToDoFilter.upcoming: list,
        };
      }
    }));

    /// 보류 투두리스트
    _subscriptions.add(_repository.watchHoldToDos().listen((list) {
      if (mounted) {
        state = {
          ...state,
          ToDoFilter.hold: list,
        };
      }
    }));
  }

  /// 체크박스 클릭
  Future<void> toggleCheck(int id, bool isChecked) async {
    await _repository.toggleCheck(id, isChecked);
  }

  @override
  void dispose() {
    for (final sub in _subscriptions) {
      sub.cancel(); // 🟢 구독 해제
    }
    super.dispose();
  }
}

/// 투두리스트 프로바이더
final toDoListProvider = StateNotifierProvider.autoDispose<ToDoListViewModel,
    Map<ToDoFilter, List<ToDoItemData>>>((ref) {
  print('autoDispose test');
  final repository = ref.watch(toDoRepositoryProvider);
  return ToDoListViewModel(repository);
});
