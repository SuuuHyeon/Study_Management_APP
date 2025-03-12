import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/providers/app_state_provider.dart';
import 'package:study_management_app/presentation/ui/widgets/w_bottom_nav_bar.dart';

import '../../widgets/w_todo_create_modal.dart';
import 'f_calendar.dart';
import 'f_my_page.dart';
import 'f_todo_list.dart';

class MainScreen extends ConsumerWidget {
  static const List<Widget> tabList = <Widget>[
    ToDoListTab(),
    CalendarTab(),
    MyPageTab(),
  ];

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('============> 메인스크린 build');
    final bottomIndex = ref.watch(bottomNavProvider);

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: IndexedStack(
          index: bottomIndex,
          children: tabList,
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: Colors.lightBlueAccent[100],
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return const AddTodoBottomSheet();
            },
          );
        },
      ),
    );
  }
}
