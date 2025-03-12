import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/data/repository/todo_repository.dart';
import 'package:study_management_app/data/sources/local/todo.dart';

import '../../data/models/todo_category.dart';

// 🟢 카테고리 리스트 상태 관리
class CategoryViewModel extends StateNotifier<List<CategoryData>> {
  final ToDoRepository _repository;

  CategoryViewModel(this._repository) : super(<CategoryData>[]) {
    getCategoryList();
  }

  Future<void> getCategoryList() async {
    final categories = await _repository.getCategoryList(); // ✅ 데이터를 가져올 때 await 추가
    state = categories; // ✅ 상태 업데이트
    print('Loaded categories: $state'); // ✅ 업데이트된 state 출력
  }
}

final categoryProvider =
    StateNotifierProvider<CategoryViewModel, List<CategoryData>>(
  (ref) => CategoryViewModel(ref.watch(toDoRepositoryProvider)),
);

// 🟢 선택된 카테고리 상태 관리 (중복 불가)
final selectedCategoryProvider = StateProvider<String>((ref) => '전체');
