import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/providers/app_state_provider.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomIndex = ref.watch(bottomNavProvider);
    return Container(
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 0.2, color: Colors.black.withOpacity(0.2)),
      )),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: bottomIndex,
        onTap: (index) => ref.read(bottomNavProvider.notifier).state = index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: '할 일'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: '캘린더'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
        ],
        selectedItemColor: Colors.black,
        selectedFontSize: 13,
        unselectedFontSize: 11,
      ),
    );
  }
}
