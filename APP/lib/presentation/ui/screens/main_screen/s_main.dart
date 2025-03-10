import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/providers/app_state_provider.dart';
import 'package:study_management_app/presentation/ui/widgets/w_app_bar.dart';
import 'package:study_management_app/presentation/ui/widgets/w_bottom_nav_bar.dart';
import 'package:study_management_app/presentation/ui/widgets/w_todo_filter_segment.dart';

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
        backgroundColor: Colors.white,
        // appBar: CustomAppBar(bottomIndex: bottomIndex),
        // appBar: AppBar(
        //   toolbarHeight: 0,
        // ),
        body: SafeArea(
          child: IndexedStack(
            index: bottomIndex,
            children: tabList,
          ),
        ),
        bottomNavigationBar: const BottomNavBar());
  }
}
