import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/data/sources/local/todo.dart';
import 'package:study_management_app/presentation/ui/widgets/w_todo_list_item.dart';
import 'package:study_management_app/presentation/viewModel/todo_list_view_model.dart';

import '../../../../viewModel/cagegory_view_model.dart';

class FilteredToDoList extends ConsumerWidget {
  final List<ToDoItemData> filteredToDoList;

  const FilteredToDoList({
    super.key,
    required this.filteredToDoList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('필터리스트 빌드');
    final selectedCategory = ref.watch(selectedCategoryProvider);

    final categoryFilteredList = selectedCategory == '전체'
        ? filteredToDoList
        : filteredToDoList
            .where((toDo) => toDo.category == selectedCategory)
            .toList();

    print(filteredToDoList);
    print('categoryFilteredList: $categoryFilteredList');
    print('selectedCategory: $selectedCategory');

    if (categoryFilteredList.isEmpty) {
      return const Center(
        child: Text('리스트가 없습니다!',
            style: TextStyle(fontSize: 16, color: Colors.grey)),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 50),
      physics: const ScrollPhysics(),
      itemCount: categoryFilteredList.length,
      itemBuilder: (context, index) {
        final toDoItem = categoryFilteredList[index];
        return ToDoListItem(
          key: ValueKey(toDoItem.id),
          title: toDoItem.title,
          startTime: toDoItem.startTime,
          isChecked: toDoItem.isChecked,
          toggle: (value) {
            print('Checkbox clicked: ${toDoItem.id}');
            ref
                .read(toDoListProvider.notifier)
                .toggleCheck(toDoItem.id, !toDoItem.isChecked);
          },
        );
      },
    );
  }
}
