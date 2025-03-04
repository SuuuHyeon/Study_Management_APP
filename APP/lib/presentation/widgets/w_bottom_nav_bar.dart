import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/providers/bottom_nav_provider.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomIndex = ref.watch(bottomNavProvider);
    return BottomNavigationBar(
      currentIndex: bottomIndex,
      onTap: (index) => ref.read(bottomNavProvider.notifier).state = index,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.person), label: 'my_page'),
      ],
    );
  }
}
