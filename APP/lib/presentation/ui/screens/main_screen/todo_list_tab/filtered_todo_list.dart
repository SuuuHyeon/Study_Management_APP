import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/presentation/ui/widgets/w_to_do_item.dart';
import 'package:study_management_app/presentation/viewModel/todo_list_view_model.dart';
import 'package:study_management_app/data/models/dto_todo.dart';

class FilteredToDoList extends StatelessWidget {
  final List<ToDo> filteredToDoList;
  final WidgetRef ref;

  const FilteredToDoList({super.key, required this.filteredToDoList, required this.ref});

  @override
  Widget build(BuildContext context) {
    // final toDoListNotifier = ref.watch(toDoListProvider.notifier);

    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: filteredToDoList.length,
      itemBuilder: (context, index) {
        final toDoItem = filteredToDoList[index];
        return ToDoItem(
          title: toDoItem.title,
          startTime: toDoItem.startTime,
          isExpected: toDoItem.isExpected,
          toggle: (value) {
            print('Checkbox clicked: ${toDoItem.id}');
            ref.read(toDoListProvider.notifier).toggle(toDoItem.id);
          },
        );
      },
    );
  }
}
