import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/constatnts/todo_filter.dart';
import 'package:study_management_app/core/providers/app_state_provider.dart';

import '../../viewModel/todo_list_view_model.dart';

class ToDoFilterSegment extends ConsumerWidget {
  final ToDoFilter currentFilter;
  final ValueChanged<ToDoFilter> onFilterChanged;

  const ToDoFilterSegment(
      {super.key, required this.currentFilter, required this.onFilterChanged,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('segment위젯 빌드');
    final currentToDoFilter = ref.watch(toDoFilterProvider);

    return CustomSlidingSegmentedControl<ToDoFilter>(
        initialValue: currentToDoFilter,
        children: const {
          ToDoFilter.today: Text('오늘'),
          ToDoFilter.upcoming: Text('예정'),
          ToDoFilter.hold: Text('보류'),
        },
        fixedWidth: MediaQuery
            .of(context)
            .size
            .width / 6,
        height: 35,
        decoration: BoxDecoration(
          color: CupertinoColors.lightBackgroundGray,
          borderRadius: BorderRadius.circular(8),
        ),
        thumbDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.3),
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: const Offset(
                0.0,
                2.0,
              ),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastLinearToSlowEaseIn,
        onValueChanged: onFilterChanged,
    );
  }
}
