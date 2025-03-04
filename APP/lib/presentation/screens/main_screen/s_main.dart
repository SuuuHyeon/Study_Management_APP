import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/providers/bottom_nav_provider.dart';
import 'package:study_management_app/presentation/screens/main_screen/f_home.dart';
import 'package:study_management_app/presentation/widgets/w_app_bar.dart';
import 'package:study_management_app/presentation/widgets/w_bottom_nav_bar.dart';

import 'f_my_page.dart';

class MainScreen extends ConsumerWidget {
  static const List<Widget> tabList = <Widget>[
    HomeTab(),
    MyPageTab(),
  ];

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomIndex = ref.watch(bottomNavProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(),
        body: IndexedStack(
          index: bottomIndex,
          children: tabList,
        ),
        bottomNavigationBar: const BottomNavBar());
  }
}
