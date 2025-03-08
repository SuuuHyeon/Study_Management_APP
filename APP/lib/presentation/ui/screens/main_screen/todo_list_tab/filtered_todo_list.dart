import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/data/sources/local/todo.dart';
import 'package:study_management_app/presentation/ui/widgets/w_todo_list_item.dart';
import 'package:study_management_app/presentation/viewModel/todo_list_view_model.dart';

class FilteredToDoList extends StatelessWidget {
  final List<ToDoItemData> filteredToDoList;
  final WidgetRef ref;

  const FilteredToDoList({super.key, required this.filteredToDoList, required this.ref});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: filteredToDoList.length,
      itemBuilder: (context, index) {
        final toDoItem = filteredToDoList[index];
        return ToDoListItem(
          title: toDoItem.title,
          startTime: toDoItem.startTime,
          isChecked: toDoItem.isChecked,
          toggle: (value) {
            print('Checkbox clicked: ${toDoItem.id}');
            ref.read(toDoListProvider.notifier).toggleCheck(toDoItem.id, !toDoItem.isChecked);
          },
        );
      },
    );
  }
}
