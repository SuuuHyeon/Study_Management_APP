import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/constatnts/todo_filter.dart';
import 'package:study_management_app/core/providers/app_state_provider.dart';
import 'package:study_management_app/presentation/ui/widgets/w_todo_filter_segment.dart';
import 'package:study_management_app/presentation/viewModel/todo_list_view_model.dart';
import 'package:study_management_app/presentation/ui/screens/main_screen/todo_list_tab/filtered_todo_list.dart';

class ToDoListTab extends ConsumerWidget {
  const ToDoListTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('투두리스트탭 빌드');
    final currentFilter = ref.watch(toDoFilterProvider); // 투두리스트 필터 상태
    final filteredLists = ref.watch(toDoListProvider); // 투두리스트 프로바이더 구독
    final filteredList = filteredLists[currentFilter] ?? []; // 필터별 투두리스트

    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        FilteredToDoList(
          key: PageStorageKey(currentFilter), // currentFilter로 key 값 설정 -> 스크롤 상태 유지
          filteredToDoList: filteredList,
        ),
        Positioned(
          bottom: 10,
          child: ToDoFilterSegment(
            currentFilter: currentFilter,
            onFilterChanged: (filter) =>
                ref.read(toDoFilterProvider.notifier).state = filter,
          ),
        ),
      ],
    );
  }
}
