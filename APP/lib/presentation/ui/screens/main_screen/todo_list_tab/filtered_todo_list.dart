import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/constatnts/todo_filter.dart';
import 'package:study_management_app/data/sources/local/todo.dart';
import 'package:study_management_app/presentation/ui/widgets/w_todo_list_item.dart';
import 'package:study_management_app/presentation/viewModel/todo_list_view_model.dart';

class FilteredToDoList extends ConsumerWidget {
  final List<ToDoItemData> filteredToDoList;

  const FilteredToDoList({super.key, required this.filteredToDoList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('필터리스트 빌드');

    return ListView.builder(
      padding: EdgeInsets.fromLTRB(16, 15, 16, 50),
      physics: const ScrollPhysics(),
      itemCount: filteredToDoList.length,
      itemBuilder: (context, index) {
        final toDoItem = filteredToDoList[index];
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
