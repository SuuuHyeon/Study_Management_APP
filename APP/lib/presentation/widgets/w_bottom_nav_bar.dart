import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/providers/bottom_nav_provider.dart';

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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
        ],
        selectedItemColor: Colors.black,
        selectedFontSize: 13,
        unselectedFontSize: 11,
      ),
    );
  }
}
