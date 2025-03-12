import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/presentation/viewModel/todo_list_view_model.dart';

/// 투두 아이템 위젯
class ToDoListItem extends StatelessWidget {
  final String title;
  final DateTime? startTime;
  final bool isChecked;
  final ValueChanged<bool?> toggle;

  const ToDoListItem({
    super.key,
    required this.title,
    required this.startTime,
    required this.isChecked,
    required this.toggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 6, bottom: 6, left: 5, right: 5),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Icon(Icons.circle, size: 16),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text('${startTime?.month}월 ${startTime?.day}일'),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Checkbox(
                      value: isChecked,
                      onChanged: toggle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
