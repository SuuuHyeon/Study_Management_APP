import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/constatnts/todo_filter.dart';
import 'package:study_management_app/presentation/ui/widgets/w_todo_filter_segment.dart';
import 'package:study_management_app/presentation/viewModel/todo_list_view_model.dart';
import 'package:study_management_app/presentation/ui/screens/main_screen/todo_list_tab/filtered_todo_list.dart';

class ToDoListTab extends ConsumerWidget {
  const ToDoListTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 투두 리스트
    final toDoList = ref.watch(toDoListProvider);
    print('=============> 투두리스트 탭 build: ${toDoList.toString()}');

    return Stack(
      alignment: Alignment.center,
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Todo',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FilteredToDoList(filteredToDoList: toDoList, ref: ref),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: ToDoFilterSegment(
              currentFilter: ToDoFilter.today,
              onFilterChanged: (value) => print('세그먼트 클릭')
              // ref.read(toDoListProvider.notifier).updateFilter(value),
              ),
        ),
      ],
    );
  }
}
